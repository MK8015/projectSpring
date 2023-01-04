<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>

<!-- Product Section Begin -->
<section class="product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-5">
				<div class="hero__categories">
					<div class="hero__categories__all">
						<i class="fa fa-bars"></i>
						<span><a href="/spring/main/list">All departments</a></span>
					</div>
					<ul>
						<li><a href="#">Fresh Meat</a></li>
						<li><a href="#">Vegetables</a></li>
						<li><a href="#">Fruit & Nut Gifts</a></li>
						<li><a href="#">Fresh Berries</a></li>
						<li><a href="#">Ocean Foods</a></li>
						<li><a href="#">Butter & Eggs</a></li>
						<li><a href="#">Fastfood</a></li>
						<li><a href="#">Fresh Onion</a></li>
						<li><a href="#">Papayaya & Crisps</a></li>
						<li><a href="#">Oatmeal</a></li>
						<li><a href="#">Fresh Bananas</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-9 col-md-7">
				<div class="filter__item">
					<div class="row">
						<div class="col-lg-4 col-md-5">
							<div class="filter__sort">
								<span>Sort By</span>
									<select>
										<option value="0">Default</option>
										<option value="0">Default</option>
									</select>
								</div>
							</div>
							<div class="col-lg-4 col-md-4">
								<div class="filter__found">
									<h6><span>16</span> Products found</h6>
								</div>
							</div>
							<div class="col-lg-4 col-md-3">
								<div class="filter__option">
									<span class="icon_grid-2x2"></span>
									<span class="icon_ul"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
					
					<c:forEach items="${list}" var="list">
						<div class="col-lg-4 col-md-6 col-sm-6">
							<div class="product__item">
								<div class="product__item__pic set-bg">
									<img class="product__item__pic__"
										src="/spring/product/getImage?imageName=${list.product_image}"
										alt="">
									<ul class="product__item__pic__hover">
										<li><a href="#"><i class="fa fa-heart"></i></a></li>
										<li><a href="#"><i class="fa fa-retweet"></i></a></li>
										<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
									</ul>
								</div>
								<div class="product__item__text">
									<h6><a href="#">${list.product_name}</a></h6>
									<h5>￦${list.price}</h5>
								</div>
							</div>
						</div>
					</c:forEach>
					</div>
				<!-- 페이지 번호 -->
				<div class="product__pagination">
					<c:forEach var="v" begin="${pagingDto.startPage}" 
										end="${pagingDto.endPage}">
						<a href="${v}">${v}</a>
					</c:forEach>
					<a href="#"><i class="fa fa-long-arrow-right"></i></a>
				</div>
				
				<!-- 시작순서가 1이 아닌경우 -->
				<div class="product__pagination">
					<c:if test="${pagingDto.startPage ne 1}">
						<a class="page-link" href="${pagingDto.startPage-1}">
							<i class="fa fa-long-arrow-left"></i></a>
					</c:if>
					<c:forEach var="v" begin="${pagingDto.startPage}" 
										end="${pagingDto.endPage}">
						<div 
							<c:choose>
								<c:when test="${pagingDto.page eq v}">
									class="product__pagination active"
								</c:when>
								<c:otherwise>
									class="product__pagination"
								</c:otherwise>	
							</c:choose>
						>
							<a class="page-link" href="${v}">${v}</a>
						</div>
					</c:forEach>
					<c:if test="${pagingDto.endPage lt pagingDto.totalPage}">
						<a class="page-link" href="${pagingDto.endPage+1}">
							<i class="fa fa-long-arrow-right"></i></a>
					</c:if>
				</div>
				
			</div>
		</div>
	</div>
</section>
<!-- Product Section End -->



<%@ include file="../include/footer.jsp" %>