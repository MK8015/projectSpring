<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>

<script>
$(document).ready(function() {
	var cartnoList = ${list};
		
	$("#frmUpdate").submit(function(){
		var json = JSON.stringify(cartnoList);
		$(this).append("<input type='hidden' name='list' value='"+json+"'>");
		return true;
	});
});
</script>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="/spring/resources/img/breadcrumb.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>결 제</h2>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- 상품 확인 처음 -->
<section class="shoping-cart spad">
	<div class="container">
		<div class="row">
			<div class="row contact__list__title">
				<div class="col-lg-12">
					<h3>상품확인</h3><hr>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="shoping__cart__table">
					<table>
						<thead>
							<tr>
								<th>상품명</th>
								<th>상품금액</th>
								<th>수량</th>
								<th>합계</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${cartnoList}" var="list">
							<tr>
								<td class="shoping__cart__item">
									<img src="/spring/product/getImage?imageName=${list.product_image}" 
									width="80px" onclick="location.href='/spring/product/detail?
									product_id=${list.product_id}'">
									<h5 onclick="location.href='/spring/product/detail?
									product_id=${list.product_id}'">
									${list.product_name}<br>
									<span style="font-size:11px; color:gray;"
									>${list.product_author}|${list.product_publisher}</span></h5>
								</td>
								<td class="shoping__cart__price">
									${list.price}원
								</td>
								<td class="shoping__cart__quantity">
									${list.cart_amount}
								</td>
								<td class="shoping__cart__total">
									${list.price*list.cart_amount}원
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-8">
				<div class="shoping__cart__btns">
					** 상품 변경을 원하시면　
					<a href="/spring/cart/list" class="primary-btn">카트로 가기 ></a>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="shoping__checkout">
					<h5>최종 결제 금액</h5>
					<ul>
						<li><span class="totalPrice">0원</span></li>
					</ul>
				</div>
			</div>
		</div>
<!-- 상품 확인 끝 -->
<!-- 배송 정보 시작 -->		
	<div class="row">
		<div class="row contact__list__title">
			<div class="col-lg-12">
				<h3>배송주소</h3><hr>
			</div>
		</div>
	<div class="col-lg-12">
		<div class="row">
			<div class="col-md-8">
				<form id="frmUpdate" role="form" action="/spring/cart/order" method="post">
				<table>
					<tr style ='vertical-align : middle'>
						<td>배송지</td>
						<td><input type="text" class="qna__input" id="" name="" placeholder=""/></td>
					</tr>
					<tr style ='vertical-align : middle'>
						<td>이름</td>
						<td><input type="text" class="qna__input" id="" name="" placeholder=""/></td>
					</tr>
					<tr style ='vertical-align : middle'>
						<td>배송주소</td>
						<td><input type="text" class="qna__input" id="" name="" placeholder=""/></td>
					</tr>
					<tr style ='vertical-align : middle'>
						<td>휴대폰</td>
						<td><input type="text" class="qna__input" id="" name="" placeholder=""/></td>
					</tr>
					<tr style ='vertical-align : middle'>
						<td>일반전화</td>
						<td><input type="text" class="qna__input" id="" name="" placeholder=""/></td>
					</tr>
					
				</table>
				<hr>
				<div class="text-right">
					<button type="submit" class="site-smbtn">작성</button>　
					<a href="/spring/board/list" class="site-smbtn">목록</a>
				</div>
			</form>
			</div>
			<div class="col-md-4">
				<form id="frmUpdate" role="form" action="/spring/board/write" method="post" enctype="multipart/form-data">
				
				<table>
					<tr style ='vertical-align : middle'>
						<td>이름</td>
						<td><input type="text" class="qna__input" id="" name="" placeholder=""/></td>
					</tr>
					<tr style ='vertical-align : middle'>
						<td>휴대폰</td>
						<td><input type="text" class="qna__input" id="" name="" placeholder=""/></td>
					</tr>
					<tr style ='vertical-align : middle'>
						<td>일반전화</td>
						<td><input type="text" class="qna__input" id="" name="" placeholder=""/></td>
					</tr>
					<tr style ='vertical-align : middle'>
						<td>이메일</td>
						<td><input type="text" class="qna__input" id="" name="" placeholder=""/></td>
					</tr>
					
				</table>
				<hr>
				<div class="text-right">
					<button type="submit" class="site-smbtn">작성</button>　
					<a href="/spring/board/list" class="site-smbtn">목록</a>
				</div>
			</form>
			</div>
		</div>
<!-- 배송 정보 끝 -->	
			</div>
		</div>
	</div>
</section>
<!-- Shoping Cart Section End -->

<%@ include file="../include/footer.jsp" %>