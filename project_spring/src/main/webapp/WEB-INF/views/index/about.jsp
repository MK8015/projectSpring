<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="../include/header.jsp" %>
<style>
/*
.subtitle__text p {
	font-size: 46px;
	font-weight: 700;
}
*/

h3 {
	font-weight: 700;
	margin-bottom: 30px;
	text-align: center;
}
</style>


<!-- START : qnA 이미지 Section -->
<section class="subtitle spad">
	<div class="container">
		<div class="row subtitle-section eventset-bg" data-setbg="/spring/resources/img/about.png">
			<div class="col-lg-12 text-center">
				<div class="subtitle__text">
					<h2><span style="color:#7fad39;">N</span><span style="color:#a1cf25;">O</span><span style="color:#7fad39;">N</span><span style="color:#252525;">FICTION</span></h2>
					<p style="margin-top: 15px;">¹ 상상이 아니라 사실에 근거하여 쓰인 글</p>
					<p>² 픽션이 아닌 모든 글</p>
					<p>³ <span style="font-size:18px;"><b>국내 유일 논픽션 전문 서점</b></span></p>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End : qnA 이미지 Section -->


<!-- Contact Section Begin -->
<section class="contact spad">
	<div class="container">
		<div class="text-center">
			<h3>논픽션의 핵심 가치</h3>
		</div>
		
		<div class="row">
			<div class="col-lg-4 col-md-3 col-sm-6 text-center">
				<div class="contact__widget">
					<img src="/spring/resources/img/about1.png">
						<h4>도전과 창의</h4>
						<p>우리는 새롭게 시도하고<br>실패해도 다시 도전한다</p>
				</div>
			</div>
			<div class="col-lg-4 col-md-3 col-sm-6 text-center">
				<div class="contact__widget">
					<img src="/spring/resources/img/about2.png">
						<h4>고객 중심</h4>
						<p>우리는 고객관점에서<br>생각하고 행동한다</p>
					</div>
				</div>
			<div class="col-lg-4 col-md-3 col-sm-6 text-center">
				<div class="contact__widget">
					<img src="/spring/resources/img/about3.png">
					<h4>정직과 성실</h4>
					<p>우리는 정직, 성실한 자세로<br>성과 책임을 다한다</p>
				</div>
			</div>
		</div>
	</div>
</section>


<!-- Contact Section Begin -->
<section class="contact spad">
	<div class="container">
		<div class="text-center">
			<h3>오시는 길</h3>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				
				
				<div id="map" class="col-lg-12 col-md-12 col-sm-12" style="width:100%;height:400px; text-align: center;"></div>
				
				
			</div>
		</div>
	</div>
</section>



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=yourApiKey"></script>
<script type="text/javascript">

var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(35.53591307904184, 129.31023000893862), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};

var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
var marker = new kakao.maps.Marker({
    map: map,
    title: "NONFICTION",
    text: "NONFICTION",
    clickable:"TRUE",
    position: new kakao.maps.LatLng(35.53591307904184, 129.31023000893862)
});

</script>
<!-- Contact Section End -->

<%@ include file="../include/footer.jsp" %>