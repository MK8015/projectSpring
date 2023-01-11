<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/boardPageParam.jsp" %>

<script>
$(document).ready(function() {
 	
	// 디테일로 이동(제목 클릭)
	$(".a_title").click(function(e) {
		//var password = $(this).attr("data-password");
		var secret = $(this).attr("data-secret");
		var bno = $(this).attr("data-bno");
		
		// 비밀글일 때는 모달 띄우기 공개 글일 때는 그냥 이동
		if (secret == "Y") {
			console.log("비밀글");
			$("#btnModal").attr("data-bno", bno);
			$("#modal-secret").trigger("click");
		} else {
			console.log("안 비밀글");	
			runDetail(bno);
		}
	}); // END : $(".a_title").click(function(e)
	
	// 해당 글(디테일)로 이동하는 function	
	function runDetail(bno) {
		console.log("data-bno" + bno);
// 		var frm = $("#frmBoardPaging");
// 		frm.find("input[name=bno]").val(bno);
// 		frm.attr("action", "/spring/board/detail");
// 		frm.submit();
		location.href = "/spring/board/detail?bno="+bno;
	} // END : runDetail
	
	// 비밀번호 확인 창 눌렀을 때 비밀번호 체크 후 이동
	$("#btnModal").click(function() {
		var password = $('input[name=password]').val();
		var bno = $(this).attr("data-bno");
		
		console.log("password: " + password);
		console.log("data-bno" + bno);
		
		var url = "/spring/board/checkPassword";
		var sData = {
				"bno" : bno,
				"password" : password
		};
		console.log("sData", sData);
		
		$.post(url, sData, function(rData) {
			console.log("rData", rData);
			if (rData == "true") {
				console.log("패스워드 일치");
				runDetail(bno);
			} else {
				console.log("실패");
				alert("비밀번호가 틀립니다. 다시 확인해 주세요.");
			}
		}); // END: $.post
		
	}); // END : $("#btnModal").cl
	
	$(document).on("click",".pagelink",function(e){
		e.preventDefault();
		var page=$(this).attr("href");
		$("#frmPaging").find("input[name=page]").val(page);
		$("#frmPaging").attr("action","/spring/board/list").submit();
	});
}); //$(document).ready(function()
		
		

		
</script>

<%@ include file="../include/boardPageParam.jsp" %>


<!-- 비밀글 모달 창 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			 <a id="modal-secret" href="#modal-container-secret"
			 	 role="button" class="btn" data-toggle="modal" style="display:none">Launch demo modal</a>
			 <div class="modal fade" id="modal-container-secret" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								Modal title
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							이 글은 비밀글입니다. 비밀번호를 입력해 주세요.<br>
							<input type="password" name="password" id="password" placeholder="비밀번호 입력"><br>
							<button type="button" id="btnModal" data-bno="" class="btn btn-primary">
								확인
							</button> 
						</div>
						<div class="modal-footer">
							 
							
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								Close
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



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
						<tr height="50" bgcolor="#f5f5f5">
							<th>번호</th>
							<th></th>
							<th width="40%">제목</th>
							<th>날짜</th>
							<th>작성자</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
					
					<c:forEach items="${list}" var="boardVo">
						<tr height="50">
							<td>${boardVo.bno}</td>
					<!-- 비밀글일 때 자물쇠, 사진 있을 때 이미지 나타내기 -->
							<td>
								<c:if test="${boardVo.secret eq 'Y'}">	
									<font color="#f0bd5a"><i class="fa fa-lock" aria-hidden="true"></i></font>
								</c:if>  
								<c:if test="${not empty boardVo.pic}">
									<font color="#2da9e6"><i class="fa fa-picture-o" aria-hidden="true"></i></font>
								</c:if>
								
								
							</td>
					<!-- 제목 부분, 답글일 때 > 나타내기 -->
							<td>
								<a class="a_title" data-bno="${boardVo.bno}" 
									data-password="${boardVo.password}" data-secret="${boardVo.secret}" href="#">
								<c:if test="${boardVo.re_level gt 0}">	
									<i class="fa fa-chevron-right" aria-hidden="true"></i>
								</c:if>${boardVo.title}</a>
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
	
	<div class="product__pagination pagination justify-content-center">
					<c:if test="${BoardPagingDto.startPage ne 1}">
						<a class="pagelink" href="${BoardPagingDto.startPage-1}">
							<i class="fa fa-long-arrow-left"></i></a>
					</c:if>
					<c:forEach var="v" begin="${BoardPagingDto.startPage}" 
										end="${BoardPagingDto.endPage}">

						<a class="pagelink" href="${v}">${v}</a>
					</c:forEach>
					<c:if test="${BoardPagingDto.endPage lt BoardPagingDto.totalPage}">
						<a class="pagelink" href="${BoardPagingDto.endPage+1}">
							<i class="fa fa-long-arrow-right"></i></a>
					</c:if>
				</div>
	
</section>
<!-- End : qnA 게시판 Section -->
    


<%@ include file="../include/footer.jsp" %>