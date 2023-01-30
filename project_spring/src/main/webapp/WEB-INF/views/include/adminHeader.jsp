<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
    
    
<!DOCTYPE html>
<html lang="zxx">

<head>
	<meta charset="UTF-8">
	<meta name="description" content="Ogani Template">
	<meta name="keywords" content="Ogani, unica, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>NONFICTION</title>
	
	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	
	<!-- Css Styles -->
	<link rel="stylesheet" href="/spring/resources/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="/spring/resources/css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="/spring/resources/css/elegant-icons.css" type="text/css">
	<link rel="stylesheet" href="/spring/resources/css/nice-select.css" type="text/css">
	<link rel="stylesheet" href="/spring/resources/css/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet" href="/spring/resources/css/owl.carousel.min.css" type="text/css">
	<link rel="stylesheet" href="/spring/resources/css/slicknav.min.css" type="text/css">
	<link rel="stylesheet" href="/spring/resources/css/style.css" type="text/css">

	<script src="/spring/resources/js/jquery-3.3.1.min.js"></script>
	<!-- css/style이 바로 안 읽힘, 이름 바꿔서 읽어야 읽힘 ㅠㅠ 나중에 style로 수정하기 -->

	
	<!-- Js Plugins -->
   <script src="/spring/resources/js/jquery-3.3.1.min.js"></script>
   <script src="/spring/resources/js/bootstrap.min.js"></script>
   <script src="/spring/resources/js/jquery.nice-select.min.js"></script>
   <script src="/spring/resources/js/jquery-ui.min.js"></script>
   <script src="/spring/resources/js/jquery.slicknav.js"></script>
   <script src="/spring/resources/js/mixitup.min.js"></script>
   <script src="/spring/resources/js/owl.carousel.min.js"></script>
<!--    <script src="/spring/resources/js/main.js"></script> -->

<script>
$(document).ready(function() {
	var result = "${result}";
	var location = document.referrer;
	location.contains
	if(result=="true"){
		alert("입력 성공");
	}else if(result == "false"){
		alert("입력 실패")
	}
	// 검색 버튼
	   $("#btnSearch").click(function(e) {
		  e.preventDefault();
		  var searchType = $("#frmSearch").find("[name=searchType]").val(); 
		  var keyword = $("#frmSearch").find("[name=keyword]").val();
		  $("#frmPaging").find("[name=searchType]").val(searchType);
		  $("#frmPaging").find("[name=keyword]").val(keyword);
		  $("#frmPaging").find("[name=page]").val("1");
		  $("#frmPaging").find("[name=perPage]").val("8");
		  $("#frmPaging").attr("action", "/spring/list/list");
		  $("#frmPaging").submit();
		  
	   });
});
</script>
</head>
<body>

<%@ include file="../include/pageParam.jsp" %>

<!-- Humberger Begin 반응형 -->

<div class="humberger__menu__overlay">
</div>
<div class="humberger__menu__wrapper">
	<div class="humberger__menu__logo">

		<a href="/main/index"><img src="/spring/resources/img/logo.png" alt=""></a>
	</div>
	<div class="humberger__menu__cart">
		<ul>
			<li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
			<li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
		</ul>
		<div class="header__cart__price">item: <span>$150.00</span></div>
	</div>
	<div class="humberger__menu__widget">
		<div class="header__top__right__language">
			<img src="/spring/resources/img/language.png" alt="">
			<div>English</div>
			<span class="arrow_carrot-down"></span>
			<ul>
				<li><a href="#">Spanis</a></li>
				<li><a href="#">English</a></li>
			</ul>
		</div>
		<div class="header__top__right__auth">
			<a href="#"><i class="fa fa-user"></i> Login</a>
		</div>
	</div>
	<nav class="humberger__menu__nav mobile-menu">
		<ul>
			<li class="active"><a href="./index.html">Home</a></li>
			<li><a href="./shop-grid.html">Shop</a></li>
			<li><a href="#">Pages</a>
				<ul class="header__menu__dropdown">
					<li><a href="./shop-details.html">Shop Details</a></li>
					<li><a href="./shoping-cart.html">Shoping Cart</a></li>
					<li><a href="./checkout.html">Check Out</a></li>
					<li><a href="./blog-details.html">Blog Details</a></li>
				</ul>
			</li>
			<li><a href="./blog.html">Blog</a></li>
			<li><a href="./contact.html">Contact</a></li>
		</ul>
	</nav>
	<div id="mobile-menu-wrap"></div>
	<div class="header__top__right__social">
		<a href="#"><i class="fa fa-facebook"></i></a>
		<a href="#"><i class="fa fa-twitter"></i></a>
		<a href="#"><i class="fa fa-linkedin"></i></a>
		<a href="#"><i class="fa fa-pinterest-p"></i></a>
	</div>
	<div class="humberger__menu__contact">
		<ul>
			<li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
			<li>Free Shipping for all Order of $99</li>
		</ul>
	</div>
