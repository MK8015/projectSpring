<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>
<script>
$(document).ready(function() {
 	// 페이지 번호
	$(document).on("click", ".pagelink", function(e) {
	   e.preventDefault();
	   var page = $(this).attr("href");
	   
// 	   location.href = "/spring/list/list?page=" + page + "&perPage=${pagingDto.perPage}";
	   $("#frmPaging").find("input[name=page]").val(page);
	   $("#frmPaging").attr("action", "/spring/list/list").submit();
	});
});
	
	
</script>

<%@ include file="../include/pageParam.jsp" %>

<!-- Product Section Begin -->
<section class="product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-5">
				<div class="hero__categories">
					<div class="hero__categories__all">
						<i class="fa fa-bars"></i>

						<span><a href="/spring/list/list">All Categorys</a></span>
					</div>
					<ul>
						<li><a href="/spring/list/list?category=humanity">인문</a></li>
						<li><a href="/spring/list/list?category=economy">경제/경영</a></li>
						<li><a href="/spring/list/list?category=sociology">정치/사회</a></li>
						<li><a href="/spring/list/list?category=history">역사</a></li>
						<li><a href="/spring/list/list?category=culture">문화/예술</a></li>
						<li><a href="/spring/list/list?category=science">과학</a></li>
						<li><a href="/spring/list/list?category=computer">컴퓨터/IT</a></li>
						<li><a href="/spring/list/list?category=language">외국어</a></li>
						<li><a href="/spring/list/list?category=religion">종교/역학</a></li>
						<li><a href="/spring/list/list?category=self">자기계발</a></li>
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


						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="product__item">
								<div class="product__item__pic">
									<img class="product__item__pic"

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

				<div class="product__pagination pagination justify-content-center">
					<!-- 시작순서가 1이 아닌경우 -->

					<c:if test="${pagingDto.startPage ne 1}">
						<a class="pagelink" href="${pagingDto.startPage-1}">
							<i class="fa fa-long-arrow-left"></i></a>
					</c:if>
					<c:forEach var="v" begin="${pagingDto.startPage}" 
										end="${pagingDto.endPage}">
<<<<<<< HEAD
						<a class="pagelink" href="${v}">${v}</a>
=======

						<a class="page-link" href="${v}">${v}</a>
>>>>>>> refs/remotes/origin/main
					</c:forEach>
					<c:if test="${pagingDto.endPage lt pagingDto.totalPage}">
						<a class="pagelink" href="${pagingDto.endPage+1}">
							<i class="fa fa-long-arrow-right"></i></a>
					</c:if>
				</div>

			</div>
		</div>
	</div>
</section>
<!-- Product Section End -->



<%@ include file="../include/footer.jsp" %>