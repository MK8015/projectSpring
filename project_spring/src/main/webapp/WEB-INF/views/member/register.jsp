<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="zxx">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>회원가입</title>

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



<!--첨부파일 style 조정한 것 -->
<style>
.modify__form p {
	column-rule: #b2b2b2;
}

.modify__input {
	margin-bottom: 24px;
}

.modify__input p {
	color: #1c1c1c;
	margin-bottom: 20px;
}

.modify__form span {
	color: #dd2222;
}

.modify__input {
	width: 98%;
	height: 46px;
	margin: 0px 10px 25px;
	border: 1px solid #ebebeb;
	padding-left: 20px;
	font-size: 16px;
	color: #6f6f6f;
	border-radius: 4px;
}

.modify__input__3spots {
	width: 25%;
	height: 46px;
	margin: 0px 10px 25px;
	border: 1px solid #ebebeb;
	padding-left: 20px;
	font-size: 16px;
	color: #6f6f6f;
	border-radius: 4px;
}

.modify__input::placeholder {
	color: #6f6f6f;
}


.modify-btn {
	width: 100%;
	font-size: 14px;
	color: #ffffff;
	font-weight: 500;
	text-transform: uppercase;
	display: inline-block;
	padding: 10px 30px 10px;
	background: #7fad39;
	border: none;
}

.form-group .custom-file {
	display: inline-block;
	height: 30px;
	padding: 10px 20px;
	margin: 0px 10px 25px;
	vertical-align: middle;
	border: 1px solid #ebebeb;
	color: #6f6f6f;
	border-radius: 4px;
	font-size: 16px;
}

.form-group label {
	display: inline-block;
	padding: 5px 10px;
	color: #fff;
	vertical-align: middle;
	background-color: #999999;
	cursor: pointer;
	width: 98%;
	height: 35px;
	margin-top: 5px;
	margin-left: 5px;
}

.form-group input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}

#product_info {
        text-align: center;
      }
</style>


<script>
$(document).ready(function() {
	//회원가입 실패(flase시 안내창)
	var registerresult = "${register_result}";
	if (registerresult == "flase") {
		alert("회원가입에 실패하였습니다 다시 회원가입 해주세요");
	}

	var member_id = ""
	//아이디 중복확인 
	$("#id_check").click(function(){

				//들어간 값이 없을때
				member_id = $("#member_id").val().trim();
				console.log("member_id:", member_id);
				if ($("#member_id").val().trim() == "") {
					alert("아이디를 입력해주세요");
					$("#member_id").focus();
					return false;
				} else {
					//제대로 값을 넣었을때
					url = "/spring/member/idcheck";
					sData = {
						"member_id" : member_id
					};
					$.post(url, sData, function(rData) {
						console.log("idcheck rData", rData);
						if (rData) {
							$("#isUsedid").hide(0).text(
									"이미 사용중인 아이디입니다").attr(
									"class",
									"alert alert-danger")
									.show(1000);

						} else {
							$("#isUsedid").hide(0).text(
									"사용 가능한 아이디 입니다").attr(
									"class",
									"alert alert-success").show(
									1000).attr("data-idCanUse",
									member_id);
						}
					});
				}
			});
	
	//폼을 전송할 떄
	$("#registerForm").submit(function() {
		var register_phonenum = $("#phonenum1").val()+'-'+$("#phonenum2").val()+'-'+$("#phonenum3").val();
		$("#phonenum").val(register_phonenum);
		
		//각 회원가입 필수 내용 들어가있는지 확인
		if ($("#password").val() == "") {
			alert("패스워드를 확인해주세요")
			return false;
		} else if ($("#member_name").val() == "") {
			alert("이름을 확인해주세요")
			return false;
		} else if ($("#phonenum1").val() == "" || $("#phonenum2").val() == "" || $("#phonenum3").val() == "") {
			alert("휴대폰번호를 확인해주세요")
			return false;
		} else if ($("#email").val() == "") {
			alert("이메일을 확인해주세요")
			return false;
		} else if ($("#address").val() == "") {
			alert("주소를 확인해주세요")
			return false;
		}

		//멤버아이디체크 클릭했는지 + 클릭했다면 사용가능한 아이디가 맞는지 	
		var isIdCheck = $("#isUsedid").attr("class");
		if (isIdCheck == "alert alert-success") {
			var idCanUse = $("#isUsedid").attr("data-idCanUse");
			console.log("idCanUse", idCanUse);
			console.log("member_id", member_id);
			if (idCanUse == member_id) {
				return true;
			};
		};
		alert("아이디 중복체크가 맞는지 확인해주세요");
		return false;
	});
	
	//들어간 이미지가 변할 때 
	$("#member_pic").change(function(e) {

		var insertimage = this.files[0];
		console.log("insertimage:", insertimage);

		var fileReader = new FileReader();
		fileReader.readAsDataURL(insertimage);
		fileReader.onload = function(e) {
		
		var imgFileName = $("#member_pic").val();
		var spliteImgFileName = imgFileName.split("\\");
		var ImageName= spliteImgFileName.pop();
		$("#pic_label").text(ImageName);
		$("#registerImage>img").attr("src",e.target.result);
		
		};
	});

});//document
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		window.onload = function(){
		    document.getElementById("address").addEventListener("click", function(){ //주소입력칸을 클릭하면
		        //카카오 지도 발생
		        new daum.Postcode({
		        
		            oncomplete: function(data) { //선택시 입력값 세팅
		                document.getElementById("address").value = data.address; // 주소 넣기
		                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
		            	
		            }
		        }).open();
		    });
		    
		    
		}
		</script>	
		

