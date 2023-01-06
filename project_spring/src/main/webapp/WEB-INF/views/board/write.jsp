<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

<script>
$(document).ready(function() {

}); //$(document).ready(function()
</script>

<%@ include file="../include/boardPageParam.jsp" %>


<!-- 수정 전 아직 안 했음 -->
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
<!-- Breadcrumb Section End -->

<!-- Contact Section Begin -->
<section class="contact spad">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3>← 상품문의</h3> 
			</div>
		</div>
		<div class="col-md-12">
		<form id="frmUpdate" role="form" action="/spring/board/modify" method="post">
			<input type="hidden" name="bno" id="bno" value="${boardVo.bno}">
			<table class="table">
				<tr>
					<td colspan="2">
						<input type="text" class="form-control input" id="title" name="title" value="${boardVo.title}"/>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" class="form-control" id="writer" name="writer" value="${boardVo.writer}"/>
					</td>
					<td>
						<input type="text" class="form-control" id="regdate" name="regdate" value="${boardVo.regdate}"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<textarea class="form-control input" id="content" name="content" readonly>${boardVo.content}</textarea>
					</td>
				</tr>
				<tr>
					<td><button type="submit" class="site-smbtn">수정</button>　　
						<a href="/spring/board/delete?bno=${boardVo.bno}" class="site-smbtn">삭제</button></td>
					<td><a href="/spring/board/list" class="site-smbtn">목록</a>　　<button id="btnSearch" class="site-smbtn">글 작성</button></td>
				</tr>
			</table>
		</form>
		</div>
	</div>
</section>
<!-- Contact Section End -->


<%@ include file="../include/footer.jsp" %>