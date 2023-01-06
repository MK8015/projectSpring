<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>


<script>
$(document).ready(function() {

	
}); //$(document).ready(function()
</script>


<!-- START : 카테고리 -->
<section class="categories"> 
	<div class="container">
		<div class="row">
			<div class="categories__slider owl-carousel">
				<div class="col-lg-3">
					<div class="categories__item set-bg" data-setbg="/spring/resources/img/categories/cat-1.jpg"
						 onclick="location.href='/spring/list/list?category=humanity';">
						<h5><a href="/spring/list/list?category=humanity">인문학</a></h5>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="categories__item set-bg" data-setbg="/spring/resources/img/categories/cat-2.jpg"
						onclick="location.href='/spring/list/list?category=economy';">
						<h5><a href="/spring/list/list?category=economy">경제/경영</a></h5>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="categories__item set-bg" data-setbg="/spring/resources/img/categories/cat-3.jpg"
						onclick="location.href='/spring/list/list?category=sociology';">
						<h5><a href="/spring/list/list?category=sociology">정치/사회</a></h5>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="categories__item set-bg" data-setbg="/spring/resources/img/categories/cat-3.jpg"
						onclick="location.href='/spring/list/list?category=history';">
						<h5><a href="/spring/list/list?category=history">역사</a></h5>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="categories__item set-bg" data-setbg="/spring/resources/img/categories/cat-4.jpg"
						onclick="location.href='/spring/list/list?category=science';">
						<h5><a href="/spring/list/list?category=science">과학</a></h5>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="categories__item set-bg" data-setbg="/spring/resources/img/categories/cat-4.jpg"
						onclick="location.href='/spring/list/list?category=culture';">
						<h5><a href="/spring/list/list?category=culture">문화/예술</a></h5>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="categories__item set-bg" data-setbg="/spring/resources/img/categories/cat-5.jpg"
						onclick="location.href='/spring/list/list?category=computer';">
						<h5><a href="/spring/list/list?category=computer">컴퓨터</a></h5>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="categories__item set-bg" data-setbg="/spring/resources/img/categories/cat-5.jpg"
						onclick="location.href='/spring/list/list?category=language';">
						<h5><a href="/spring/list/list?category=language">외국어</a></h5>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="categories__item set-bg" data-setbg="/spring/resources/img/categories/cat-5.jpg"
						onclick="location.href='/spring/list/list?category=religion';">
						<h5><a href="/spring/list/list?category=religion">종교/역학</a></h5>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="categories__item set-bg" data-setbg="/spring/resources/img/categories/cat-5.jpg"
						onclick="location.href='/spring/list/list?category=self';">
						<h5><a href="/spring/list/list?category=self">자기계발</a></h5>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- END : 카테고리 -->

<!-- START : 메인 리스트 -->
<section class="featured spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title">
					<h2>Featured Product</h2>
				</div>
				<div class="featured__controls">
					<ul>
						<li class="active" data-filter="*">All</li>
						<li data-filter=".oranges">Oranges</li>
						<li data-filter=".fresh-meat">Fresh Meat</li>
						<li data-filter=".vegetables">Vegetables</li>
						<li data-filter=".fastfood">Fastfood</li>
					</ul>
				</div>
			</div>
		</div>
		
		
		<!-- 여기 div 반복 -->
		<div class="row featured__filter">
		<c:forEach items="${list}" var="productVo">
			<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
				<div class="featured__item">
					<div class="featured__item__pic">
					<!-- 이미지 누르면 상품 디테일로 가기 -->
						<img class="featured__item__pic"
							src="/spring/product/getImage?imageName=${productVo.product_image}"

							alt="" onclick="location.href='/spring/product/detail?product_id=${productVo.product_id}'">

						<ul class="featured__item__pic__hover">
							<li><a href="#"><i class="fa fa-heart"></i></a></li>
							<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
						</ul>
					</div>
					<div class="featured__item__text">
						<h6><a href="/spring/product/detail?product_id=${productVo.product_id}">${productVo.product_name}</a></h6>
						<h5>${productVo.price}</h5>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
</section>
<!-- END : 메인 리스트 -->



<%@ include file="../include/footer.jsp" %>