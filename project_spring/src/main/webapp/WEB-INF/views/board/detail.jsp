<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
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

	// 답글 쓰기
	$("#a_reply_ok").click(function(e) {
		e.preventDefault();
		$("#frmUpdate").attr("action", "/spring/board/reply").submit();
	});
	// 사진 이름
	$("#customFile").change(function(e) {
		var file = this.files[0];
		var reader = new FileReader();
		reader.onload = function(e) {
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
			<input type="hidden" name="bno" id="bno" value="${boardVo.bno}">
			<table class="table">
				<tr>
					<td colspan="2" height="130" style ='vertical-align : middle' style='line-height:200%'>
						<p style="text-align: left; line-height: 200%; margin-top: 10pt;">
						<span style="font-size:20px; color:#212529;"><b>${boardVo.title}</b></span><br>
						<!-- 관리자일 때 아닐 때 구분하여 작성자 띄우기 -->
						<c:choose>
							<c:when test="${boardVo.writer eq 'admin'}">
								<span style="font-size:14px; color:#7fad39;">N</span><span style="font-size:14px; color:#a1cf25;">O</span><span style="font-size:14px; color:#7fad39;">N</span><span style="font-size:14px; color:#b2b2b2;">FICTION　</span>
							</c:when>
							<c:otherwise>
								<c:set var = "writer" value = "${boardVo.writer}"/>
								<c:set var = "length" value = "${fn:length(writer)}"/>
								<c:set var = "back2" value = "${fn:substring(writer, length -2, length)}" />
								<c:set var = "writer_result" value = "${fn:replace(writer, back2, '**')}" />
									<span style="font-size:14px; color:#b2b2b2;">${writer_result}　</span>
							</c:otherwise>
						</c:choose>
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
					<!-- 관리자일 때 답글 버튼 보이기 / 공지 글일 때 수정 버튼 안 보이기 -->
					<c:choose>
						<c:when test="${loginMemberVo.member_id eq 'admin'}">
							<a href="/spring/board/modify?bno=${boardVo.bno}
									&re_group=${boardVo.re_group}" class="white-btn">수정</a>
							<a href="/spring/board/delete?bno=${boardVo.bno}" class="white-btn">삭제</a>　
							<a href="/spring/board/reply?re_group=${boardVo.re_group}&
											password=${boardVo.password}" 
								class="green-btn">답글</a>
						</c:when>
						<c:otherwise>
						<c:choose>
							<c:when test="${boardVo.notify eq 'Y'}">
							</c:when>
							<c:otherwise>
							<a href="/spring/board/modify?bno=${boardVo.bno}
								&re_group=${boardVo.re_group}" class="white-btn">수정</a>
							<a href="/spring/board/delete?bno=${boardVo.bno}" class="white-btn">삭제</a>　
							</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
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