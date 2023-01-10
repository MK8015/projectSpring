<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>


<script>

$(document).ready(function(){
	
	$("#btnDetail").click(function(){
		
		console.log("동작함")
		
		$("#modal-972112").trigger("click");
		$("#modal-container-972112").attr("style","display: block;");
	})
	

	
	var url="/spring/order/orderList"
});

</script>

<div class="row">
		<div class="col-md-12">
			 <a id="modal-972112" href="#modal-container-972112" role="button" class="btn" data-toggle="modal">Launch demo modal</a>
			
			<div class="modal fade" id="modal-container-972112" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
						<div class="shoping__cart__table">
						<table>
						<thead>
							<tr>
								<th>주문일</th>
								<th class="shoping__product">상품정보</th>
								<th>수량</th>
								<th>상품금액</th>
								<th>수령인 아이디</th>
								
							</tr>
						</thead>
<!-- 						<tbody> -->
<%-- 						<c:forEach items="${list}" var="orderList"> --%>
<!-- 							<tr> -->
<%-- 								<td>${orderList.ORDER_DATE}</td> --%>
<!-- 								<td class="order__item"> -->

<%-- 										<h4 id="productName">${orderList.PRODUCT_NAME}</h4></td> --%>
								
<%-- 								<td class="order__quantity">${orderList.ORDER_AMOUNT}</td> --%>
<%-- 								<td class="order__price">${orderList.PRICE}</td> --%>
<%-- 								<td class="order__id">${orderList.MEMBER_ID}</td> --%>
<!-- 								<td class="order__id"><button class="btn btn-success" type="button" id="btnDetail">상세보기</button></td> -->
<!-- 							</tr> -->
<%-- 						</c:forEach>	 --%>
<!-- 						</tbody> -->
						</table>
						</div>				
						</div>
						
						<div class="modal-footer">
							 
							
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								확인
							</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>

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
								<th>주문일</th>
								<th class="shoping__product">상품정보</th>
								<th>수량</th>
								<th>상품금액</th>
								<th>수령인 아이디</th>
								
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var="orderList">
							<tr>
								<td>${orderList.ORDER_DATE}</td>
								<td class="order__item">
<%-- 									<img src="/spring/product/getImage?imageName=${orderList.PRODUCT_IMAGE}"> --%>
										<h4 id="productName">${orderList.PRODUCT_NAME}</h4></td>
								
								<td class="order__quantity">${orderList.ORDER_AMOUNT}</td>
								<td class="order__price">${orderList.PRICE}</td>
								<td class="order__id">${orderList.MEMBER_ID}</td>
								<td class="order__id"><button class="btn btn-success" type="button" id="btnDetail">상세보기</button></td>
						</c:forEach>
								
								
							<tr>
<!-- 								<td class="shoping__cart__item"> -->
<!-- 									<img src="img/cart/cart-3.jpg" alt=""> -->
<!-- 									<h5>Organic Bananas</h5> -->
<!-- 								</td> -->
<!-- 								<td class="shoping__cart__price"> -->
<!-- 									$69.00 -->
<!-- 								</td> -->
<!-- 								<td class="shoping__cart__quantity"> -->
<!-- 									<div class="quantity"> -->
<!-- 										<div class="pro-qty"> -->
<!-- 											<input type="text" value="1"> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</td> -->
<!-- 								<td class="shoping__cart__total"> -->
<!-- 									$69.99 -->
<!-- 								</td> -->
<!-- 								<td class="shoping__cart__item__close"> -->
<!-- 									<span class="icon_close"></span> -->
<!-- 								</td> -->
<!-- 							</tr> -->
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="shoping__cart__btns">
					<a href="#" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
					<a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                            Upadate Cart</a>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="shoping__continue">
					<div class="shoping__discount">
						<h5>Discount Codes</h5>
						<form action="#">
							<input type="text" placeholder="Enter your coupon code">
							<button type="submit" class="site-btn">APPLY COUPON</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="shoping__checkout">
					<h5>Cart Total</h5>
					<ul>
						<li>Subtotal <span>$454.98</span></li>
						<li>Total <span>$454.98</span></li>
					</ul>
					<a href="#" class="primary-btn">PROCEED TO CHECKOUT</a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Shoping Cart Section End -->

<%@ include file="../include/footer.jsp" %>