<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>


<style>
/* 상품 문의 부분 */
.qna-form {
	padding-top: 80px;
	padding-bottom: 80px;
}

.qna__title {
	margin-bottom: 35px;
}

.qna__title h3 {
	color: #1c1c1c;
	font-weight: 700;
}

.qna__form p {
	column-rule: #b2b2b2;
}

.qna__input {
	margin-bottom: 24px;
}

.qna__input p {
	color: #1c1c1c;
	margin-bottom: 20px;
}

.qna__input p span {
	color: #dd2222;
}

table {
	width: 100%;
}

.qna__input {
	width: 98%;
	height: 46px;
	margin: 25px 10px 10px;
	border: 1px solid #ebebeb;
	padding-left: 20px;
	font-size: 16px;
	color: #6f6f6f;
	border-radius: 4px;
}

.qna__input::placeholder {
	color: #b2b2b2;
}

.qna__textarea {
	width: 98%;
	height: 150px;
	margin: 10px;
	font-size: 16px;
	color: #6f6f6f;
	padding-left: 20px;
	margin-bottom: 24px;
	border: 1px solid #ebebeb;
	border-radius: 4px;
	padding-top: 12px;
	resize: none;
}

.qna__textarea::placeholder {
	color: #b2b2b2;
}

.text-right {
	text-align: right;
}

</style>

<script>
$(document).ready(function() {
	if ('${boardVo.secret}' == 'Y') {
		$("#secretChk").prop("checked", true);
		$("input[name=password]").show(100);
	}
	
	
	
	// 사진 선택
	$("#customFile").change(function(e) {
		console.log("e" + e);
		var file = this.files[0];
		console.log(file);
		var reader = new FileReader();
		reader.onload = function(e) {
			console.log("파일 읽음");
			console.log(e.target.result);
			var val = $("#customFile").val();
			var arrVal = val.split("\\"); 
			var filename = arrVal.pop();
			$("#customFile").next().text(filename); 
		}; // 
		reader.readAsDataURL(file);
	}); // $("#customFile").change(f
	

	
			
}); //$(document).ready(function()
		
		
// 비밀글이면 Y, 비밀글이면 비밀번호 인풋 창 나타나게 하기
function isSecret(){
	var secret = $("#secretChk").is(":checked") ? "Y" : "N";
	$("#secret").val(secret);
	
	if (secret == "Y") {
		$("input[name=password]").show(100);
	}
}
</script>

<%@ include file="../include/boardPageParam.jsp" %>


<!-- START : qna 이미지 Section -->
<section>
	<div class="container">
		<div class="row breadcrumb-section set-bg" data-setbg="/spring/resources/img/breadcrumb.jpg">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>Q & A</h2>
						<div class="breadcrumb__option">
							<a href="./index.html">Home</a>
							<span>Contact Us</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
<!-- END : qna 이미지 Section -->

<!-- START : qna 게시판 Section -->
<section class="qna-form spad">
	<div class="container">
		<div class="row qna__title">
			<div class="col-md-12">
				<h3>상품문의</h3>
			</div>
		</div>
		<hr>
		<div class="qna__form">
		<form id="frmUpdate" role="form" action="/spring/board/modify" method="post" enctype="multipart/form-data">
				
		<input type="hidden" name="bno" id="bno" value="${boardVo.bno}">
				<table>
					<tr style ='vertical-align : middle'>
						<td>제목</td>
						<td><input type="text" class="qna__input" id="title" 
							name="title" placeholder="제목을 입력해 주세요" value="${boardVo.title}"/></td>
					</tr>
					<tr style ='vertical-align : top'>
						<td><br>내용</td>
						<td><textarea class="qna__textarea" id="content" name="content" 
							placeholder="내용을 입력해 주세요">${boardVo.content}</textarea></td>
					</tr>
					<tr style ='vertical-align : middle'>
						<td>사진</td>
						<td><input type="file" class="form-control" 
							id="customFile" name="file" /></td>
					</tr>
					<tr style ='vertical-align : middle'>
						<td>비밀글<input type="checkbox" id="secretChk" name="secretChk" onclick="isSecret()">
						</td>
						<td><input type="password" id="password" name="password" 
								placeholder="비밀번호를 입력해 주세요" style="display:none" value="${boardVo.password}"/>
							<input type="hidden" id="secret" name="secret" value="${boardVo.secret}"></td>
					</tr>
				</table>
				<hr>
				<div class="text-right">
					<button type="submit" class="site-smbtn">작성</button>　
					<a href="/spring/board/list" class="site-smbtn">목록</a>
				</div>
			</form>
	</div>
</section>
<!-- END : qna 게시판 Section -->


<%@ include file="../include/footer.jsp" %>