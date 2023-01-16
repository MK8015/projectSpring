<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/adminHeader.jsp" %>
<script>
$(document).ready(function(){
	

	$("#insertOrder").click(function(e){
		e.preventDefault();
		$(".orderForm:gt(0)").parent().parent().remove();
		var form = $(".orderForm").eq(0).clone();
		form.attr("class","insertOrderForm");
		form.css("display","");
		$(this).parent().append(form);
	});
	
	$(".orderInfo").on("click","td",function(e){
		e.preventDefault();
		$(".insertOrderForm").remove();
		$(".orderForm:gt(0)").parent().parent().remove();
		var form = $(".orderForm").eq(0).clone();
		var tds = $(this).parent().find("td");
		var order_no = tds.eq(0).text();
		console.log(order_no);
		var tr = $(this).parent();
		$.post("/spring/admin/detailOrder",{"order_no":order_no},function(rData){
			var jsonObject = JSON.parse(rData);
			var inputs = form.find("input");
			inputs.eq(0).attr("readonly","true").val(jsonObject.order_no);
			inputs.eq(1).val(jsonObject.member_id);
			inputs.eq(2).val(jsonObject.product_id);
			inputs.eq(3).val(jsonObject.order_amount);
			inputs.eq(4).val(jsonObject.order_address);
			inputs.eq(5).val(jsonObject.order_address_detail);
			inputs.eq(6).val(jsonObject.order_phonenum);
			inputs.eq(7).val(jsonObject.order_date);
			form.css("display","");
			tr.after("<tr><td colspan='5'></td></tr>");
			var td = tr.next().find("td");
			form.find("a").attr("href","/spring/admin/deleteOrder?order_no="+jsonObject.order_no);
			form.find("form").attr("action","/spring/admin/updateOrder");
			td.append(form);
			
		});
	});
	
});
</script>

	<!--  입력,수정 양식 -->
	<div style="margin: 10px; display: none" class="orderForm">
		<form role="form" action="/spring/admin/insertOrder" method="post">
			<div class="form-group">
				주문 번호
				<input type="text" class="form-control" placeholder="주문 번호" name="order_no"/>
			</div>
			<div class="form-group">
				주문한 회원
				<input type="text" class="form-control" placeholder="주문한 회원" name="member_id"/>
			</div>
			<div class="form-group">
				주문한 상품
				<input type="text" class="form-control" placeholder="주문한 상품" name="product_id"/>
			</div>
			<div class="form-group">
				수량
				<input type="number" class="form-control" placeholder="수량" name="order_amount"/>
			</div>
			<div class="form-group">
				배송지
				<input type="text" class="form-control" placeholder="배송지" name="order_address"/>
			</div>
			<div class="form-group">
				상세 주소
				<input type="text" class="form-control" placeholder="상세 주소" name="address_detail"/>
			</div>		
			<div class="form-group">
				전화번호
				<input type="text" class="form-control" placeholder="전화번호" name="order_phonenum"/>
			</div>
			<div class="form-group">
				주문 날짜
				<input type="text" class="form-control" placeholder="주문 날짜" name="order_date"/>
			</div>
			<button type="submit" class="site-smbtn">작성 완료</button>
			<a href="#" class="site-smbtn">삭제</a>
		</form>
	</div>



<!-- 오른쪽 관리 부분 -->
<div class="col-lg-10 col-md-7 order-md-1 order-1">
	<div class="mypage_title">
		<h3>주문 관리</h3>
		<p style="text-align: center; margin-bottom: 3px; margin-top: 7px;">
			항목을 누르면 수정/삭제 가능</p>
		<p style="text-align: center; padding-top: 7px;">
			<a href="#" class="mypage-btn" id="insertOrder">주문 입력</a></p>
	</div>
	
<table class="table table-hover" style="table-layout: fixed">
	<thead>
		<tr>
			<th>주문 번호</th>
			<th>주문한 아이디</th>
			<th>책 이름</th>
			<th>수량</th>
			<th>가격</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list}" var="orderVo">
		<tr class="orderInfo">
			<td>${orderVo.order_no}</td>
			<td>${orderVo.member_id}</td>
			<td>${orderVo.product_name}</td>
			<td>${orderVo.order_amount}</td>
			<td>${orderVo.price}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</div>

</div>
</div>
</section>
<!-- 끝 -->


<%@ include file="../include/footer.jsp" %>
</body>

</html>

