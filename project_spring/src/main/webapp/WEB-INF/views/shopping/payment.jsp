<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<style>
.table-control {
    display: red;
    width: 100%;
    height: calc(1.5em + 0.75rem + 2px);
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    margin-bottom: 20px;
}

.table-group p {
	font-size: large;
	margin-right: 80px;
}

.table-group span {
	font-size: 18px;
}

.table-group span input {
	margin-right: 10px;
}

.primary-btn-payment {
    display: inline-block;
    font-size: 20px;
    padding: 10px 28px 10px;
    color: #ffffff;
    text-transform: uppercase;
    font-weight: 500;
    background: #7fad39;
    letter-spacing: 2px;
    border: none;
}


</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="https://js.tosspayments.com/v1/payment"></script>
<script>
$(document).ready(function() {
	$("#frmOrder").submit(function(){
		// 폰번호 name:order_phonenum에 저장
		var order_phonenum = $("#phonenum1").val()+'-'+$("#phonenum2").val()+'-'+$("#phonenum3").val();
		$("#order_phonenum").val(order_phonenum);
		
		var json = JSON.stringify(arr_cartList);
		$(this).append("<input type='hidden' name='list' value='"+json+"'>");
		return true;
	});
	
	$("#paymentToss,#paymentKakao").click(function(){
		
		console.log($(this));
		if($(this).get(0) == $("#paymentToss").get(0)){
		
			$("#iamportPaymentToss").prop("checked",true);
		}else if($(this).get(0) == $("#paymentKakao").get(0)){
			$("#iamportPaymentKakao").prop("checked",true);
			
		}
	});
	
	radioCheck();
	 
	$("input[name=rdo_address]").click(function(){
		 radioCheck();
	});



	
	//결제버튼
	$("#btn_payment").click(function(){

		if(parseInt("${loginMemberVo.member_point}")-parseInt($(".totalPrice").text().trim().replace("원",""))<0){
			alert("잔액이 부족합니다 잔액을 채워주세요")
			return 
		}
	
		if(parseInt(${loginMemberVo.member_point})-parseInt($(".totalPrice").text().trim().replace("원",""))){
			
		}
		// 결제 막고 바로 넘기기
		var arr_cartList = ${arr_cartList};	
		var json = JSON.stringify(arr_cartList);
		var order_phonenum = $("#phonenum1").val()+'-'+$("#phonenum2").val()+'-'+$("#phonenum3").val();
		var address = $("#road_address").val() + "," + $("#detail_address").val();
		var total_price=$(".totalPrice").text().trim().replace("원","").replace(",","");
		$("#frmOrder").append("<input type='hidden' name='list' value='"+json+"'>");
		$("#frmOrder").append("<input type='hidden' name='totalPrice' value='"+total_price+"'>");
		$("#order_phonenum").val(order_phonenum);
		frmOrder.submit();

		
// 		if($("#iamportPaymentToss").is(":checked")){
// 			Tosspayment();
// 		}else if($("#iamportPaymentKakao").is(":checked")){			
// 			Kakaopayment();
// 		}else{
// 			alert("결제 수단을 선택해주세요");
// 		}
	});
		
});
//카카오 결제
function Kakaopayment(){
	var arr_cartList = ${arr_cartList};	
	var order_phonenum = $("#phonenum1").val()+'-'+$("#phonenum2").val()+'-'+$("#phonenum3").val();
	var address = $("#road_address").val() + "," + $("#detail_address").val();
	var total_price=$(".totalPrice").text().trim().replace("원","").replace(",","");
	IMP.init("imp85835735");
	IMP.request_pay({
		pg: "kakaopay.TC0ONETIME",
		pay_method:"card",
		merchant_uid:"iamport_test_id"+new Date().getTime(),
		name:$(".productName").eq(0).text()+" 외 "+(arr_cartList.length-1) +"종",
		amount:total_price,
		buyer_name:"${loginMemberVo.member_name}",
		buyer_email:"${loginMemberVo.email}",
		buyer_tel:order_phonenum,
		buyer_addr:address
	},function(rsp){
		if(rsp.success){
			alert(total_price+" 원 결제가 완료되었습니다!");
			var json = JSON.stringify(arr_cartList);
			$("#frmOrder").append("<input type='hidden' name='list' value='"+json+"'>");
			$("#frmOrder").append("<input type='hidden' name='totalPrice' value='"+total_price+"'>");
			$("#order_phonenum").val(order_phonenum);
			frmOrder.submit();
		}else{
			alert("실패: 코드("+rsp.error_code+") / 메세지("+rsp.error_msg+")");
		}
			
	});
}
//토스 결제
function Tosspayment(){
	var arr_cartList = ${arr_cartList};	
	var order_phonenum = $("#phonenum1").val()+'-'+$("#phonenum2").val()+'-'+$("#phonenum3").val();
	var address = $("#road_address").val() + "," + $("#detail_address").val();
	var total_price=$(".totalPrice").text().trim().replace("원","").replace(",","");
	IMP.init("imp85835735");
	IMP.request_pay({
		pg: "uplus.tlgdacomxpay",
		pay_method:"card",
		merchant_uid:"iamport_test_id"+new Date().getTime(),
		name:$(".productName").eq(0).text()+" 외 "+(arr_cartList.length-1) +"종",
		amount:total_price,
		buyer_name:"${loginMemberVo.member_name}",
		buyer_email:"${loginMemberVo.email}",
		buyer_tel:order_phonenum,
		buyer_addr:address
	},function(rsp){
		if(rsp.success){
			alert(total_price+" 원 결제가 완료되었습니다!");
			var json = JSON.stringify(arr_cartList);
			$("#frmOrder").append("<input type='hidden' name='list' value='"+json+"'>");
			$("#frmOrder").append("<input type='hidden' name='totalPrice' value='"+total_price+"'>");
			$("#order_phonenum").val(order_phonenum);
			frmOrder.submit();
		}else{
			alert("실패: 코드("+rsp.error_code+") / 메세지("+rsp.error_msg+")");
		}	
	});
}

