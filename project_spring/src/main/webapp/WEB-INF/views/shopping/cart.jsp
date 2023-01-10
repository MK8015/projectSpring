<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>

<script>
$(document).ready(function() {
	
	// 체크박스
	$("#chkAll").click(function(){
		var isChecked = $(this).prop("checked");
		$(".chkbox").prop("checked",isChecked);
	});
	
	// 카트 수량 변경
	$(document).on("click",".cartUpdate",function(e){
		e.preventDefault();
		var that = $(this);
// 		console.log("변경클릭");
		var product_id = $(this).parent().parent().parent().find("td").eq(0).find("input").attr("data-productId");
		var update_cart_amount = parseInt($(this).parent().find(".cart_amount").val());
		var price = $(this).parent().parent().prev().find(".price").text();
		var unitprice = parseInt(price.substring(0,price.length-1));
		
		var url = "/spring/cart/update";
		var sData = {
			  "product_id" : product_id,
			  "cart_amount"	 : update_cart_amount	
		};
// 		console.log("sData: "+ sData);
		$.post(url, sData, function(rData) {
// 		console.log("rData:", rData); 
		if(rData == "true"){
			var newPrice = parseInt(unitprice*update_cart_amount);
			that.parent().parent().next().text(newPrice+"원");
			that.parent().parent().parent().find("td").eq(0).find("input").attr("data-price", newPrice);
			showTotalPrice();
		} else {
			alert("수량 변경 실패");
		}
		}); // $post
		
	});
	
	// 카트 상품 체크박스 선택 삭제
	$(".cartDelete").click(function() {
		console.log("삭제클릭");
		var deleteEl = [];
		var arr_product_id = [];
		$(".chkbox").each(function() {
			var checked = $(this).is(":checked");
			console.log(checked);
			if (checked){
				var product_id = $(this).attr("data-productId");
				arr_product_id.push(product_id);
				deleteEl.push($(this).parent().parent()); // 선택된 체크박스의 tr들 삭제
			}
		});
		var url = "/spring/cart/delete";
		var sData = {"arr_product_id": arr_product_id};
		$.post(url, sData, function(rData){
			if (rData == "true"){
				$.each(deleteEl, function() {
					$(this).remove();
					showTotalPrice();
				});
				
			}
		});
	});
	
	// 카트 한줄 삭제
	$(".cartItemDelete").click(function() {
		var deleteEl = [];
		var arr_product_id = [];
		
		var product_id = $(this).parent().parent().find("td").eq(0).find("input").attr("data-productId");
		arr_product_id.push(product_id);
		console.log($(this));
		deleteEl.push($(this).parent().parent()); // 선택된 체크박스의 tr들 삭제
		
		var url = "/spring/cart/delete";
		var sData = {"arr_product_id": arr_product_id};
		console.log("sData:",sData);
		$.post(url, sData, function(rData){
			if (rData == "true"){
				console.log("rData:",rData);
				$.each(deleteEl, function() {
					$(this).remove();
					showTotalPrice();
				});
			}
		});
	});
	
	showTotalPrice();
	
	// 주문하기 총금액 보여주기
	$(document).on("click", ".chkbox", function(){
		showTotalPrice();		
	});
	$(document).on("click","#chkAll", function() {
		showTotalPrice();
	});
	
	function showTotalPrice() {
		var sumPrice = 0;
		$(".chkbox").each(function() {
			var checked = $(this).is(":checked");
			console.log(checked);
			if (checked == true){
				var totalPrice = parseInt($(this).attr("data-price"));
				console.log(totalPrice);
				sumPrice += totalPrice;
			}
		});
		console.log(sumPrice);
		$(".totalPrice").text(sumPrice + "원");
	}
});
</script>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="/spring/resources/img/breadcrumb.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>Shopping Cart</h2>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shoping Cart Section Begin -->
<section class="shoping-cart spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="shoping__cart__table">
					<table>
						<thead>
							<tr>
								<th>전체선택<br>
									<input id="chkAll" type="checkbox" checked/></th>
								<th>상품정보</th>
								<th>수량</th>
								<th>상품금액</th>
								<th>선택삭제<br>
									<span class="icon_close cartDelete"></span></th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${cartProductList}" var="list">
							<tr>
								<td class="shoping__cart__check">
									<input class="chkbox" type="checkbox" checked
										data-productId="${list.product_id}"
										data-price="${list.price*list.cart_amount}"/>
								</td>
								<td class="shoping__cart__item">
									<img src="/spring/product/getImage?imageName=${list.product_image}"
									 width="100px">
									<h5>${list.product_name}<br>
									<span style="font-size:11px; color:gray;"
									>${list.product_author}|${list.product_publisher}<br>
									<span class="price">${list.price}원</span></span></h5>
								</td>
								<td class="shoping__cart__quantity">
									<div class="quantity">
										<div class="pro-qty">
											<input class="cart_amount"
											type="text" value="${list.cart_amount}">
										</div><br>
										<a href="#" class="primary-btn cartUpdate">변경</a>
									</div>
								</td>
								<td class="shoping__cart__total">
									${list.price*list.cart_amount}원
								</td>
								<td class="shoping__cart__item__close">
									<span class="icon_close cartItemDelete" 
									></span>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-6">
				<div class="shoping__cart__btns">
					<a href="/spring/list/list" class="primary-btn cart-btn">쇼핑 계속하기</a>
<!-- 					<a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span> -->
<!--                             카트 업데이트하기</a> -->
				</div>
			</div>
<!-- 			<div class="col-lg-6"> -->
<!-- 				<div class="shoping__continue"> -->
<!-- 					<div class="shoping__discount"> -->
<!-- 						<h5>Discount Codes</h5> -->
<!-- 						<form action="#"> -->
<!-- 							<input type="text" placeholder="Enter your coupon code"> -->
<!-- 							<button type="submit" class="site-btn">APPLY COUPON</button> -->
<!-- 						</form> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="col-lg-6"></div>	 -->
			<div class="col-lg-6">
				<div class="shoping__checkout">
					<h5>카트 정보</h5>
					<ul>
						<li>총 상품금액 <span class="totalPrice">0원</span></li>
					</ul>
					<a href="#" class="primary-btn">주문하기</a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Shoping Cart Section End -->

<%@ include file="../include/footer.jsp" %>