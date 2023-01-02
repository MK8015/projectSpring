<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>




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
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star-half-o"></i> <span>(18 reviews)</span>
					</div>
					<div class="product__details__price">${productVo.price}</div>
					<p>Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.
						Vestibulum ac diam sit amet quam vehicula elementum sed sit amet
						dui. Sed porttitor lectus nibh. Vestibulum ac diam sit amet quam
						vehicula elementum sed sit amet dui. Proin eget tortor risus.</p>
					<div class="product__details__quantity">
						<div class="quantity">
							<div class="pro-qty">
								<input type="text" value="1">
							</div>
						</div>

					</div>
					<a href="#" class="primary-btn">ADD TO CARD</a> <a href="#"
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
							href="#tabs-3" role="tab" aria-selected="false">리뷰 <span>(1)</span></a>
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
								<h6>리뷰</h6>
								<table class="table table-hover table-striped">
									<thead>
										<tr>
											<th>#</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td rowspan="2">아이디 <br>
												<i class="fa fa-star" style="color:yellow"></i>
												<i class="fa fa-star" style="color:yellow"></i>
												<i class="fa fa-star" style="color:yellow"></i>
												<i class="fa fa-star" style="color:yellow"></i>
												<i class="fa fa-star" style="color:yellow"></i>
											</td>
											<td>제목</td>
											
										</tr>
										<tr>
											<td>내용111111111111111111111</td>
										</tr>
									
									</tbody>
								</table>
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