</head>

<body>
<!-- Humberger Begin 반응형 -->

<div class="humberger__menu__overlay">
</div>
<div class="humberger__menu__wrapper">
	<div class="humberger__menu__logo">
		<a href="/spring/main/index"><img src="/spring/resources/img/logo.png" alt=""></a>
	</div>
	<div class="humberger__menu__widget">
		<div class="header__top__right__auth">
			<a href="/spring/member/login"><i class="fa fa-user"></i>로그인</a>
			<a href="/spring/member/registerForm"><i class="fa fa-user"></i>회원가입</a>
		</div>
	</div>
	<nav class="humberger__menu__nav mobile-menu">
		<ul>
			<li class="active"><a href="/spring/main/list">MAIN</a></li>
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
			<li><a href="#">ABOUT</a></li>
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
<!-- END : START : 반응형 부분>

<!-- START : 헤더 -->
<!-- START : 헤더의 첫 번째 줄 -->
<header class="header">
<!-- END : 헤더의 첫 번째 줄 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="header__logo">
					<a href="/spring/main/index"><img src="/spring/resources/img/logo.png" alt=""></a>
				</div>
			</div>
			<div class="humberger__menu__overlay"></div>
			<div class="col-lg-9"></div>
			
		</div>
	<div class="humberger__open">
		<i class="fa fa-bars"></i>
	</div>
	</div>
</header>
<!-- END : 헤더 끝 -->

<div class="header__top">
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
										<br>
										<h3>회원 가입</h3>
										<br>
										<br>
									</div>


									<form class="modify__form" id="registerForm" method="post"
										action="/spring/member/register" enctype="multipart/form-data">
										<div class="row">
										<div class="col-lg-12">
										<div class="form-gruop row">
											<div class="col-lg-3">
												<p style="padding-top: 13px;">아이디<span>*</span></p>
											</div>
											<div class="col-lg-5">
												<input type="text" class="modify__input"
													id="member_id" name="member_id">
											</div>
											<div class="col-lg-4">
												<a href="#" class="btn btn-sm text-white" id="id_check"
												style="margin-top: 7px; background-color: rgb(127, 173, 57);" >아이디
												중복 확인</a>
											</div>
										</div>
										<div class="form-gruop row">
											<div class="col-lg-12">
												<div style="display: none" id="isUsedid" class="alert"
														data-idCanUse=""></div>
											</div>
										</div>
										<div class="form-gruop row">
											<div class="col-lg-3">
												<p style="padding-top: 13px;">패스워드<span>*</span></p>
											</div>
											<div class="col-lg-9">
												<input type="password" class="modify__input"
													id="password" name="password">
											</div>
										</div>
										
										<div class="form-gruop row">
											<div class="col-lg-3">
												<p style="padding-top: 13px;">이름<span>*</span></p>
											</div>
											<div class="col-lg-9">
												<input type="text" class="modify__input" 
													id="member_name" name="member_name">
											</div>
										</div>
										
										<div class="form-gruop row">
											<div class="col-lg-3">
												<p style="padding-top: 13px;">휴대전화<span>*</span></p>
											</div>
											<div class="col-lg-9">
												<input class="modify__input__3spots" name="phonenum1" 
												id="phonenum1" type="text" maxlength="3"/>-
												<input class="modify__input__3spots" name="phonenum2" 
												id="phonenum2" type="text" maxlength="4"/>-
												<input class="modify__input__3spots" name="phonenum3" 
												id="phonenum3" type="text" maxlength="4"/>
												<input type="hidden" name="phonenum" id="phonenum"/>
											</div>
										</div>
										
										<div class="form-gruop row">
											<div class="col-lg-3">
												<p style="padding-top: 13px;">이메일<span>*</span></p>
											</div>
											<div class="col-lg-9">
												<input type="email" class="modify__input" 
													id="email" name="email">
											</div>
										</div>
										
										<div class="form-gruop row">
											<div class="col-lg-3">
												<p style="padding-top: 13px;">주소<span>*</span></p>
											</div>
											<div class="col-lg-9">
												<input type="text" class="modify__input" 
													id="address" name="address">
													<p style="padding-left: 10px;">상세<span>*</span></p>
													<input type="text" class="modify__input" id="address_detail" 
														name="address_detail">
											</div>
										</div>
										
										<div class="form-gruop row">
											<div class="col-lg-3">
												<p style="padding-top: 13px;">사진<span>*</span></p>
											</div>
											<div class="col-lg-9">
												<div class="col-lg-5 d-none d-lg-block bg-register-image" id="registerImage">
													<img src="/spring/resources/img/defaultprofile.png">
												</div>
												<div class="form-group row">
													<div class="custom-file" style="margin: 20px">
														<input type="file" class="custom-file-input" id="member_pic" name="file">
														<label class="custom-file-label" id="pic_label" for="member_pic">사진 선택</label>
													</div>
												</div>
											</div>
										</div>
										</div>
										</div>
										<button type="submit" class="btn btn-white text-white btn-user btn-block"
											style="background-color: rgb(127, 173, 57); margin-top: 20px;">회원가입</button>
									</form>
									<hr>

									<div class="header__menu" align="center">
										<ul>
											<li><a href="/spring/member/forgot-passwordForm">비밀번호 찾기</a></li>
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
