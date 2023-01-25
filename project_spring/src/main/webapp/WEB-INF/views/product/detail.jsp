<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>
<style>

/* 리뷰 별점 css */
.rating-stars ul {
	list-style-type: none;
	padding: 0;
}

.rating-stars ul>li.star {
	display: inline-block;
}

/* Idle State of the stars */
.rating-stars ul>li.star>i.fa {
	font-size: 1.5em; /* Change the size of the stars */
	color: #ccc; /* Color on idle state */
}

/* Hover state of the stars */
.rating-stars ul>li.star.hover>i.fa {
	color: #FFCC36;
}

/* Selected state of the stars */
.rating-stars ul>li.star.selected>i.fa {
	color: #FF912C;
}

/*
	position: absolute; */
.containerdiv {
	border: 0;
	float: left;
	position: relative;
	align-items: center;
	width: 200px;
}

.productRating {
	border: 0;
	position: absolute;
	top: 0;
	left: 0;
	overflow: hidden;
}

img {
	max-width: 200px;
}

/* 디테일 부분 리뷰 박스 */

.detail__box {
	overflow: hidden;
	margin-top: 30px;
	margin-bottom: 30px;
}

.detail__box__form {
	width: 70%;
	height: 112px;
	border: 1px solid #ebebeb;
	position: relative;
	float: left;
}

.detail__box__form form .detail__box__left {
	width: 50%;
	float: left;
	font-size: 16px;
	text-align: center;
	color: #1c1c1c;
	font-weight: 700;
	padding-left: 18px;
	padding-top: 11px;
	position: relative;
}



.detail__box__form form .detail__box__right {
	width: 50%;
	float: left;
	font-size: 16px;
	text-align: center;
	color: #1c1c1c;
	font-weight: 700;
	padding-left: 18px;
	padding-top: 11px;
	position: relative;
}

.detail__box__form form .detail__box__left:after {
	position: absolute;
	right: 0;
	top: 14px;
	height: 80px;
	width: 1px;
	background: #000000;
	opacity: 0.1;
	content: "";
}

/*
.detail__box__form form .detail__box__left span {
	position: absolute;
	right: 14px;
	top: 14px;
}
*/

