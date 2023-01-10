<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>
<style>
.abs {
  position: absolute;
  bottom: 25px;
  right: 10px;
  font-size: 10px;
}

.child {
  color: lightgray;
  background: white;
  padding: 0.5rem;
}
</style>
<script>
$(document).ready(function() {
	
 	// 페이지 번호
	$(document).on("click", ".pagelink", function(e) {
	   e.preventDefault();
	   var page = $(this).attr("href");
	   $("#frmPaging").find("input[name=page]").val(page);
	   $("#frmPaging").attr("action", "/spring/list/list").submit();
	});
 	
 	// 장바구니 클릭 : 비동기식 정보 넘기기
 	$(document).on("click", ".shopping-cart", function(e) {
 		e.preventDefault();
 		console.log("장바구니 클릭!!!");
		var product_id = $(this).attr("data-product_id");
		var sData = {"product_id" : product_id};
		var url = "/spring/cart/insertProduct"
		$.post(url, sData, function(rData) {
// 			console.log("rData: "+rData); 
			if (rData == "false"){
				alert("장바구니 등록 실패!");
				return;
			} else if (rData == "notLogin") {
				alert("로그인후 이용바랍니다.")
				location.href="/spring/member/login";
			}
		});
		var p = $(this).next();
// 		console.log(p);
		p.css("display","");
		
 	});
 	
 	// 카트 닫기 버튼
 	$(".closeBtn").click(function() {
 		$(this).parent().attr("style","display:none");
 	});
});
</script>

<!-- Product Section Begin -->
<section class="product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-5">
				<div class="hero__categories">
					<div class="hero__categories__all">
						<i class="fa fa-bars"></i>

						<span><a href="/spring/list/list">All Categories</a></span>
					</div>
					<ul>
						<li><a href="/spring/list/list?category=humanity">인문</a></li>
						<li><a href="/spring/list/list?category=economy">경제/경영</a></li>
						<li><a href="/spring/list/list?category=sociology">정치/사회</a></li>
						<li><a href="/spring/list/list?category=history">역사</a></li>
						<li><a href="/spring/list/list?category=culture">문화/예술</a></li>
						<li><a href="/spring/list/list?category=science">과학</a></li>
						<li><a href="/spring/list/list?category=computer">컴퓨터/IT</a></li>
						<li><a href="/spring/list/list?category=language">외국어</a></li>
						<li><a href="/spring/list/list?category=religion">종교/역학</a></li>
						<li><a href="/spring/list/list?category=self">자기계발</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-9 col-md-7">
				<div class="filter__item">
					<div class="row">
						<div class="col-lg-4 col-md-5">
							<div class="filter__sort">
<!-- 분류부분 .. 건드리지않음 / 혹시 나중에 사용할까봐 / 상용안한다면 삭제 -->
								<span>Sort By</span>
									<select>
										<option value="0">Default</option>
										<option value="0">Default</option>
									</select>
								</div>
							</div>
							<div class="col-lg-4 col-md-4">
<!-- 검색된 도서의 갯수 표시 -->
								<div class="filter__found">
									<h6>검색결과 ( 총 <span>${pagingDto.count}</span> 건)</h6>
								</div>
							</div>
							<div class="col-lg-4 col-md-3">
								<div class="filter__option">
									<span class="icon_grid-2x2"></span>
									<span class="icon_ul"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
<!-- 도서(상품)list -->
					<c:forEach items="${list}" var="list">
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="product__item">
								<div class="product__item__pic">
									<img class="product__item__pic"
										src="/spring/product/getImage?imageName=${list.product_image}"
										alt="" onclick="location.href='/spring/product/detail?product_id=${list.product_id}'">
										
										<ul class="product__item__pic__hover">
											<li><a href="#"><i class="fa fa-heart"></i></a></li>
											<li><a href="#" class="shopping-cart"
												data-product_id="${list.product_id}">
													<i class="fa fa-shopping-cart parent"></i>
												</a>
												<p class="child abs" style="display:none">
													카트에 담겼습니다.<br>
													<input onclick="location.href='/spring/cart/list'" 
													type="button" value="카트 보기>"/>
													<input type="button" class="closeBtn" value="닫기"/>
												</p>
											</li>
											
										</ul>
								</div>
								<div class="product__item__text">
									<h6><a href="/spring/product/detail?product_id=${list.product_id}">
									${list.product_name}<br>
									<span style="font-size:11px; color:gray;">
									${list.product_author} | ${list.product_publisher}</span></a></h6>
									<h5>${list.price}원</h5>
								</div>
							</div>
						</div>
					</c:forEach>
					</div>
<!-- 페이지 번호 -->
				<div class="product__pagination pagination justify-content-center">
					<c:if test="${pagingDto.startPage ne 1}">
						<a class="pagelink" href="${pagingDto.startPage-1}">
							<i class="fa fa-long-arrow-left"></i></a>
					</c:if>
					<c:forEach var="v" begin="${pagingDto.startPage}" 
										end="${pagingDto.endPage}">

						<a class="pagelink" href="${v}">${v}</a>
					</c:forEach>
					<c:if test="${pagingDto.endPage lt pagingDto.totalPage}">
						<a class="pagelink" href="${pagingDto.endPage+1}">
							<i class="fa fa-long-arrow-right"></i></a>
					</c:if>
				</div>

			</div>
		</div>
	</div>
</section>
<!-- Product Section End -->



<%@ include file="../include/footer.jsp" %>