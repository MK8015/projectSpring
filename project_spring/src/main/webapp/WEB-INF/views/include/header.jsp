<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	
	<!-- Css Styles -->
	<link rel="stylesheet" href="/spring/resources/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="/spring/resources/css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="/spring/resources/css/elegant-icons.css" type="text/css">
	<link rel="stylesheet" href="/spring/resources/css/nice-select.css" type="text/css">
	<link rel="stylesheet" href="/spring/resources/css/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet" href="/spring/resources/css/owl.carousel.min.css" type="text/css">
	<link rel="stylesheet" href="/spring/resources/css/slicknav.min.css" type="text/css">
	<link rel="stylesheet" href="/spring/resources/css/styleB.css" type="text/css">
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
	
</head>

<body>

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
<!-- Humberger End -->

<!-- Header Section Begin -->
<header class="header">
	<div class="header__top">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<nav class="header__menu">
						<ul>
							<li class="active"><a href="/spring/main/list">MAIN</a></li>
							<li><a href="/spring/product/list">PRODUCT</a>
								<ul class="header__menu__dropdown">
									<li><a href="./shop-details.html">Shop Details</a></li>
									<li><a href="./shoping-cart.html">Shoping Cart</a></li>
									<li><a href="./checkout.html">Check Out</a></li>
									<li><a href="./blog-details.html">Blog Details</a></li>
								</ul>
							</li>
							<li><a href="#">EVENT</a></li>
							<li><a href="./blog.html">NOTICE</a></li>
							<li><a href="./contact.html">Q & A</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="header__top__right">
						<div class="header__top__right__social">
							<a href="#">회원가입</a>
						</div>
						<div class="header__top__right__social">
							<a href="#">로그인</a>
						</div>
						<div class="header__top__right__auth">
							<a href="#">마이 페이지</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-lg-2">
				<div class="header__logo">


					<a href="/spring/main/list"><img src="/spring/resources/img/logo.png" alt=""></a>
				</div>
			</div>
			<div class="humberger__menu__overlay"></div>
			<div class="col-lg-8 header__logo">
				<div class="header__search__form">
					<form>
						<div>
							<select name="searchType" class="header__search__categories">
								<option value="t">상품명</option>
								<option value="c">내용</option>
								<option value="w">작성자</option>
							</select>
							<input type="text" placeholder="검색어를 입력하세요">
						</div>
						<div class="input-group-append"> <button id="btnSearch" class="site-btn">검색</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-lg-2">
				<div class="header__cart">
					<ul>
						<li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
						<li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
					</ul>
				</div>
			</div>
		</div>
	<div class="humberger__open">
		<i class="fa fa-bars"></i>
	</div>
	</div>
</header>
<!-- Header Section End -->
