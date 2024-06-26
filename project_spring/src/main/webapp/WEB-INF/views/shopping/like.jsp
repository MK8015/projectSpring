<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<style>
.wishlist {
	padding-top: 30px;
	padding-bottom: 0px;
}

.wishlist-section {
	display: flex;
	align-items: center;
	padding: 43px 0 42px;
}

.wishlist__text h2 {
	font-size: 46px;
	color: #ffffff;
	font-weight: 700;
}

.abs {
  position: absolute;
  bottom: 25px;
  right: 10px;
  font-size: 10px;
}

.child {
  color: gray;
  background: white;
  padding: 0.5rem;
}
</style>

<script>
$(document).ready(function() {


 	// 장바구니 클릭 : 비동기식 정보 넘기기
 	$(document).on("click", ".shopping-cart", function(e) {
 		var showTextTagCart= $(this).parent().find("p").find("span");
 		e.preventDefault();
 		
		var headerCartCount = $(".headerCartCount"); // 헤더 장바구니 딱지
		
		var product_id = $(this).attr("data-product_id");
		var sData = {"product_id" : product_id};
		var url = "/spring/cart/insertProduct"
		$.post(url, sData, function(rData) {
			if (rData == "true") {

				getCartCountNum();
				url="/spring/cart/isAlreadyCart";
				sData={"product_id":product_id};
				$.post(url,sData,function(rData){
					var AlreadyCartResult=rData;
					if(AlreadyCartResult=="1"){
						showTextTagCart.text("카트에 추가되었습니다");
					}else{
						showTextTagCart.text("수량이 추가되었습니다.");
					}
					
					
				});
				
			} else if (rData == "false"){
				alert("장바구니 등록 실패!");
				return;
			} else if (rData == "notLogin") {
				alert("로그인후 이용바랍니다.")
				location.href="/spring/member/login";
			}
		});
		var p = $(this).next();
		p.css("display","");
		setTimeout(hideDisplay, 1000, p.find(".closeBtn"));
 	});
 	
 	function hideDisplay(closeBtn) {
 		closeBtn.parent().attr("style","display:none");
 	}
 	
 	// 카트 닫기 버튼
 	$(".closeBtn").click(function() {
 		$(this).parent().attr("style","display:none");
 	});
 	
 	
	
  	// 쓰레기통 클릭
 	$(document).on("click", ".like-delete", function(e) {
 		e.preventDefault();
 		
		var headerLikeCount = $("#headerLikeCount"); // 헤더 좋아요 딱지
		var deleteEl = [];
		var product_id = $(this).attr("data-product_id");
		deleteEl.push($(this).closest(".delete"));
		
		var url = "/spring/like/delete";
		var sData = {
				"product_id" : product_id
		};
		
		$.post(url, sData, function(rData) {
 			if (rData == "true"){
 				getLikeCountNum(); 				
				$.each(deleteEl, function() {
					$(this).fadeOut(1000, function() {
			            $(this).remove();
			        });
				});
			}
		});
 	});
 	
	
	
}); //$(document).ready(function()
</script>


<!-- START : Shopping Cart 이미지 Section -->
<section class="subtitle spad">
	<div class="container">
		<div class="row subtitle-section set-bg" data-setbg="/spring/resources/img/breadcrumb.jpg">
			<div class="col-lg-12 text-center">
				<div class="subtitle__text">
					<h2>Wish List</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
<!-- END : Shopping Cart 이미지 Section -->

<!-- START : 메인 리스트 -->
<section class="featured spad">
	<div class="container">
		
		<!-- 여기 div 반복 -->
		<div class="row featured__filter">
		<c:forEach items="${likeProductList}" var="list">
			<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat delete">
				<div class="featured__item">
					<div class="featured__item__pic">
					<!-- 이미지 누르면 상품 디테일로 가기 -->
						<img class="featured__item__pic" width="135px" height="200px"
							src="/spring/product/getImage?imageName=${list.product_image}"
							alt="" onclick="location.href='/spring/product/detail?product_id=${list.product_id}'">

						<ul class="featured__item__pic__hover">
							<li><a href="#" class="like-delete" 
									data-product_id="${list.product_id}"><i class="fa fa-trash"></i></a></li>
							<li><a href="#" class="shopping-cart"
												data-product_id="${list.product_id}">
													<i class="fa fa-shopping-cart parent"></i>
												</a>
												<p class="child abs" style="display:none">
													<span></span><br>
													<input onclick="location.href='/spring/cart/list'" 
													type="button" value="카트 보기>"/>
													<input type="button" class="closeBtn" value="닫기"/>
												</p>
											</li>
						</ul>
						
					</div>
					<div class="featured__item__text">
						<h6><a href="/spring/product/detail?product_id=${list.product_id}">
								${list.product_name}<br>
									<span style="font-size:11px; color:gray;">
									${list.product_author} | ${list.product_publisher}</span></a></h6>
						<h5><fmt:formatNumber value="${list.price}" pattern="#,###"/>원</h5>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
</section>
<!-- END : 메인 리스트 -->



<%@ include file="../include/footer.jsp" %>