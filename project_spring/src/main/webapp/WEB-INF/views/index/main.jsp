<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>

<style>
.categories {
	padding-top: 30px;
	padding-bottom: 0px;
}


.abs {
  position: absolute;
  bottom: 25px;
  right: 10px;
  font-size: 10px;
}

.child {
  color: lightgray;
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
 		
		var product_id = $(this).attr("data-product_id");
		var sData = {"product_id" : product_id};
		var url = "/spring/cart/insertProduct"
		$.post(url, sData, function(rData) {
			
			if (rData == "false"){
				alert("장바구니 등록 실패!");
				getCartCountNum();
				return;
			} else if (rData == "notLogin") {
				alert("로그인후 이용바랍니다.")
				location.href="/spring/member/login";
			}else if(rData=="true"){
				getCartCountNum();
				url="/spring/cart/isAlreadyCart";
				sData={"product_id":product_id};
				$.post(url,sData,function(rData){
					var AlreadyCartResult=rData;
					console.log("parseInt(AlreadyCartResult):",parseInt(AlreadyCartResult));
					if(AlreadyCartResult=="1"){
						showTextTagCart.text("카트에 추가되었습니다");
					}else{
						showTextTagCart.text("수량이 추가되었습니다.");
					}
					
					
				});
				

				
			}
		});
		var p = $(this).next();
		p.css("display","");
		setTimeout(hideDisplay, 1000, p.find(".closeBtn"));
 	});
 	
 	// 카트 닫기 버튼
 	$(".closeBtn").click(function() {
 		$(this).parent().attr("style","display:none");
 	});
 	
 	// 좋아요 클릭
 	$(document).on("click", ".like-cart", function(e) {
 		e.preventDefault();
 		//좋아요 그림 바꾸는 클래스 있는 i테그
 		var nowclickLike= $(this).find("i");
 		var showTextTag= $(this).parent().find("p").find("span");
 		
 		
		var product_id = $(this).attr("data-product_id");
		var alreadyclick=$(this).attr("data-already_click");
	
 		
		var url = "/spring/like/insertLike";
		var sData = {
				"product_id" : product_id
		};
	
		
		// 좋아요 0 빨간색으로 적힌 부분 바꾸기 
		var likeCount = $(this).parent().parent().parent().next().find(".likeCount"); 
		var headerLikeCount = $(".header__cart").find("headerLikeCount"); // 헤더 좋아요 딱지
		
		$.post(url, sData, function(rData) {
 		
 			
			if (rData == "couldlike-true") {
			
				nowclickLike.attr("class","fa fa-trash");
				getLikeCountNum();
				showTextTag.text("위시 리스트에 담겼습니다.");
			}else if (rData == "couldlike-flase"){
				alert("좋아요 등록 실패!");
				return;
			}else if (rData == "notLogin") {
				alert("로그인후 이용바랍니다.")
				location.href="/spring/member/login";
			}else if(rData=="coudntlike-true") {
				getLikeCountNum();
				nowclickLike.attr("class","fa fa-heart");
				showTextTag.text("위시 리스트에서 삭제되었습니다.")
			}else if(rData=="couldntlike-false"){
				alert("삭제 실패");
			}
		});
		var p = $(this).next();
		p.css("display","");
		setTimeout(hideDisplay, 1000, p.find(".closeBtn"));
 	});
	
 	
 	
}); //$(document).ready(function()
		
function hideDisplay(closeBtn) {
		closeBtn.parent().attr("style","display:none");
	
	}
</script>
<!-- 네이버 api 넣었습니다 -->
<!-- <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>




<script type="text/javascript">
  var naver_id_login = new naver_id_login("JEjTlMWI0tXdC909VWl8", "/spring/main/naverlogin");
  // 접근 토큰 값 출력s
//   alert(naver_id_login.oauthParams.access_token);
 // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
 // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	 
	 
     alert(naver_id_login.getProfileData('email'));
     alert(naver_id_login.getProfileData('nickname'));
     alert(naver_id_login.getProfileData('age'));
  }

</script>