function radioCheck(){
	// 최근 배송지가 없을때 (이전구매내역이 없을때) 라디오 버튼 사라지게 하기
	if("${orderList}" == null || "${orderList}" == ""){
		$("#rdo_recent_address").attr("style","display:none");
		$("#lbl_rdo_recent_address").attr("style","display:none");
		$("#rdo_recent_address").attr("checked", false);
		$("#rdo_member_address").attr("checked", true);
	}
	
	var checked1 = $("#rdo_recent_address").is(":checked"); // 최근배송지 list.get(0)처음꺼 불러오기
	var checked2 = $("#rdo_member_address").is(":checked"); // 회원정보 주소 불러오기
	var checked3 = $("#rdo_new_address").is(":checked");
	
	if (checked1) { // 최근 배송지 선택할때 : 최근정보 불러오기
		var phonenum = "${orderList.get(0).order_phonenum}";
		var arr_phonenum = phonenum.split("-");
		$("#member_name").val("${orderList.get(0).member_name}"); // 이름 불러오기
		$("#road_address").val("${orderList.get(0).order_address}"); // 주소 불러오기
		$("#detail_address").val("${orderList.get(0).order_address_detail}"); // 상세주소 불러오기
		$("#phonenum1").val(arr_phonenum[0]);
		$("#phonenum2").val(arr_phonenum[1]);
		$("#phonenum3").val(arr_phonenum[2]);
	} 
	// 회원정보 불러오기
	else if (checked2) {
		var phonenum2 = "${loginMemberVo.phonenum}";
		var arr_phonenum2 = phonenum2.split("-");
		$("#member_name").val("${loginMemberVo.member_name}"); // 이름 불러오기
		$("#road_address").val("${loginMemberVo.address}"); // 주소 불러오기
		$("#detail_address").val("${loginMemberVo.address_detail}"); // 상세주소 불러오기
		$("#phonenum1").val(arr_phonenum2[0]);
		$("#phonenum2").val(arr_phonenum2[1]);
		$("#phonenum3").val(arr_phonenum2[2]);
	}
	// 새로입력
	else if(checked3){
		$("#member_name").val("${loginMemberVo.member_name}"); 
		$("#road_address").focus();
		$("#road_address").val("");
		$("#detail_address").val("");
		$("#phonenum1").val("");// 전화번호 리셋
		$("#phonenum2").val("");
		$("#phonenum3").val("");
		
	}
}


