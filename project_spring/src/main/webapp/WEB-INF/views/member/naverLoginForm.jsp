<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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


<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>


<script type="text/javascript">

  var naver_id_login = new naver_id_login("${NAVERAPIKEY}", "http://localhost/spring/member/naverLoginForm");

  // 접근 토큰 값 출력
 // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
 // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	 
	 //네이버에서 정보 받아오기
	 $("#loginToken").attr("value",naver_id_login.oauthParams.access_token);
	 $("#naver_name").attr("value",naver_id_login.getProfileData('name'));
	 $("#naver_eamil").attr("value",naver_id_login.getProfileData('email'));
	 $("#naver_id").attr("value",naver_id_login.getProfileData('id'));
	 $("#frmPaging").submit();


   }
 
</script>

</head>
<body>
	 <form method="post" id="frmPaging" action="/spring/member/naverLoginRun">
		<input type="hidden" id="loginToken" name="loginToken"/>
		<input type="hidden" id="naver_name" name="member_name"/>
		<input type="hidden" id="naver_eamil" name="email"/>
		<input type="hidden" id="naver_mobile" name="phonenum"/>
		<input type="hidden" id="naver_id" name="naver_id"/>
	</form>

</body>
</html>