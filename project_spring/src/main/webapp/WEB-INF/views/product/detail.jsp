<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

<script>
	$(document).ready(function() {

		$(document).on("click", ".page-link", function(e) {
			e.preventDefault();
			var page = $(this).attr("data-page");
			$.get("/spring/review/reviewPaging", {
				"page" : page
			}, function(rData) {
				var jsonArray = JSON.parse(rData);
				var tds = $("#review").find("tr").eq(0).find("td").clone();
				for (var i = 0; i < jsonArray.length; i++) {
					console.log(jsonArray[i].member_id);
				}

			});
		});

		$(".perPage").click(function(e) {
			e.preventDefault();
			var perPage = $(this).attr("href");
			location.href = "/board/list?perPage=" + perPage;
		});

	});
</script>



<!-- Product Details Section Begin -->
<section class="product-details spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="product__details__pic">
					<div class="product__details__pic__item">
						<img class="product__details__pic__item--large"
							src="/spring/product/getImage?imageName=${productVo.product_image}"
							alt="">
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-6">
				<div class="product__details__text">
					<h3>${productVo.product_name}</h3>
					<div class="product__details__rating">
						<c:forEach begin="1" end="${ratingAvg}" var="rating">
							<i class="fa fa-star" style="color: orange"></i>
						</c:forEach>
						<i class="fa fa-star" style="color: orange"></i> <span>(${reviewCount}
							reviews)</span>
					</div>
					<div class="product__details__price">${productVo.price}원</div>
					<p>${productVo.product_description}</p>
					<div class="product__details__quantity">
						<div class="quantity">
							<div class="pro-qty">
								<input type="text" value="1">
							</div>
						</div>
					</div>
					<a href="#" class="primary-btn">ADD TO CART</a> <a href="#"
						class="heart-icon"><span class="icon_heart_alt"></span></a>
					<ul>
						<li><b>재고</b> <span>${productVo.product_quantity}</span></li>
						<li><b>공유하기</b>
							<div class="share">
								<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-twitter"></i></a> <a href="#"><i
									class="fa fa-instagram"></i></a> <a href="#"><i
									class="fa fa-pinterest"></i></a>
							</div></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="product__details__tab">
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">책
								소개</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#tabs-2" role="tab" aria-selected="false">상세 정보</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#tabs-3" role="tab" aria-selected="false">리뷰<span>(${reviewCount})</span></a>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tabs-1" role="tabpanel">
							<div class="product__details__tab__desc">
								<h6>책 소개</h6>
								<p>${productVo.product_description}</p>
							</div>
						</div>
						<div class="tab-pane" id="tabs-2" role="tabpanel">
							<div class="product__details__tab__desc">
								<h6>상세 정보</h6>
								<p>정보정보</p>
							</div>
						</div>
						<div class="tab-pane" id="tabs-3" role="tabpanel">
							<div class="product__details__tab__desc">
								<table class="table table-hover table-striped">
									<thead>
										<tr>
											<th>리뷰</th>
											<th></th>
										</tr>
										<tr>
											<th><img src="/spring/resources/img/defaultprofile.png"
												width="100px" class="rounded-circle" /><br> 로그인한 아이디<br>
												<i class="fa fa-star-o" style="color: orange"></i> <i
												class="fa fa-star-o" style="color: orange"></i> <i
												class="fa fa-star-o" style="color: orange"></i> <i
												class="fa fa-star-o" style="color: orange"></i> <i
												class="fa fa-star-o" style="color: orange"></i> <br></th>
											<td>
												<div contenteditable="true"
													style="resize: none; height: 100px; width: 90%; border: 1px solid #d3d3d3; padding: 10px; outline: none;"></div>
												<a href="#" class="primary-btn">등록</a>
											</td>
										</tr>

									</thead>
									<tbody id="review">
										<c:forEach items="${reviewList}" var="reviewVo">
											<tr class="review_open">
												<td style="width: 25%">
												<img src="/spring/resources/img/defaultprofile.png"
													width="100px" class="rounded-circle" /><br>
													${reviewVo.member_id}<br> <c:forEach begin="1"
														end="${reviewVo.review_rating}" var="rating">
														<i class="fa fa-star" style="color: orange"></i>
													</c:forEach> <c:forEach begin="${reviewVo.review_rating}" end="4"
														var="rating">
														<i class="fa fa-star-o" style="color: orange"></i>
													</c:forEach></td>
												<td style="width: 75%">${reviewVo.review_content}</td>

											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="row">
								<div class="col-md-12">
									<nav>
										<ul class="pagination justify-content-center">
											<c:if test="${pagingDto.startPage ne 1}">
												<li class="page-item"><a class="page-link"
													href="${pagingDto.startPage-1}">이전</a></li>
											</c:if>
											<c:forEach var="v" begin="${pagingDto.startPage}"
												end="${pagingDto.endPage}">
												<li
													<c:choose>
							<c:when test="${pagingDto.page eq v}">
								class="page-item active"
							</c:when>
							<c:otherwise>
								class="page-item"
							</c:otherwise>
						</c:choose>>
													<a class="page-link" href="#" data-page="${v}">${v}</a>
												</li>

											</c:forEach>
											<c:if test="${pagingDto.endPage lt pagingDto.totalPage}">
												<li class="page-item"><a class="page-link"
													href="${pagingDto.endPage+1}">다음</a></li>
											</c:if>
										</ul>
									</nav>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Product Details Section End -->



<%@ include file="../include/footer.jsp"%>