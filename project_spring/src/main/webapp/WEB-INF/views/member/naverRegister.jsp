<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>






<!DOCTYPE html>
<html lang="zxx">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>회원가입</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400;700&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/spring/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="/spring/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="/spring/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="/spring/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="/spring/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="/spring/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="/spring/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/spring/resources/css/style.css"
	type="text/css">
<!--   <link rel="stylesheet" href="css/style.css" type="text/css"> -->



<!--첨부파일 style 조정한 것 -->
<style>
.form-group .custom-file {
	display: inline-block;
	height: 30px;
	padding: 10px 20px;
	vertical-align: middle;
	border: 1px solid #dddddd;
	width: 50%;
	color: #999999;
}

.form-group label {
	display: inline-block;
	padding: 5px 10px;
	color: #fff;
	vertical-align: middle;
	background-color: #999999;
	cursor: pointer;
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
</style>

</head>
<script>
$(document).ready(
		function() {
			
		 	
			

			//회원가입 실패(flase시 안내창)
			var registerresult = "${register_result}";
			if (registerresult == "flase") {
				alert("회원가입에 실패하였습니다 다시 회원가입 해주세요");
			}

			var member_id = ""
		
			//폼을 전송할 떄
			$("#registerForm").submit(function() {

				//각 회원가입 필수 내용 들어가있는지 확인
				if ($("#member_name").val() == "") {
					alert("이름을 확인해주세요")
					return false;
				} else if ($("#phonenum").val() == "") {
					alert("휴대폰번호를 확인해주세요")
					return false;
				} else if ($("#email").val() == "") {
					alert("이메일을 확인해주세요")
					return false;
				} else if ($("#address").val() == "") {
					alert("주소를 확인해주세요")
					return false;
				}

			
			
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
										<br>
										<h3>회원 가입</h3>
										<br>
										<br>
									</div>


									<form class="checkout_form" id="registerForm" method="post"
										action="/spring/member/register" enctype="multipart/form-data">
										<div class="row">
											<div class="col-lg-12">
												<div class="form-gruop row" style="display:none">
													<div class="col-lg-6" >
														<p>아이디*</p>
														<input type="text" class="form-control form-control-user"
															id="member_id" name="member_id" value="${MemberVo.member_id}">
													</div>
													
												</div>
										
												<div class="checkout__input" style="display:none">
													<p style="margin-top: 15px">
														패스워드<span>*</span>
													</p>
													<input type="text" id="password" name="password" value="${MemberVo.password}">
												</div>
												<div class="checkout__input">
													<p style="margin-top: 15px">
														이름<span>*</span>
													</p>
													<input type="text" id="member_name" name="member_name" value="${MemberVo.member_name}">
												</div>
												<div class="checkout__input">
													<p style="margin-top: 15px">
														휴대폰번호<span>*</span>
													</p>
													<input type="number" id="phonenum" name="phonenum" value="${MemberVo.phonenum}">
												</div>
												<div class="checkout__input">
													<p style="margin-top: 15px">
														이메일<span>*</span>
													</p>
													<input type="email" id="email" name="email" value="${MemberVo.email}">
												</div>
												<div class="checkout__input">
													<p style="margin-top: 15px">
														주소<span>*</span>
													</p>
													
													<input type="text" id="address" name="address"
														style="margin-bottom: 20px" readonly>
												</div>
												<div class="checkout__input">
													<p style="margin-top: 15px">
														상세<span>*</span>
													</p>
													
													<input type="text" id="address_detail" name="address_detail"
														style="margin-bottom: 20px">
												</div>


												<div class="col-lg-5 d-none d-lg-block bg-register-image"
													id="registerImage">
													<img src="/spring/resources/img/defaultprofile.png">
												</div>

												<div class="form-group row">
													<div class="col-sm-12 mb-3 mb-sm-0 custom-file"
														style="margin: 20px">
														<input type="file" class="custom-file-input"
															id="member_pic" name="file"> <label
															class="custom-file-label" id="pic_label" for="member_pic">사진 선택</label>

													</div>
												</div>

					
											</div>
										</div>
										<hr>
										<button type="submit"
											class="btn btn-white text-white btn-user btn-block"
											style="background-color: rgb(127, 173, 57);">회원가입</button>
									</form>
									<hr>






									<div class="header__menu" align="center">
										<ul>
											<li><a href="/spring/member/forgot-passwordForm">비밀번호 찾기</a></li>
											<li><a href="/spring/member/login">로그인화면으로</a></li>
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
