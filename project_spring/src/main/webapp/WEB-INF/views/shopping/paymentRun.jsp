<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="https://js.tosspayments.com/v1/payment"></script>
<script>

var clientKey = 'test_ck_0Poxy1XQL8ReEW5ZAEKr7nO5Wmlg'
var tossPayments = TossPayments(clientKey) // 클라이언트 키로 초기화하기
	
$(document).ready(function(){
	$("#iamportPaymentKakao").click(function(){
		Kakaopayment();
	});
	$("#iamportPaymentToss").click(function(){
		Tosspayment();
	});
		
});

function Kakaopayment(){
	IMP.init("imp85835735");
	IMP.request_pay({
		pg: "kakaopay.TC0ONETIME",
		pay_method:"card",
		merchant_uid:"iamport_test_id"+new Date().getTime(),
		name:"도서",
		amount:"15000",
		buyer_name:"홍길동",
		buyer_email:"testiamport@naver.com",
		buyer_tel:"010-1111-1111",
		buyer_addr:"울산광역시 남구 신정동"
		//m_redirect_url : '{모바일에서 결제 완료 후 리디렉션 될 URL}'
	},function(rsp){
		if(rsp.success){
			alert("결제완료->imp_uid:"+rsp.imp_uid +" / merchant_uid(order_key):"+rsp.merchant_uid);
		}else{
			alert("실패: 코드("+rsp.error_code+") / 메세지("+rsp.error_msg+")");
		}
			
	});
}

function Tosspayment(){
	IMP.init("imp85835735");
	IMP.request_pay({
		pg: "uplus.tlgdacomxpay",
		pay_method:"card",
		merchant_uid:"iamport_test_id"+new Date().getTime(),
		name:"도서",
		amount:"15000",
		buyer_name:"홍길동",
		buyer_email:"testiamport@naver.com",
		buyer_tel:"010-1111-1111",
		buyer_addr:"울산광역시 남구 신정동"
		//m_redirect_url : '{모바일에서 결제 완료 후 리디렉션 될 URL}'
	},function(rsp){
		if(rsp.success){
			alert("결제완료->imp_uid:"+rsp.imp_uid +" / merchant_uid(order_key):"+rsp.merchant_uid);
		}else{
			alert("실패: 코드("+rsp.error_code+") / 메세지("+rsp.error_msg+")");
		}
			
	});
}

</script>
</head>
<body>

<input type="radio"/>a
<input type="radio"/>b
<button id="iamportPaymentKakao" style="background: url('/spring/resources/img/payment/payment_icon_yellow_medium.png'); width: 121px; height:50px; border:0px"></button>
<button id="iamportPaymentToss" style="background: url('/spring/resources/img/payment/toss.png'); width: 121px; height:50px; border:0px"></button>
</body>
</html>