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
    <link rel="stylesheet" href="/spring/resources/css/style.css" type="text/css">


	<meta name="viewport" content="width=device-width, initial-scale=1">														
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">														
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>														
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>														
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>		

<style>

.forgot__input p {
	color: #1c1c1c;
	margin-bottom: 20px;
}

.forgot__input p span {
	color: #dd2222;
}

.forgot__input {
	width: 100%;
	height: 46px;
	margin: 0px 0px 0px;
	border: 1px solid #ebebeb;
	padding-left: 20px;
	font-size: 16px;
	color: #6f6f6f;
	border-radius: 4px;
}

.forgot__input::placeholder {
	color: #6f6f6f;
	font-weight: 400;
}

</style>

<script>
$(document).ready(function(){
	var isEmpty="${isEmpty}";
	console.log("isEmpty:",isEmpty);
	if(isEmpty=="true"){
		alert("아이디와 이메일을 적어주세요");
	}
	var isExist="${isExist}"
	console.log("isExist:",isExist);
	if(isExist=="false"){
		alert("아이디나 이메일이 존재하지 않습니다 다시 확인해주세요")
	}
	
});

</script>


</head>

<body  class="header__top">

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
                                                                                <br><h3>비밀번호 찾기</h3><br>
                                        <p class="mb-4">가입하신 아이디와 이메일주소를 입력해주시면<br>임시 비밀번호를 발송해 드립니다</p>
                                    </div>
                                    <form class="user" action="/spring/member/forgot-password" method="post">
                                        <div class="form-group">
                                            <input type="text" class="forgot__input"
                                                id="member_id" name="member_id" 
                                                placeholder="아이디를 입력해주세요">
                                        </div>
                                         <div class="form-group">
                                            <input type="email" class="forgot__input"
                                                id="to" name="to" 
                                                placeholder="임시 비밀번호를 받으실 이메일을 입력해주세요">
                                        </div>
                                        <button type="submit" class="btn btn-white text-white btn-user 
                                        		btn-block" style="background-color: rgb(127, 173, 57);">
                                            이메일로 임시 비밀번호 발송
                                        </button>
                                    </form>
                                    <hr>

									<div class="header__menu" align="center">
	                            <ul>
	                                <li><a href="/spring/member/registerForm">회원 가입</a></li>
	                                <li><a href="/spring/member/login">로그인</a></li>
	                            </ul>
	                        		</div>
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