</style>
<script>
$(document).ready(function() {
	

	//리뷰 1페이지 로딩 
	getReview(1);
	
	//해당 품목의 별점 세팅
	setRating("${productVo.product_id}");
	
	// 좋아요 눌렀는지 안 눌렀는지
	var isLike = "${isLike}";
	console.log("islike:",isLike);
	
	//카트에 담기
	$("#btnInsertCart").click(function(e){
		e.preventDefault();
		var cart_amount = $(".pro-qty").find("input").val();
		var product_id = "${productVo.product_id}";
		var sData = {
				"cart_amount": cart_amount,
				"product_id": product_id,
		};
		var form = $("<form></form>");
		form.attr("method","get");
		form.attr("action","/spring/cart/insertCart");
		for(var data in sData){
			var input = $("<input></input>");
			input.attr("type","hidden");
			input.attr("name",data);
			input.attr("value",sData[data]);
			form.append(input);
		}
		$(document.body).append(form);
		form.submit();
		
	});
	
	//리뷰 수정 클릭
	$(document).on("click", ".btnUpdateReview", function(e) {
		e.preventDefault();
		var td = $(".reviewForm").find("td").eq(1).clone();
		var review_no = $(this).attr("data-review_no");
		td.attr("colspan",2);
		$(this).parent().parent().after("<tr id='reviewUpdateForm'></tr>");
		$("#reviewUpdateForm").append(td);
		$("#reviewUpdateForm").append("<td><a href='#' class='site-smbtn btnUpdateRun' data-review_no='"+review_no+"'>작성 완료</a></td>");
	}); // END : 리뷰 수정 클릭
	
	//리뷰 수정 실행
	$(document).on("click", ".btnUpdateRun", function(e) {
		e.preventDefault();
		var review_no = $(this).attr("data-review_no");
		var review_content = $(this).parent().prev().find("div").text();
		var reviewForm = $(this).parent().parent();
		var sData = {
				"review_no":review_no,
				"review_content":review_content
		};
		$.post("/spring/review/updateReview",sData, function(rData) {
			if(rData=="true"){
				getReview(1);
				setRating("${productVo.product_id}");
				reviewForm.remove();
			}
		});
	}); // END : 리뷰 수정 실행
	
	//리뷰 삭제
	$(document).on("click", ".btnDeleteReview", function(e) {
		e.preventDefault();
		var review_no = $(this).attr("data-review_no");
		$.post("/spring/review/deleteReview",{"review_no":review_no}, function(rData) {
			if(rData=="true"){
				getReview(1);
				setRating("${productVo.product_id}");				
			}
		});
	}); // END : 리뷰 삭제
	
	
	//리뷰 별점 선택(마우스오버,클릭)
	$("#stars li").on("mouseover",function() {
		var onStar = parseInt($(this).data("value"), 10);
		$(this).parent().children("li.star").each(function(e) {
			if (e < onStar) {
				$(this).addClass("hover");
			} else {
				$(this).removeClass("hover");
			}
		});
	}).on("mouseout",function() {
		$(this).parent().children("li.star").each(function(e) {
			$(this).removeClass("hover");
		});
	});
	$("#stars li").on("click", function() {
		var onStar = parseInt($(this).data("value"), 10);
		var stars = $(this).parent().children("li.star");
		for (i = 0; i < stars.length; i++) {
			$(stars[i]).removeClass("selected");
		}
		for (i = 0; i < onStar; i++) {
			$(stars[i]).addClass("selected");
		}
	});
	//END : 리뷰 별점 선택(마우스오버,클릭)

	//리뷰 입력
	$(".btnInsertReview").click(function(e) {
		e.preventDefault();
		var checkLogin = "${loginMemberVo}";
		if(checkLogin == ""){
			location.href = "/spring/member/login";
			console.log("1");
		}
		var review_content = $("#review_content").text();
		var review_rating = parseInt($('#stars li.selected').last().data('value'), 10);
		if (isNaN(review_rating)) {
			review_rating = 0;
		}
		var member_id = "${loginMemberVo.member_id}";
		var sData = {
			"member_id" : member_id,
			"product_id" : "${productVo.product_id}",
			"review_rating" : review_rating,
			"review_content" : review_content
		};
		$.post("/spring/review/insertReview",sData, function(rData) {
			if(rData=="true"){
				getReview(1);
				setRating("${productVo.product_id}");				
			}
		});
	});

	//페이징
	$(document).on("click", ".pagelink", function(e) {
		e.preventDefault();
		var page = $(this).attr("data-page");
		getReview(page);
	});

	
	//상품 별점,리뷰 수 세팅
	function setRating(product_id){
		$.get("/spring/review/setRating",{"product_id":product_id},function(rData){
			var jsonObject = JSON.parse(rData);
			$("#reviewCount").text(jsonObject.reviewCount + "개의 리뷰");
			$(".productRating").css("width", (jsonObject.ratingAvg/5)*100 + "%");
			$("#ratingAvg").text("("+jsonObject.ratingAvg+"/5점)");
		});
	}

	//리뷰 비동기 호출
	function getReview(page) {
		$("#review> tr:gt(0)").remove();
		var product_id = "${productVo.product_id}";
		var sData ={
				"page" : page,
				"product_id":product_id
		};
		$.get("/spring/review/reviewPaging",sData,function(rData) {
			var jsonArray = JSON.parse(rData);	
			for (var i = 0; i < jsonArray.length; i++) {
				var tr = $("#review").find("tr").eq(0).clone();
				var tds = tr.find("td");
				tds.eq(0).find("img").attr("src","/spring/product/getImage?imageName="+ jsonArray[i].member_pic);
				if(jsonArray[i].checkBuyer == "true"){
					tds.eq(0).find("span").text(jsonArray[i].member_id);
					tds.eq(0).find("span").append("<img src='/spring/resources/img/icon_label_buy.png' style='margin-left: 7px;'/>");
					
				}else{
					tds.eq(0).find("span").text(jsonArray[i].member_id);				
				}
				var review_rating = tds.eq(0).find(".review_rating");
				review_rating.empty();
				for (var j = 0; j < jsonArray[i].review_rating; j++) {
					review_rating.append("<i class='fa fa-star' style='color: orange'></i>");
				}
				for (var j = jsonArray[i].review_rating; j < 5; j++) {
					review_rating.append("<i class='fa fa-star-o' style='color: orange'></i>");
				}
				tds.eq(1).text(jsonArray[i].review_content);
				tds.eq(2).find("a").attr("data-review_no",jsonArray[i].review_no);
				if("${loginMemberVo.member_id}" != jsonArray[i].member_id){
					tds.eq(2).find("a").css("display","none");
				}
				tr.show();
				$("#review").append(tr);
			}
		});
	}
	
	
	// 좋아요 하트
	$("#likeHeart").click(function(e) {
		e.preventDefault();
		
		var url;
 
		var sData = {"product_id" : "${productVo.product_id}"};
		
		//좋아요가 가능한 경우
		if(isLike=="false" || isLike==false){
			console.log("isAlreadyLike false 실행됨");
			url = "/spring/like/insertLike";
			$.post(url,sData,function(rData){
				if(rData=="couldlike-true"){
 					$("#likeHeart").css("color", "#dd2222");
 					$("#heartIcon").attr("class", "fa fa-heart");
 					url="/spring/like/getProductLikeCount";
 					$.post(url,sData,function(rData){
 						$("#likeCount").text(rData);
 						});
 					getLikeCountNum();
 					isLike = !isLike;
 					console.log("isLike:",isLike);
				}else if(rData=="couldlike-flase"){
					alert("좋아요 등록에 실패했습니다.");
				}else if(rData=="notLogin"){
					alert("로그인후 이용바랍니다.");
	 				location.href="/spring/member/login";
				}
			});
		}else if(isLike=="true" || isLike==true){
			//좋아요가 이미 있어 불가능한 경우
			console.log("isAlreadyLike true 실행됨");
			url = "/spring/like/delete";
			$.post(url,sData,function(rData){
				console.log("rData:",rData);
				if(rData == "true"){
					$("#likeHeart").css("color", "#6f6f6f");
 					$("#heartIcon").attr("class", "fa fa-heart-o");
 					url="/spring/like/getProductLikeCount";
 					$.post(url,sData,function(rData){
 						$("#likeCount").text(rData);
 						});
 					getLikeCountNum();
 					isLike = !isLike;
 					
 					console.log("isLike:",isLike);
				}else{
					alert("좋아요 삭제에 실패했습니다.");
					
				}
			});
		}
		
		

	}); // END : 좋아요 하트
	
	
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
					
					<ul style="padding-top: 30px; margin-top: 40px;">
						<li>
							<b>지은이</b>
							<span>${productVo.product_author}</span>
						</li>
						<li>
							<b>출판사</b>
							<span>${productVo.product_publisher}</span>
						</li>
						
						<li>
							<table style="margin-top: 15px; margin-bottom: 20px;">
								<tr>
									<td style="padding-left: 0px; width: 170px;"><b>별점</b></td>
									<td>
										<div class="product__details__rating row"
											style="margin-left: 0px; margin-bottom: 0px; margin-right: 0px;">
										<div class="containerdiv">
											<div>
												<img src="/spring/resources/img/stars_blank.png">
											</div>
											<div class="productRating" style="width: 0%">
												<img src="/spring/resources/img/stars_full.png">
											</div>
										</div>
										</div>
									</td>
									<td style="text-align: center;"><span id="ratingAvg"></span></td>
								</tr>
							</table>
							
						</li>
						<li>
							<b>리뷰</b>
							<span id="reviewCount"></span>
						</li>
						
						<li>
							<b>배송료</b>
							<span>무료</span>
						</li>
						<li>
							<b>가격</b>
							<span class="product__details__price">
							<fmt:formatNumber value="${productVo.price}" pattern="#,###"/>원</span>
						</li>
						<li style="margin-top: 20px;margin-bottom: 30px;">
							<b>수량</b>
							<div class="product__details__quantity">
								<div class="quantity">
									<div class="pro-qty">
										<input type="text" value="1">
									</div>
								</div>
							</div>
						</li>
					</ul>
			
					<a href="#" class="primary-btn" id="btnInsertCart" style="margin-right: 18px;">장바구니 담기</a>
					<!-- START : 좋아요 -->	
					<a href="#" class="heart-icon" id="likeHeart" 
						<c:if test="${isAlreadyLike == 'true'}">
							style="color:#dd2222" 
						</c:if>>		　
					<c:if test="${isAlreadyLike == 'true'}">
						<i class="fa fa-heart" aria-hidden="true" id="heartIcon"></i>
					</c:if>
								
					<c:if test="${isAlreadyLike != 'true'}">
						<i class="fa fa-heart-o" aria-hidden="true" id="heartIcon"></i>
					</c:if>
					<span style="font-size:16px; color:gray" id="likeCount"> ${likeCount}</span>　</a>
					<!-- END : 좋아요 -->	
					<ul>
						<li><b>재고</b> <span>${productVo.product_quantity}</span></li>
						<li><b>공유하기</b>
							<div class="share">
								<a href="#"><i class="fa fa-facebook"></i></a> 
								<a href="#"><i class="fa fa-twitter"></i></a> 
								<a href="#"><i class="fa fa-instagram"></i></a> 
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="product__details__tab">
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item">
							<a class="nav-link active"
							data-toggle="tab" href="#tabs-1" role="tab"
							aria-selected="true">책 소개</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" data-toggle="tab"
							href="#tabs-2" role="tab" aria-selected="false">리뷰<span>(${reviewCount})</span></a>
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
								<table class="table table-hover table-striped">
									<thead>
										<tr>
											<th>리뷰</th>
											<th></th>
											<th></th>
										</tr>
										<tr class="reviewForm">
											<td style="width: 25%">
												<img
													<c:choose>
														<c:when test="${not empty loginMemberVo.member_pic}">
															src="/spring/product/getImage?imageName=${loginMemberVo.member_pic}"
														</c:when>
														<c:otherwise>
															src="/spring/resources/img/defaultprofile.png"
														</c:otherwise>
													</c:choose>
												width="50px" class="rounded-circle" /><br> ${loginMemberVo.member_id}<br>
												<div class='rating-stars'>
													<ul id='stars'>
														<li class='star' data-value='1'><i
															class='fa fa-star fa-fw'></i></li>
														<li class='star' data-value='2'><i
															class='fa fa-star fa-fw'></i></li>
														<li class='star' data-value='3'><i
															class='fa fa-star fa-fw'></i></li>
														<li class='star' data-value='4'><i
															class='fa fa-star fa-fw'></i></li>
														<li class='star' data-value='5'><i
															class='fa fa-star fa-fw'></i></li>
													</ul>
												</div> 
											<br>
											</td>
											<td style="width: 60%">
												<div contenteditable="true" id="review_content"
													style="resize: none; height: 100px; width: 90%; border: 1px solid #d3d3d3; padding: 10px; outline: none;"></div>		
											</td>
											<td style="width: 15%"><a href="#" class="primary-btn btnInsertReview">등록</a></td>
										</tr>

									</thead>
									<tbody id="review">
										<tr class="review_hidden" style="display: none">
											<td style="width: 25%">
												<img src="/spring/resources/img/defaultprofile.png"
												width="50px" class="rounded-circle" /><br> <span></span><br>
												<span style="display: none"> <i class="fa fa-star"
													style="color: orange"></i> <i class="fa fa-star-o"
													style="color: orange"></i></span> 
												<span class="review_rating"> </span>
											</td>
											<td style="width: 60%">
											</td>
											<td style="width: 15%">
												<a href="#" class="site-smbtn btnUpdateReview" style="margin-bottom: 10px">수정</a>
												<a href="#" class="site-smbtn btnDeleteReview">삭제</a>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="row">
								<div class="col-md-12">
									<nav>
										<div class="product__pagination pagination justify-content-center">
											<c:if test="${pagingDto.startPage ne 1}">
												<a class="pagelink" href="${pagingDto.startPage-1}">이전</a>
											</c:if>
											<c:forEach var="v" begin="${pagingDto.startPage}" end="${pagingDto.endPage}">
												<a class="pagelink" href="#" data-page="${v}">${v}</a>
											</c:forEach>
											<c:if test="${pagingDto.endPage lt pagingDto.totalPage}">
												<a class="pagelink" href="${pagingDto.endPage+1}">다음</a>
											</c:if>
										</div>
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
