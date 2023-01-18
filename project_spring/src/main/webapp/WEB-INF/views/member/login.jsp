<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>		

    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--     <meta http-equiv="X-UA-Compatible" content="ie=edge"> -->
    <title>로그인</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400;700&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/spring/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/spring/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/spring/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/spring/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/spring/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/spring/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/spring/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/spring/resources/css/style.css" type="text/css">
										

<style>
.login-btn {
	width: 106.812px;
	height: 24;
	font-size: 14px;
	color: #ffffff;
	font-weight: 500;
	text-transform: uppercase;
	display: inline-block;
	padding: 10px 30px 9px;
	background: #7fad39;
	border: none;
}



a {
	font-size: 16px;
	color: #252525;
	text-transform: uppercase;
	font-weight: 900;
	letter-spacing: 2px;
	-webkit-transition: all, 0.3s;
	-moz-transition: all, 0.3s;
	-ms-transition: all, 0.3s;
	-o-transition: all, 0.3s;
	transition: all, 0.3s;
	padding: 5px 0;
	display: block;
}

a:hover {
	color: #7fad39;
}


</style>


<script>
$(document).ready(function(){
	var registerresult="${register_result}"
	if(registerresult=="true"){
		alert("회원가입에 성공하였습니다");
	};
	
	var isLogin="${isLogin}"
	console.log("isLogin:",isLogin)
	if(isLogin=="fail"){
		alert("로그인에 실패하였습니다");
	};
	$("#customCheck").change(function(){
	});
});
</script>
	
</head>
 
<body class="header__top">
<div class="container">
	<!-- Outer Row -->
	<div class="row justify-content-center">
		<div class="col-lg-6">
			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="row">
						<div class="col-lg-12">
							<div class="p-5">
								<div class="text-center">
									<br><h3>환영합니다</h3><br><br>
								</div>
									<form class="user" method="post" action="/spring/member/login">
										<div class="form-group" >
											<input type="text" class="mypage__input"
												id="member_id" name="member_id" aria-describedby="emailHelp"
												placeholder="아이디를 입력해주세요" value="${cookie.member_id.value}">
										</div>
										<div class="form-group">
											<input type="password" class="mypage__input"
												id="password" name="password" placeholder="비밀번호를 입력해주세요">
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												<input type="checkbox" class="custom-control-input" id="customCheck" name="saveId"
													<c:if test="${not empty cookie.member_id}">
													checked
													</c:if>
												>
												<label class="custom-control-label" for="customCheck">아이디 기억</label>
											</div>
										</div>
										
									
									
									<table border="0" width="100%" style="text-align:center">
										<tr>
											<td width="10%"></td>
											<td width="35%">
												<button type="submit" class="login-btn">로그인</button>
											</td>
											<td width="10%"></td>
											<td width="35%">
												<div id="naver_id_login"><img width="223" 
									src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></div>
									<!-- //네이버아이디로로그인 버튼 노출 영역 -->
									<script type="text/javascript">
										var naver_id_login = new naver_id_login("JEjTlMWI0tXdC909VWl8", "http://localhost/spring/member/naverLoginForm");
										var state = naver_id_login.getUniqState();
										naver_id_login.setButton("white", 2,40);
										naver_id_login.setDomain("http://localhost/spring/member/login");
										naver_id_login.setState(state);
										naver_id_login.init_naver_id_login();
									</script>
											</td>
											<td width="10%"></td>
										</tr>
									</table>
									
									
									
										
									</form>
									
									
									<hr>
									
									
									
									<table border="0" width="100%" style="text-align:center">
										<tr>
											<td width="10%"></td>
											<td width="35%">
												<a href="/spring/member/forgot-passwordForm">비밀번호 찾기</a>
											</td>
											<td width="10%"></td>
											<td width="35%"><a href="/spring/member/registerForm">회원 가입</a></td>
											<td width="10%"></td>
										</tr>
									</table>
									
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


    <!-- Js Plugins -->
    <script src="/spring/resources/js/jquery-3.3.1.min.js"></script>
    <script src="/spring/resources/js/bootstrap.min.js"></script>
    <script src="/spring/resources/js/jquery.nice-select.min.js"></script>
    <script src="/spring/resources/js/jquery-ui.min.js"></script>
    <script src="/spring/resources/js/jquery.slicknav.js"></script>
    <script src="/spring/resources/js/mixitup.min.js"></script>
    <script src="/spring/resources/js/owl.carousel.min.js"></script>
    <script src="/spring/resources/js/main.js"></script>



</body>

</html>
