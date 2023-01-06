<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

<script>
$(document).ready(function() {

	$("#a_reply_ok").click(function(e) {
		e.preventDefault();
		$("#frmUpdate").attr("action", "/spring/board/reply").submit();
	});

		
	
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
<section class="contact-form spad">
	<div class="container">
		<div class="row contact__list__title">
			<div class="col-md-12">
				<h3>상품문의</h3>
			</div>
		</div>
		
		
		<form id="frmUpdate" role="form" action="/spring/board/modify" method="post">
			<input type="hidden" name="bno" id="bno" value="${boardVo.bno}">
			<table class="table">
				<tr>
					<td colspan="2">
						<input type="text" class="form-control input" id="title" name="title" 
								value="${boardVo.title}"/>
						${boardVo.writer} | ${boardVo.regdate}	
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<textarea class="form-control input" id="content" name="content">${boardVo.content}</textarea>
					</td>
				</tr>
				<tr>
					<td><button type="submit" class="site-smbtn">수정</button>　　
						<a href="/spring/board/delete?bno=${boardVo.bno}" class="site-smbtn">삭제</a>
						<a href="" id="a_reply_ok" class="site-smbtn">답글</a></td>
					<td><a href="/spring/board/list" class="site-smbtn">목록</a>　　
						<a href="/spring/board/write" class="site-smbtn">글 작성</a></td>
				</tr>
			</table>
		</form>
		
	</div>
</section>
<!-- END : qna 게시판 Section -->


<%@ include file="../include/footer.jsp" %>