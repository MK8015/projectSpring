<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/header.jsp" %>

<script>
$(document).ready(function() {
	
	var checked = $("#rdo_recent_address").is(":checked"); // 최근배송지 list.get(0)처음꺼 불러오기
	var checked2 = $("#rdo_member_address").is(":checked"); // 회원정보 주소 불러오기
	var checked3 = $("#rdo_new_address").is(":checked");
	
	if (checked) { // 최근 배송지 선택할때 : 최근정보 불러오기
		var phonenum = "${orderList.get(0).order_phonenum}";
		var arr_phonenum = phonenum.split("-");
		$("#member_name").val("${orderList.get(0).member_name}"); // 이름 불러오기
		$("#road_address").val("${orderList.get(0).order_address}"); // 주소 불러오기
		$("#detail_address").val("${orderList.get(0).order_address_detail}"); // 상세주소 불러오기
		// 전화번호 불러오기
		var phonenum1 = arr_phonenum[0];
		$(".nice-select").remove();
		$("#phonenum1").show();
		$.each($("#phonenum1 > option"), function(){
			console.log($(this).text());
			if (phonenum1 == $(this).text()) {
				console.log('true')
				$(this).attr("selected", "selected");
				return false;
			}
		});
		$("#phonenum2").val(arr_phonenum[1]);
		$("#phonenum3").val(arr_phonenum[2]);
	} 
	// 회원정보 불러오기
	else if (checked2) {
		$("#member_name").val("${loginMemberVo.member_name}"); // 이름 불러오기
		$("#road_address").val("${loginMemberVo.address}"); // 이름 불러오기
	}

	
});
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
	document.getElementById("address").addEventListener("click", function(){ //주소입력칸을 클릭하면
	//카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
				document.getElementById('address').value = data.zonecode;
				document.getElementById("road_address").value = data.roadAddress;
				document.getElementById("jibun_address").value = data.autoJibunAddress;
                document.querySelector("input[name=detail_address]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="/spring/resources/img/breadcrumb.jpg">
	<div class="container">
	${orderList}
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>결 제</h2>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- 상품 확인 처음 -->
<section class="shoping-cart spad">
	<div class="container">
		<div class="row">
			<div class="row payment__list__title">
				<div class="col-lg-12">
					<h3>상품확인</h3>
				</div>
			</div>
			<div class="col-lg-12">
			<hr>
				<div class="shoping__cart__table">
					<table>
						<thead>
							<tr>
								<th>상품명</th>
								<th>상품금액</th>
								<th>수량</th>
								<th>합계</th>
							</tr>
						</thead>
						<tbody>
						<c:set var="total" value="0"/>
						<c:forEach items="${cartnoList}" var="list" varStatus="status">
							<tr>
								<td class="shoping__cart__item">
									<img src="/spring/product/getImage?imageName=${list.product_image}" 
									width="80px" onclick="location.href='/spring/product/detail?
									product_id=${list.product_id}'">
									<h5 onclick="location.href='/spring/product/detail?
									product_id=${list.product_id}'">
									${list.product_name}<br>
									<span style="font-size:11px; color:gray;"
									>${list.product_author}|${list.product_publisher}</span></h5>
								</td>
								<td class="shoping__cart__price">
									${list.price}원
								</td>
								<td class="shoping__cart__quantity">
									${list.cart_amount}
								</td>
								<td class="shoping__cart__total">
									${list.price*list.cart_amount}원
								</td>
								<c:set var="total" value="${total+list.price*list.cart_amount}"/>
							</tr>
						</c:forEach>
					
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-8">
				<div class="shoping__cart__btns">
					** 상품 변경을 원하시면　
					<a href="/spring/cart/list" class="primary-btn">카트로 가기 ></a>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="shoping__checkout">
					<h5>최종 결제 금액</h5>
					<ul>
						<li><span class="totalPrice">
						<c:out value="${total}원"/></span></li>
					</ul>
				</div>
			</div>
		</div>
<!-- 상품 확인 끝 -->
<!-- 배송 정보 시작 -->		
	<div class="row">
		<div class="row payment__list__title">
			<div class="col-lg-12">
				<h3>배송주소</h3>
			</div>
		</div>
	<div class="col-lg-12">
	<hr>
		<div class="row">
			<div class="col-md-8">
				<form id="frmUpdate" role="form" action="" method="post">
				<table>
					<tr style ='vertical-align : top'>
						<td>배송지</td>
						<td>
						<input type="radio" id="rdo_recent_address" name="address" checked/>최근배송지
						<input type="radio" id="rdo_member_address" name="address"/>회원정보동일
						<input type="radio" id="rdo_new_address" name="address"/>새로입력
						
						</td>
					</tr>
					<tr style ='vertical-align : top'>
						<td>이름</td>
						<td><input type="text" class="qna__input" id="member_name" name=""/></td>
					</tr>
					<tr style ='vertical-align : top'>
						<td>배송주소</td>
						<td>
							<input type="text" class="qna__input" id="address" name="address" placeholder=""/>
							<button type="button" id="address" name="address">주소찾기</button><br>
							<label>도로명주소</label>
							<input type="text" id="road_address" name="road_address" readonly="readonly"/><br>
<!-- 							<label>지번주소</label> -->
<!-- 							<input type="text" id="jibun_address" name="jibun_address" readonly="readonly"/><br> -->
							<label>상세주소</label>
							<input type="text" id="detail_address" name="detail_address"/>
						</td>
					</tr>
					<tr style ='vertical-align : top'>
						<td>휴대폰</td>
						<td>
							<select id="phonenum1" style="width:60px">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>-
							<input name="phonenum2" id="phonenum2" type="text" maxlength="4" style="width:45px"/>-
							<input name="phonenum3" id="phonenum3" type="text" maxlength="4" style="width:45px"/>
						</td>
					</tr>
				</table>
				
<!-- 				<div class="text-right"> -->
<!-- 					<button type="submit" class="site-smbtn">작성</button>　 -->
<!-- 				</div> -->
			</form>
			</div>
			<div class="col-md-4">
				<form id="frmUpdate" role="form" action="/spring/board/write" method="post" enctype="multipart/form-data">
				<label>주문고객</label>
				<hr>
				<table>
					<tr style ='vertical-align : middle'>
						<td>이름</td>
						<td><input type="text" class="qna__input" id="" name="" placeholder=""/></td>
					</tr>
					<tr style ='vertical-align : top'>
						<td>휴대폰</td>
						<td>
							<select id="phonenum1_1" style="width:60px">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>-
							<input name="phonenum2" id="phonenum2" type="text" maxlength="4" style="width:45px"/>
							<input name="phonenum3" id="phonenum3" type="text" maxlength="4" style="width:45px"/>
						</td>
					</tr>
					<tr style ='vertical-align : middle'>
						<td>이메일</td>
						<td><input type="email" class="qna__input" id="" name="" placeholder=""/></td>
					</tr>
					
				</table>
				
<!-- 				<div class="text-right"> -->
<!-- 					<button type="submit" class="site-smbtn">작성</button>　 -->
<!-- 				</div> -->
			</form>
			
			</div>
		</div>
		<hr>
	</div>
	</div>
<!-- 배송 정보 끝 -->	
<!-- 결제 시작 -->
	<div class="row">
		<div class="row payment__list__title" style="margin-top: 30px">
			<div class="col-lg-12">
				<h3>결제방법</h3>
			</div>
		</div>
	<div class="col-lg-12">
	<hr>	
	</div>
	
<!-- 결제 끝 -->	
			</div>
			</div>
</section>
<!-- Shoping Cart Section End -->

<%@ include file="../include/footer.jsp" %>