window.onload = function(){
	document.getElementById("road_address").addEventListener("click", function(){ //주소입력칸을 클릭하면
	//카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
				document.getElementById("road_address").value = data.roadAddress;
                document.querySelector("input[name=order_address_detail]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>
<!-- START : Shopping Cart 이미지 Section -->
<section class="subtitle spad">
	<div class="container">
		<div class="row subtitle-section set-bg" data-setbg="/spring/resources/img/breadcrumb.jpg">
			<div class="col-lg-12 text-center">
				<div class="subtitle__text">
					<h2>Payment</h2>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- 상품 확인 처음 -->
<section class="shoping-cart spad">
	<div class="container">

	<form id="frmOrder" role="form" action="/spring/order/insertOrder" method="post">
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
						<tbody id="cartList">
						<c:set var="total" value="0"/>
						<c:forEach items="${cartList}" var="cartVo" varStatus="status">
							<input type="hidden" name="product_id" value="${cartVo.product_id}"/>
							<input type="hidden" name="order_amount" value="${cartVo.cart_amount}"/>
							<tr>
								<td class="shoping__cart__item">
									<img src="/spring/product/getImage?imageName=${cartVo.product_image}" 
									width="80px" onclick="location.href='/spring/product/detail?
									product_id=${cartVo.product_id}'">
									<h5 onclick="location.href='/spring/product/detail?
									product_id=${cartVo.product_id}'">
									<span class="productName">${cartVo.product_name}</span><br>
									<span style="font-size:11px; color:gray;"
									>${cartVo.product_author}|${cartVo.product_publisher}</span></h5>
								</td>
								<td class="shoping__cart__price">
								<fmt:formatNumber value="${cartVo.price}" pattern="#,###"/>
								원</td>
								<td class="shoping__cart__quantity">
								<fmt:formatNumber value="${cartVo.cart_amount}" pattern="#,###"/>
								</td>
								<td class="shoping__cart__total">
								<fmt:formatNumber value="${cartVo.price*cartVo.cart_amount}" pattern="#,###"/>
								원</td>
								<c:set var="total" value="${total+cartVo.price*cartVo.cart_amount}"/>
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
 						<fmt:formatNumber value="${total}" pattern="#,###"/>원</span></li> 
					</ul>
				</div>
			</div>
		</div>
<!-- 상품 확인 끝 -->
	<br>
	<br>
<!-- 배송 정보 시작 -->		
	<div class="row">
		<div class="col-md-12">
			<div class="row payment__list__title">
				<div class="col-md-6">
					<h3>배송주소</h3>
				</div>
				<div class="col-md-6">
					<h3>결제방법</h3>
				</div>
			</div>
		</div>
		<br>
		
	<div class="col-lg-12">
	<hr>
		<div class="row">
			<div class="col-md-6">
				<table class="table-group">
					<tr style ='vertical-align : top'>
						<td><p>배송지</p></td>
						<td><span>
						<input type="radio" id="rdo_recent_address" name="rdo_address" checked style="margin-right:10px"/>
						<label for="rdo_recent_address" id="lbl_rdo_recent_address">최근배송지</label>
						<input type="radio" id="rdo_member_address" name="rdo_address"/>
						<label for="rdo_member_address">회원정보동일</label>
						<input type="radio" id="rdo_new_address" name="rdo_address"/>
						<label for="rdo_new_address">새로입력</label>
						</span></td>
					</tr>
					<tr style ='vertical-align : top'>
						<td><p>이름</p></td>
						<td><input type="text" class="table-control" id="member_name"
						name="member_name" readonly/></td>
					</tr>
					<tr style ='vertical-align : top'>
						<td><p>배송주소</p></td>
						<td>
							<input type="text" class="table-control" id="road_address" name="order_address" readonly="readonly"/><br>
							<label>상세주소</label>
							<input type="text" class="table-control" id="detail_address" name="order_address_detail"/>
						</td>
					</tr>
					<tr style ='vertical-align : top'>
						<td><p>휴대폰</p></td>
						<td>
							<input class="table-control" name="phonenum1" id="phonenum1" type="text" maxlength="3" style="width:70px"/>-
							<input class="table-control" name="phonenum2" id="phonenum2" type="text" maxlength="4" style="width:70px"/>-
							<input class="table-control" name="phonenum3" id="phonenum3" type="text" maxlength="4" style="width:70px"/>
							<input type="hidden" name="order_phonenum" id="order_phonenum"/>
						</td>
					</tr>
				</table>
				
			</div>
			<!-- 결제 시작 -->
			<div class="col-md-6">
				<div class="row payment__list__title" style="margin-top: 30px">
					<div class="col-lg-12">
						<div class="text-left">
							<input type="radio" id="iamportPaymentKakao" name="rdo_payment"/>
							<img src="/spring/resources/img/payment/payment_icon_yellow_medium.png" id="paymentKakao">
							<br>
							<input type="radio" id="iamportPaymentToss" name="rdo_payment"/>
							<img src="/spring/resources/img/payment/toss.png" id="paymentToss">
						</div>
						
						<div class="text-right">
							<button type="button" id="btn_payment" class="primary-btn-payment">결제하기</button>　
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	</div>
	</form>
<!-- 배송 정보 끝 -->	
	<hr>	
	
<!-- 결제 끝 -->	
			</div>
</section>
<!-- Shoping Cart Section End -->

<%@ include file="../include/footer.jsp" %>