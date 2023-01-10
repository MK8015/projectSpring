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

	
}); //$(document).ready(function()
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
		
		<form id="frmReply" role="form" action="/spring/board/reply" method="post">
		
		<input type="text" name="re_group" id="re_group" value="${re_group}">
				<table>
					<tr style ='vertical-align : middle'>
						<td>제목</td>
						<td><input type="text" class="qna__input" id="title" name="title" placeholder="제목을 입력해 주세요"/></td>
					</tr>
					<tr style ='vertical-align : top'>
						<td><br>내용</td>
						<td><textarea class="qna__textarea" id="content" name="content" placeholder="내용을 입력해 주세요"></textarea></td>
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