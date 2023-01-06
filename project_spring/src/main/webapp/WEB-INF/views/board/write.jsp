<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

<script>
$(document).ready(function() {

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
		
		
		<form id="frmUpdate" role="form" action="/spring/board/write" method="post">
			<table class="table">
				<tr>
					<td colspan="2">
						<input type="text" class="form-control input" id="title" name="title" 
								placeholder="제목을 입력해 주세요"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<textarea class="form-control input" id="content" name="content"></textarea>
					</td>
				</tr>
				<tr>
					<td><button type="submit" class="site-smbtn">작성</button>　　</td>
					<td><a href="/spring/board/list" class="site-smbtn">목록</a>　　</td>
				</tr>
			</table>
		</form>
		
	</div>
</section>
<!-- END : qna 게시판 Section -->


<%@ include file="../include/footer.jsp" %>