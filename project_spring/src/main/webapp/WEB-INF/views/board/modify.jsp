<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>


<style>
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
	color: #6f6f6f;
}

.qna__textarea {
	width: 98%;
	height: 200px;
	margin: 28px 10px 10px;
	font-size: 16px;
	color: #6f6f6f;
	padding-left: 20px;
	border: 1px solid #ebebeb;
	border-radius: 4px;
	padding-top: 12px;
	resize: none;
}

.qna__textarea::placeholder {
	color: #6f6f6f;
}

.text-right {
	text-align: right;
}


.white-btn {
	display: inline-block;
	font-size: 14px;
	color: #6f6f6f;
	font-weight: 500;
	text-transform: uppercase;
	padding: 10px 30px 13px;
	display: inline-block;
	background: #f5f5f5;
}

.green-btn {
	font-size: 14px;
	color: #ffffff;
	font-weight: 400;
	text-transform: uppercase;
	display: inline-block;
	padding: 10px 30px 10px;
	background: #7fad39;
	border: none;
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
<section class="subtitle spad">
	<div class="container">
		<div class="row subtitle-section set-bg" data-setbg="/spring/resources/img/breadcrumb.jpg">
			<div class="col-lg-12 text-center">
				<div class="subtitle__text">
					<h2>Q & A</h2>
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
						<td style="padding-top: 13px;">제목</td>
						<td><input type="text" class="qna__input" id="title" 
							name="title" placeholder="제목을 입력해 주세요" value="${boardVo.title}"/></td>
					</tr>
					<tr style ='vertical-align : top'>
						<td style="padding-top: 13px;"><br>내용</td>
						<td><textarea class="qna__textarea" id="content" name="content" 
							placeholder="내용을 입력해 주세요">${boardVo.content}</textarea></td>
					</tr>
					<tr style ='vertical-align : middle'>
						<td style="padding-top: 15px;">사진</td>
						<td><input class="qna__input" type="file" class="form-control" id="customFile" name="file" 
								style="padding-top: 7px;" /></td>
					</tr>
					<tr style ='vertical-align : middle'>
						<td height="81" style="padding-top: 15px;">비밀글
							<input type="checkbox" id="secretChk" name="secretChk" onclick="isSecret()">
						</td>
						<td><input class="qna__input" type="password" id="password" name="password" 
								placeholder="비밀번호를 입력해 주세요" style="display:none" value="${boardVo.password}"/>
							<input type="hidden" id="secret" name="secret" 
									value="${boardVo.secret}"></td>
					</tr>
				</table>
				<hr>
				<div class="text-right">
					<button type="submit" class="green-btn">작성</button>　
					<a href="/spring/board/list" class="white-btn">목록</a>
				</div>
			</form>
		</div>
	</div>
</section>
<!-- END : qna 게시판 Section -->


<%@ include file="../include/footer.jsp" %>