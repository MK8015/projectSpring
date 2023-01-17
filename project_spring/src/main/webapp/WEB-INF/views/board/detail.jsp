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

pre p {
	margin-top: 20px;
	text-align: justify;
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

.white-btn a {
	display: inline-block;
}

</style>

<script>
$(document).ready(function() {

	$("#a_reply_ok").click(function(e) {
		e.preventDefault();
		$("#frmUpdate").attr("action", "/spring/board/reply").submit();
	});

	// 사진 이름
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
		}; // reader.onload
		reader.readAsDataURL(file);
	}); //
		
	
}); //$(document).ready(function()
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
		<!-- 만약 배경색 넣는다면   bgcolor="#f5f5f5" -->
			<input type="hidden" name="bno" id="bno" value="${boardVo.bno}">
			<table class="table">
				<tr>
					<td colspan="2" height="130" style ='vertical-align : middle' style='line-height:200%'>
						<p style="text-align: left; line-height: 200%; margin-top: 10pt;">
						<span style="font-size:20px; color:#212529;"><b>${boardVo.title}</b></span><br>
							<span style="font-size:14px; color:#b2b2b2;">${boardVo.writer}　</span>
							<span style="font-size:16px; color:#dddddd;">|</span>
							<span style="font-size:14px; color:#b2b2b2;">　${boardVo.regdate}</span></p>
						
					</td>
				</tr>
				<tr height="150">
					<td colspan="2">
					<pre><p><span>${boardVo.content}</span></p></pre>
					<c:if test="${not empty boardVo.pic}">
					<p style="text-align: justify; margin-bottom: 20pt;">
					<img src="/spring/board/displayImage?pic=${boardVo.pic}" 
                    		width="30%"></p>
					</c:if>
					
					</td>
				</tr>
				<tr height="110">
					<td style ='vertical-align : middle'>
					<c:if test="${boardVo.writer eq loginMemberVo.member_id}">
						<a href="/spring/board/modify?bno=${boardVo.bno}" class="white-btn">수정</a>　
						<a href="/spring/board/delete?bno=${boardVo.bno}" class="white-btn">삭제</a>　
					</c:if>
					
						<c:if test="${loginMemberVo.member_id eq 'admin'}">
						<a href="/spring/board/reply?re_group=${boardVo.re_group}&
										password=${boardVo.password}&secret=${boardVo.secret}" 
							class="green-btn">답글</a>
						</c:if>
						</td>
					
					<td style ='text-align: right; vertical-align : middle'>
						<a href="/spring/board/list" class="white-btn">목록</a>　
						<a href="/spring/board/write" class="green-btn">글 작성</a>
					</td>
				</tr>
			</table>
		
		
	</div>
</section>
<!-- END : qna 게시판 Section -->


<%@ include file="../include/footer.jsp" %>