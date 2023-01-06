<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/header.jsp" %>

<script>
$(document).ready(function() {
 	
	// 디테일로 이동(제목 클릭)
	$(".a_title").click(function(e) {
		e.preventDefault();
		var bno = $(this).attr("data-bno");
		console.log("data-bno" + bno);
		var frm = $("#frmBoardPaging");
		frm.find("input[name=bno]").val(bno);
		frm.attr("action", "/spring/board/detail");
		frm.submit();
	});
	
	
}); //$(document).ready(function()
</script>

<%@ include file="../include/boardPageParam.jsp" %>

<!-- START : qnA 이미지 Section -->
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
<!-- End : qnA 이미지 Section -->

<!-- START : qnA 게시판 Section -->
<section class="contact spad">
	<div class="container">
		<div class="row contact__list__title">
			<div class="col-md-4">
				<h3>상품문의</h3>
			</div>
			<div class="col-md-8 text-right">
				<a href="/spring/board/write" class="site-smbtn">문의 작성하기</a>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr height="50">
							<th>번호</th>
							<th>제목</th>
							<th>날짜</th>
							<th>작성자</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
					
					<c:forEach items="${list}" var="boardVo">
						<tr height="50">
							<td>${boardVo.bno}</td>
							<td>
								<a class="a_title" data-bno="${boardVo.bno}" href="#">
								${boardVo.title}</a>
							</td>
							<td>${boardVo.regdate}</td>
							<td>${boardVo.writer}</td>
							<td>${boardVo.viewcnt}</td>
						</tr>
					</c:forEach>
					
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="product__pagination blog__pagination">
					<a href="#">1</a>
					<a href="#">2</a>
					<a href="#">3</a>
					<a href="#"><i class="fa fa-long-arrow-right"></i></a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End : qnA 게시판 Section -->
    


<%@ include file="../include/footer.jsp" %>