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
					<p style="text-align: justify; line-height: 230%; 
						margin-top: 20pt;"><span style="font-size:16px; color:#212529;">
					${boardVo.content}
					</span></p>
					<br>
					
					<c:if test="${not empty boardVo.pic}">
					<img src="/spring/board/displayImage?pic=${boardVo.pic}" 
                    		width="30%">
					</c:if>
					
					</td>
				</tr>
				<tr>
					<td><a href="/spring/board/modify?bno=${boardVo.bno}" class="primary-smbtn">수정</a>　
						<a href="/spring/board/delete?bno=${boardVo.bno}" class="primary-btn site-smbtn">삭제</a>
						<a href="/spring/board/reply?re_group=${boardVo.re_group}" class="site-smbtn">답글</a></td>
					<td><a href="/spring/board/list" class="site-smbtn">목록</a>　　
						<a href="/spring/board/write" class="site-smbtn">글 작성</a></td>
				</tr>
			</table>
		
		
	</div>
</section>
<!-- END : qna 게시판 Section -->


<%@ include file="../include/footer.jsp" %>