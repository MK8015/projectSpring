<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
<style>

.mypage__sidebar {
	padding-top: 0px;
}

.mypage__sidebar__item {
	margin-bottom: 50px;
	border: 1px solid #ebebeb;
}

.mypage__sidebar__item h4 {
	color: #1c1c1c;
	font-weight: 700;
	margin-bottom: 25px;
}

.mypage__sidebar__item ul li {
	list-style: none;
}

.mypage__sidebar__item ul li a {
	font-size: 16px;
	color: #666666;
	line-height: 48px;
	-webkit-transition: all, 0.3s;
	-moz-transition: all, 0.3s;
	-ms-transition: all, 0.3s;
	-o-transition: all, 0.3s;
	transition: all, 0.3s;
}

.mypage__sidebar__item ul li a:hover {
	color: #7fad39;
}
</style>



<!-- START : 왼쪽 카테고리 Section -->
<section>
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-5 order-md-1 order-2">
				<div class="mypage__sidebar__item">
					<img src="/spring/member/getProfile?profileImage=${memberVo.member_pic}" 
				alt="/spring/resources/img/defaultprofile.png">
					<h4>${memberVo.member_id}님<br>환영합니다!</h4>
						<ul>
							<li><a href="#">회원 정보</a></li>
							<li><a href="#">주문 내역</a></li>
						</ul>
				</div>
			</div>
<!-- END : 왼쪽 카테고리 Section -->

<!-- START : 오른쪽 my page Section -->
			<div class="col-lg-8 col-md-7 order-md-1 order-1">
				회원 정보
			</div>
		</div>
	</div>
</section>
    <!-- Blog Details Section End -->


<%@ include file="../include/footer.jsp" %>