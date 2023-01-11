<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>


<script>
$(document).ready(function() {

	
}); //$(document).ready(function()
</script>

<!-- START : qnA 이미지 Section -->
<section>
	<div class="container">
		<div class="row breadcrumb-section set-bg" data-setbg="/spring/resources/img/breadcrumb.jpg">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>WISH LIST</h2>
					<div class="breadcrumb__option">
						<a href="./index.html">Home</a>
						<span>Contact Us</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End : qnA 이미지 Section -->


<!-- START : 메인 리스트 -->
<section class="featured spad">
	<div class="container">
		
		
		<!-- 여기 div 반복 -->
		<div class="row featured__filter">
		<c:forEach items="${likeProductList}" var="list">
			<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
				<div class="featured__item">
					<div class="featured__item__pic">
					<!-- 이미지 누르면 상품 디테일로 가기 -->
						<img class="featured__item__pic"
							src="/spring/product/getImage?imageName=${list.product_image}"

							alt="" onclick="location.href='/spring/product/detail?product_id=${list.product_id}'">

						<ul class="featured__item__pic__hover">
							<li><a href="#"><i class="fa fa-heart"></i></a></li>
							<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
						</ul>
					</div>
					<div class="featured__item__text">
						<h6><a href="/spring/product/detail?product_id=${list.product_id}">
								${list.product_name}<br>
									<span style="font-size:11px; color:gray;">
									${list.product_author} | ${list.product_publisher}</span></a></h6>
						<h5>${list.price}</h5>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
</section>
<!-- END : 메인 리스트 -->



<%@ include file="../include/footer.jsp" %>