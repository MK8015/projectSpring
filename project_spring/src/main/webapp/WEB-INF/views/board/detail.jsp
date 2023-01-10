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
		
		
		<form id="frmUpdate" role="form" action="/spring/board/modify" method="post">
			<input type="hidden" name="bno" id="bno" value="${boardVo.bno}">
			<table class="table">
				<tr>
					<td colspan="2"  bgcolor="#f5f5f5">
						${boardVo.title}<br>
						${boardVo.writer} | ${boardVo.regdate}	
					</td>
				</tr>
				<tr height="150">
					<td colspan="2">
					${boardVo.content}
					<br>
					
					<c:if test="${not empty boardVo.pic}">
					<img src="/spring/board/displayImage?pic=${boardVo.pic}" 
                    		width="95%" height="95%">
					</c:if>
					
					</td>
				</tr>
				<tr>
					<td><button type="submit" class="site-smbtn">수정</button>　　

						<a href="/spring/board/delete?bno=${boardVo.bno}" class="site-smbtn">삭제</a>
						<a href="/spring/board/reply?re_group=${boardVo.re_group}" class="site-smbtn">답글</a></td>
					<td><a href="/spring/board/list" class="site-smbtn">목록</a>　　
						<a href="/spring/board/write" class="site-smbtn">글 작성</a></td>
				</tr>
			</table>
		</form>
		
	</div>
</section>
<!-- END : qna 게시판 Section -->


<%@ include file="../include/footer.jsp" %>