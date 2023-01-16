<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../include/header.jsp" %>



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
<title>마이페이지</title>

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
<link rel="stylesheet" href="/spring/resources/css/styleB.css"
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

#product_info {
        text-align: center;
      }
</style>


<script>
$(document).ready(
		function() {
			
			$(document).on("click","#btnmemberInfo",function(){
				$("#modifydiv").attr("style","display: block;");
				$("#orderlistdiv").attr("style","display: none;");
			});
			

			$(document).on("click","#btnorderList",function(){
				$("#orderlistdiv").attr("style","display: block;");
				$("#modifydiv").attr("style","display: none;");
			});
			
// 			$("#btnmemberInfo").click(function(){
// 				$("#orderlistdiv").attr("style","display: block;");
// 				$("#modifydiv").attr("style","display: none;");
// 			});
// 			$("btnorderList").click(function(){
// 				$("#modifydiv").attr("style","display: block;");
// 				$("#orderlistdiv").attr("style","display: none;");
			
// 			});

			//회원가입 실패(flase시 안내창)
			var modifyresult = "${isModify}";
			if (modifyresult == "flase") {
				alert("수정에 실패하였습니다 새로고침 후 다시 시도해주세요");
			}else if(modifyresult == "true"){
				alert("수정에 성공하였습니다");
			}
			//폼을 전송할 떄
			$("#modifyForm").submit(function() {
				if ($("#password").val().trim()  == ""
					|| $("#member_name").val().trim() == ""
					|| $("#password").val().trim()  == ""
					|| $("#phonenum").val().trim() == ""
					|| $("#email").val().trim() == ""
					|| $("#address").val().trim() == "") {
					alert("빈칸은 입력하실 수 없습니다")
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
		




</head>
<body class="header__top">
   <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-2 col-md-5 order-md-1 order-2">
                    <div class="blog__sidebar">
			<img src="/spring/member/getProfile?profileImage=${memberVo.member_pic}" alt="/spring/resources/img/defaultprofile.png">
			<p>${memberVo.member_id}님 환영합니다</p>
                        <div class="blog__sidebar__item">
                            <h4>마이페이지</h4>
                            <ul>
                                <li><a href="#" id="btnmemberInfo">회원정보</a></li>
                                <li><a href="#" id="btnorderList">주문내역</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-10 col-md-9 order-md-1 order-1"> <!-- 컨탠츠 들어갈 곳-->
                
                
                
                
                
          <div id="modifydiv" style="display: block;" >
	<div class="container">	
	

		<!-- Outer Row -->
		
		<div class="row justify-content-center">
		

			<div class="col-lg-12">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-12">
								<div class="p-5">
									<div class="text-center">
										<br>
										<h3>회원 정보 수정</h3>
										<br>
										<br>
									</div>


									<form class="checkout_form" id="modifyForm" method="post"
										action="/spring/member/modify" enctype="multipart/form-data">
										<div class="row">
											<div class="col-lg-12">
												<div class="form-gruop row">
													<div class="col-lg-6">
														<p>아이디</p>
														<input type="text" class="form-control form-control-user"
															id="member_id" name="member_id" value="${memberVo.member_id}" readonly>
													</div>
													
												</div>
												<div>
												


												</div>
												<div class="checkout__input">
													<p style="margin-top: 15px">
														패스워드<span></span>
													</p>
													<input type="text" id="password" name="password" value="${memberVo.password}">
												</div>
												<div class="checkout__input">
													<p style="margin-top: 15px">
														이름<span></span>
													</p>
													<input type="text" id="member_name" name="member_name" value="${memberVo.member_name}">
												</div>
												<div class="checkout__input">
													<p style="margin-top: 15px">
														휴대폰번호<span></span>
													</p>
													<input type="text" id="phonenum" name="phonenum" value="${memberVo.phonenum}">
												</div>
												<div class="checkout__input">
													<p style="margin-top: 15px">
														이메일<span></span>
													</p>
													<input type="email" id="email" name="email" value="${memberVo.email}">
												</div>
												<div class="checkout__input">
													<p style="margin-top: 15px">
														주소<span></span>
													</p>
													
													<input type="text" id="address" name="address"
														style="margin-bottom: 20px" value="${memberVo.address}" readonly>
												</div>
												<div class="checkout__input">
													<p style="margin-top: 15px">
														상세<span></span>
													</p>
													
													<input type="text" id="address_detail" name="address_detail"
														style="margin-bottom: 20px" value="${memberVo.address_detail}">
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
											style="background-color: rgb(127, 173, 57);">수정하기</button>
									</form>
									<hr>







								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>
	</div> <!-- div끝 -->
</div><!-- modifydiv끝 -->


<div id="orderlistdiv" style="display: none;">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="shoping__cart__table">
					<table>
						<thead>
							<tr>
								<th style="padding:0px 20px 0px 0px;">주문일</th>
								<th id="product_info" align="center" class="shoping__product" colspan="2" >상품정보</th>
								<th>수량</th>
								<th>상품금액</th>
								<th>수령인 아이디</th>
								
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var="orderList" >
							<tr>
								<td>${orderList.order_date}</td>
								<td class="order__item">
								<img src="/spring/product/getImage?imageName=${orderList.product_image}" height="150" width="100" alt=""></td>			
								<td><a href="/spring/product/detail?product_id=${orderList.product_id}" style="color: black; font-size: 14pt;"><strong>${orderList.product_name}</strong></a></td>
								<td class="order__quantity">${orderList.order_amount}</td>
								<td class="order__price">${orderList.price}</td>
								<td class="order__id">${orderList.member_id}</td>

						</c:forEach>
								
								

						</tbody>
					</table>
				</div>
			</div>
		</div>
		
							
				
		</div>
</div><!-- orderlistdiv 끝 -->
                    <div><a href="/spring/main/index" class="btn site-btn">메인으로 돌아가기</a></div>
                </div><!--컨탠츠 들어갈 곳-->
            </div>
        </div>
    </section>
    <!-- Blog Details Section End -->







			
	<!-- Js Plugins -->
	<script src="/spring/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/spring/resources/js/bootstrap.min.js"></script>
	<script src="/spring/resources/js/jquery.nice-select.min.js"></script>
	<script src="/spring/resources/js/jquery-ui.min.js"></script>
	<script src="/spring/resources/js/jquery.slicknav.js"></script>
	<script src="/spring/resources/js/mixitup.min.js"></script>
	<script src="/spring/resources/js/owl.carousel.min.js"></script>
	<script src="/spring/resources/js/main.js"></script>
<%@ include file="../include/footer.jsp" %>
</body>

</html>
