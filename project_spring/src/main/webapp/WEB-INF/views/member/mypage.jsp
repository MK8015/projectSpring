<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>


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

.modify__input p span {
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
		

<!-- START : 왼쪽 카테고리 Section -->
<section class="mypage__sidebar spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-2 col-md-5 order-md-1 order-2">
				<div class="mypage__sidebar__item">
					<img src="/spring/member/getProfile?profileImage=${memberVo.member_pic}" 
				alt="/spring/resources/img/defaultprofile.png">
					<h4>${memberVo.member_id}님의<br>마이 페이지</h4>
						<ul>
							<li><a href="#" id="btnmemberInfo">회원 정보</a></li>
							<li><a href="#" id="btnorderList">주문 내역</a></li>
						</ul>
				</div>
			</div> <!-- 컨탠츠 들어갈 곳-->
<!-- END : 왼쪽 카테고리 Section --> 

<!-- START : 오른쪽 my page Section -->

<!-- START : 회원 정보 -->
			<div class="col-lg-10 col-md-7 order-md-1 order-1"
				 id="modifydiv" style="display: block;">
				<div class="mypage_title">
					<h3 style="margin-bottom: 35px;">회원 정보 수정</h3>
				</div>
				
				<form class="modify_form" id="modifyForm" method="post"
					action="/spring/member/modify" enctype="multipart/form-data" style="padding-left: 40px;">
					<div class="row">
					<div class="col-lg-12">
					<div class="form-gruop row">
						<div class="col-lg-2">
							<p style="padding-top: 13px;">아이디</p>
						</div>
						<div class="col-lg-10">
							<input type="text" class="modify__input"
								id="member_id" name="member_id" value="${memberVo.member_id}" readonly>
						</div>
					</div>
					
					<div class="form-gruop row">
						<div class="col-lg-2">
							<p style="padding-top: 13px;">패스워드</p>
						</div>
						<div class="col-lg-10">
							<input type="text" class="modify__input"
								id="password" name="password" value="${memberVo.password}">
						</div>
					</div>
					
					<div class="form-gruop row">
						<div class="col-lg-2">
							<p style="padding-top: 13px;">이름</p>
						</div>
						<div class="col-lg-10">
							<input type="text" class="modify__input" 
								id="member_name" name="member_name" value="${memberVo.member_name}">
						</div>
					</div>
					
					<div class="form-gruop row">
						<div class="col-lg-2">
							<p style="padding-top: 13px;">휴대전화</p>
						</div>
						<div class="col-lg-10">
							<input type="text" class="modify__input" 
								id="phonenum" name="phonenum" value="${memberVo.phonenum}">
						</div>
					</div>
					
					<div class="form-gruop row">
						<div class="col-lg-2">
							<p style="padding-top: 13px;">이메일</p>
						</div>
						<div class="col-lg-10">
							<input type="email" class="modify__input" 
								id="email" name="email" value="${memberVo.email}">
						</div>
					</div>
					
					<div class="form-gruop row">
						<div class="col-lg-2">
							<p style="padding-top: 13px;">주소</p>
						</div>
						<div class="col-lg-10">
							<input type="text" class="modify__input" 
								id="address" name="address" value="${memberVo.address}" readonly>
								<p style="padding-left: 10px;">상세</p>
								<input type="text" class="modify__input" id="address_detail" 
									name="address_detail" value="${memberVo.address_detail}">
						</div>
					</div>
					
					<div class="form-gruop row">
						<div class="col-lg-2">
							<p style="padding-top: 13px;">사진</p>
						</div>
						<div class="col-lg-10">
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
					<hr style="margin-top: 20px; margin-bottom: 40px;">
					<button type="submit" class="modify-btn">수정하기</button>
				</form>
				
				
			</div> <!-- END : 회원 정보 -->

<!-- START : 주문 내역 -->
			<div class="col-lg-10 col-md-7 order-md-1 order-1"
				id="orderlistdiv" style="display: none;">
				<div class="shoping__cart__table">
					<table style="margin-left: 40px;">
						<thead>
							<tr>
								<th>주문일</th>
								<th colspan="2">상품정보</th>
								<th>수량</th>
								<th>상품금액</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var="orderList">
							<tr>
								<td class="shoping__cart__date">${orderList.order_date}</td>
								<td style="padding-left: 10px" width="200px">
									<img style="padding-left: 10px" width="100px" src="/spring/product/getImage?imageName=${orderList.product_image}"
									onclick="location.href='/spring/product/detail?product_id=${orderList.product_id}'">
								</td>
								<td class="shoping__order__item" style="padding-left: 20px">	
									<h5 onclick="location.href='/spring/product/detail?product_id=${orderList.product_id}'">
									${orderList.product_name}<br>
									<span style="font-size:11px; color:gray;"
									>${orderList.product_author}|${orderList.product_publisher}</span></h5>
								</td>
								<td class="shoping__order__quantity">${orderList.order_amount}</td>
								<td class="shoping__cart__price">
								<fmt:formatNumber value="${orderList.price}" pattern="#,###"/>
								원</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>
    <!-- Blog Details Section End -->
                
                
                
                



<%@ include file="../include/footer.jsp" %>
</body>

</html>
