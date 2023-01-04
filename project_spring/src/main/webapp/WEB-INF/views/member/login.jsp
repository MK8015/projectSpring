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
    <link rel="stylesheet" href="/spring/resources/css/styleA.css" type="text/css">
 <!--   <link rel="stylesheet" href="css/style.css" type="text/css"> -->
</head>
	<meta name="viewport" content="width=device-width, initial-scale=1">														
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">														
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>														
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>														
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>														
<script>
$(document).ready(function(){
	var loginresult="${login_result}"
	console.log("loginresult:",loginresult);
	if(loginresult=="true"){
		alert("회원가입에 성공하였습니다");
	}else if(loginresult=="false"){
		alert("다른 아이디를 사용해주세요");
	}
	
});
</script>










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
                                            <input type="text" class="form-control form-control-user"
                                                id="member_id" name="member_id" aria-describedby="emailHelp"
                                                placeholder="아이디를 입력해주세요">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="password" name="password" placeholder="비밀번호를 입력해주세요">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">아이디 기억</label>
                                            </div>
                                        </div>
                                        <button
                                         type="submit" class="btn btn-white text-white btn-user btn-block" style="background-color: rgb(127, 173, 57);">
                                            로그인
                                        </button>


                                    </form>
                                    <hr>


                                    
<div class="header__menu" align="center">
                            <ul>
                                <li><a href="forgot-password.html">비밀번호 찾기</a></li>
                                <li><a href="/spring/member/registerForm">회원 가입</a></li>
                            </ul>
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