</div>
<!-- END : START : 반응형 부분 : 나중에 고칠게요 ㅠㅠ -->

<!-- START : 헤더 -->
<!-- START : 헤더의 첫 번째 줄 -->
<header class="header">
	<div class="header__top">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<nav class="header__menu">
						<ul>
							<li class="active"><a href="/spring/main/index">MAIN</a></li>
							<li><a href="/spring/list/list">BOOK</a>
								<ul class="header__menu__dropdown">
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
							</li>
							<li><a href="/spring/main/event">EVENT</a></li>
							<li><a href="/spring/board/list">Q & A</a></li>
							<li><a href="/spring/main/about">ABOUT</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="header__top__right">
						<div>
							<!-- 로그인 안 했을 때 -->
						<c:choose>
							<c:when test="${empty loginMemberVo.member_id}">
								<div class="header__top__right__social">
								<a href="/spring/member/registerForm">회원가입</a>
								</div>
								<div class="header__top__right__auth">
								<a href="/spring/member/login">로그인</a>
								</div>
							</c:when>
							
							<c:when test="${loginMemberVo.member_id eq 'admin'}">
								<div class="header__top__right__language">
									<div>${loginMemberVo.member_id}님 환영합니다</div>
									<span class="arrow_carrot-down"></span>
									<ul>
										<li><a href="/spring/admin/index">관리자 페이지</a></li>
										<li><a href="/spring/member/mypage">마이 페이지</a></li>
										<li><a href="/spring/member/logout">로그아웃</a></li>
									</ul>
								</div>
							</c:when>
							
							<c:otherwise>
								<!-- 회원일 때 마이페이지 뜨기 -->
								<div class="header__top__right__language">
									<div>${loginMemberVo.member_id}님 환영합니다</div>
									<span class="arrow_carrot-down"></span>
									<ul>
										<li><a href="/spring/member/mypage">마이 페이지</a></li>
										<li><a href="/spring/like/list">위시 리스트</a></li>
										<li><a href="/spring/cart/list">장바구니</a></li>
										<li><a href="/spring/member/logout">로그아웃</a></li>
									</ul>
								</div>
								
							</c:otherwise>
						</c:choose>
							
						</div>
						
					
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- END : 헤더의 첫 번째 줄 -->
<!-- START : 헤더의 두 번째 줄 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="header__logo">
					<a href="/spring/main/index"><img src="/spring/resources/img/logo.png" alt=""></a>
				</div>
			</div>
			<div class="humberger__menu__overlay"></div>
			
		<!-- 헤더 검색창 -->
			<div class="col-lg-7 header__logo">
				<div class="header__search__form">
					<form id= "frmSearch">
						<div class="input-group">
							<select class="header__search__categories" name="searchType">
			            		<option value="t"
			            			<c:if test="${pagingDto.searchType == 't'}">
			            				selected
			            			</c:if>	
			            		>제목</option>
			            		<option value="w"
			            			<c:if test="${pagingDto.searchType == 'w'}">
			            				selected
			            			</c:if>	
			            		>작가</option>
			            		<option value="p"
			            			<c:if test="${pagingDto.searchType == 'tc'}">
			            				selected
			            			</c:if>	
			            		>출판사</option>
			            	</select>
			            	
							<input type="text" placeholder="검색어를 입력하세요"
								name="keyword" value="${pagingDto.keyword}">
						</div>
						<div class="input-group-append"> 
						<button id="btnSearch" class="site-btn">검색</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-lg-2">
				<div class="header__cart">
					<ul>
						<li><a href="/spring/like/list"><i class="fa fa-heart"></i> 
							<span id="headerLikeCount" 
							<c:if test="${empty loginMemberVo.memberLikeCount || 
											loginMemberVo.memberLikeCount eq 0}">
								style="display:none"</c:if>
								>
								${loginMemberVo.memberLikeCount}
							</span>
							</a></li>
						<li><a href="/spring/cart/list"><i class="fa fa-shopping-bag"></i> 
							<span id="headerCartCount" 
							<c:if test="${empty loginMemberVo.memberCartCount || 
											loginMemberVo.memberCartCount eq 0}">
								style="display:none"</c:if>
								>
								${loginMemberVo.memberCartCount}
							</span>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	<div class="humberger__open">
		<i class="fa fa-bars"></i>
	</div>
	</div>
</header>
<!-- END : 헤더의 두 번째 줄 -->
<!-- END : 헤더 끝 -->

<!-- Blog Details Section Begin -->
	<section class="mypage__sidebar spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-2 col-md-5 order-md-1 order-2">
					<div class="mypage__sidebar__item">
						<h4>관리자<br>메뉴</h4>
						<ul>
							<li><a href="/spring/admin/product">상품 관리</a></li>
							<li><a href="/spring/admin/order">주문 관리</a></li>
							<li><a href="/spring/admin/member">회원 관리</a></li>
						</ul>
					</div>
				</div>