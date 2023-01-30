<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/adminHeader.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(document).ready(function(){
	var openDetail = false;
	//주문 입력 양식
	$("#insertOrder").click(function(e){
		e.preventDefault();
		openDetail = !openDetail;
		if(openDetail){
			$(".orderForm:gt(0)").parent().parent().remove();
			var form = $(".orderForm").eq(0).clone();
			form.attr("class","insertOrderForm");
			form.css("display","");
			$(this).parent().append(form);
		}else{
			$(".insertOrderForm").remove();
			$(".orderForm:gt(0)").parent().parent().remove();
		}
	});
	//주문 상세 열기
	$(".orderInfo").on("click","td",function(e){
		e.preventDefault();
		openDetail = !openDetail;
		if(openDetail){
			$(".insertOrderForm").remove();
			$(".orderForm:gt(0)").parent().parent().remove();
			var form = $(".orderForm").eq(0).clone();
			var tds = $(this).parent().find("td");
			var order_no = tds.eq(0).text();
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
				inputs.eq(7).parent().parent().css("display","");
				form.css("display","");
				tr.after("<tr><td colspan='5'></td></tr>");
				var td = tr.next().find("td");
				form.find("a").attr("href","/spring/admin/deleteOrder?order_no="+jsonObject.order_no).css("display","");
				form.find("form").attr("action","/spring/admin/updateOrder");
				td.append(form);
				
			});
		}else{
			$(".insertOrderForm").remove();
			$(".orderForm:gt(0)").parent().parent().remove();
		}
	});
	
	$(document).on("click",".address",function(){
		var address = $(this);
		 new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	            	address.val(data.address); // 주소 넣기
	            	address.parent().next().find("input").focus(); //상세입력 포커싱
	            }
	        }).open();
	});
});
</script>

	<!--  입력,수정 양식 -->
	<div style="margin: 10px; display: none" class="orderForm">
		<form role="form" action="/spring/admin/insertOrder" method="post">
			
			<div class="form-gruop row">
				<div class="col-lg-2">
					<p style="text-align: left; padding-top: 13px;">주문 번호</p>
				</div>
				<div class="col-lg-10">
					<input type="text" class="mypage__input" placeholder="주문 번호" name="order_no"/>
				</div>
			</div>
			
			<div class="form-gruop row">
				<div class="col-lg-2">
					<p style="text-align: left; padding-top: 13px;">주문한 회원</p>
				</div>
				<div class="col-lg-10">
					<input type="text" class="mypage__input" placeholder="주문한 회원" name="member_id"/>
				</div>
			</div>
			
			<div class="form-gruop row">
				<div class="col-lg-2">
					<p style="text-align: left; padding-top: 13px;">주문한 상품</p>
				</div>
				<div class="col-lg-10">
					<input type="text" class="mypage__input" placeholder="주문한 상품" name="product_id"/>
				</div>
			</div>
			
			<div class="form-gruop row">
				<div class="col-lg-2">
					<p style="text-align: left; padding-top: 13px;">수량</p>
				</div>
				<div class="col-lg-10">
					<input type="text" class="mypage__input" placeholder="수량" name="order_amount"/>
				</div>
			</div>
			
			
			<div class="form-gruop row">
				<div class="col-lg-2">
					<p style="text-align: left; padding-top: 13px;">배송지</p>
				</div>
				<div class="col-lg-10">
					<input type="text" class="mypage__input address" 
						  placeholder="배송지" name="order_address" style="margin-bottom: 10px;">
					<input type="text" class="mypage__input address_detail"
						  placeholder="상세주소" name="order_address_detail">
				</div>
			</div>
			
			
			<div class="form-gruop row">
				<div class="col-lg-2">
					<p style="text-align: left; padding-top: 13px;">전화번호</p>
				</div>
				<div class="col-lg-10">
					<input type="text" class="mypage__input" placeholder="전화번호" name="order_phonenum"/>
				</div>
			</div>
				
				
			<div class="form-gruop row" style="display: none;">
				<div class="col-lg-2">
					<p style="text-align: left; padding-top: 13px;">주문 날짜</p>
				</div>
				<div class="col-lg-10">
					<input type="text" class="mypage__input" placeholder="주문 날짜" name="order_date"/>
				</div>
			</div>
			
			<p style="text-align: left; padding-top: 7px; padding-bottom: 35px;">
			<button type="submit" class="site-smbtn">작성 완료</button>
			<a href="#" class="site-smbtn" style="display: none;">삭제</a></p>
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