<!-- 네이버 api 넣었습니다 여기가 끝입니다-->
<!-- START : 카테고리 -->
<section class="categories spad"> 
	<div class="container">
		<div class="row">
			<div class="categories__slider owl-carousel">
				<div class="col-lg-3">
					<div class="categories__item set-bg" data-setbg="/spring/resources/img/categories/humanity.jpg"
						 onclick="location.href='/spring/list/list?category=humanity';">
						<h5><a href="/spring/list/list?category=humanity">인문학</a></h5>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="categories__item set-bg" data-setbg="/spring/resources/img/categories/economy.jpg"
						onclick="location.href='/spring/list/list?category=economy';">
						<h5><a href="/spring/list/list?category=economy">경제/경영</a></h5>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="categories__item set-bg" data-setbg="/spring/resources/img/categories/sociology.jpg"
						onclick="location.href='/spring/list/list?category=sociology';">
						<h5><a href="/spring/list/list?category=sociology">정치/사회</a></h5>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="categories__item set-bg" data-setbg="/spring/resources/img/categories/history.jpg"
						onclick="location.href='/spring/list/list?category=history';">
						<h5><a href="/spring/list/list?category=history">역사</a></h5>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="categories__item set-bg" data-setbg="/spring/resources/img/categories/science.jpg"
						onclick="location.href='/spring/list/list?category=science';">
						<h5><a href="/spring/list/list?category=science">과학</a></h5>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="categories__item set-bg" data-setbg="/spring/resources/img/categories/culture.jpg"
						onclick="location.href='/spring/list/list?category=culture';">
						<h5><a href="/spring/list/list?category=culture">문화/예술</a></h5>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="categories__item set-bg" data-setbg="/spring/resources/img/categories/computer.jpg"
						onclick="location.href='/spring/list/list?category=computer';">
						<h5><a href="/spring/list/list?category=computer">컴퓨터</a></h5>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="categories__item set-bg" data-setbg="/spring/resources/img/categories/language.jpg"
						onclick="location.href='/spring/list/list?category=language';">
						<h5><a href="/spring/list/list?category=language">외국어</a></h5>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="categories__item set-bg" data-setbg="/spring/resources/img/categories/religion.jpg"
						onclick="location.href='/spring/list/list?category=religion';">
						<h5><a href="/spring/list/list?category=religion">종교/역학</a></h5>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="categories__item set-bg" data-setbg="/spring/resources/img/categories/self.jpg"
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
					<h2>BEST SELLER</h2>
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
							<!-- 좋아요 -->
							<li><a href="#" class="like-cart" 
								data-product_id="${productVo.product_id}" data-already_click="true">
								<c:choose>
									<c:when test="${productVo.member_id==null}">
										<i class="fa fa-heart"></i>
									</c:when>
									<c:otherwise>
										<i class="fa fa-trash"></i>
									</c:otherwise>
								</c:choose>
								 </a>
								<p class="child abs" style="display:none">
									<span>위시 리스트에 담겼습니다.</span><br>
									<input onclick="location.href='/spring/like/list'" 
									type="button" value="위시 리스트 보기>"/>
									<input type="button" class="closeBtn" value="닫기"/>
								</p>
							</li>
							<!-- 장바구니 -->
							<li><a href="#" class="shopping-cart"
								data-product_id="${productVo.product_id}">
									<i class="fa fa-shopping-cart parent"></i>
								</a>
								<p class="child abs" style="display:none"><span>
									</span><br>
									<input onclick="location.href='/spring/cart/list'" 
									type="button" value="카트 보기>"/>
									<input type="button" class="closeBtn" value="닫기"/>
								</p>
							</li>
						</ul>
					</div>
					<div class="featured__item__text">
						<h6><a href="/spring/product/detail?product_id=${productVo.product_id}">
								${productVo.product_name}<br>
									<span style="font-size:11px; color:gray;">
									${productVo.product_author} | ${productVo.product_publisher}</span></a></h6>
						<h5><fmt:formatNumber value="${productVo.price}" pattern="#,###"/>
						원</h5>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
</section>
<!-- END : 메인 리스트 -->



<%@ include file="../include/footer.jsp" %>