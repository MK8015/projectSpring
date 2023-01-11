<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>




<head>
    <meta charset="utf-8">
  
    <style>
      #product_info {
        text-align: center;
      }
      
    </style>
  </head>
<script>


	

	
</script>


<div class="row">
		
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
								<th style="padding:0px 20px 0px 0px;">주문일</th>
								<th id="product_info" align="center" class="shoping__product" colspan="2" >상품정보</th>
								<th>수량</th>
								<th>상품금액</th>
								<th>수령인 아이디</th>
								
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var="orderList">
							<tr>
								<td>${orderList.order_date}</td>
								<td class="order__item">
								<img src="/spring/product/getImage?imageName=${orderList.product_image}" height="150" width="100" alt=""></td>			
								<td><a href="/spring/product/detail?product_id=${orderList.product_id}" style="color: black; font-size: 14pt;"><strong>${orderList.product_name}</strong></a></td>
								<td class="order__quantity">${orderList.order_amount}</td>
								<td class="order__price">${orderList.price}</td>
								<td class="order__id">${orderList.member_id}</td>

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
		
							<div><a href="/spring/main/index" class="btn site-btn">메인으로 돌아가기</a></div>
				
		</div>
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
	
</section>
<!-- Shoping Cart Section End -->

<%@ include file="../include/footer.jsp" %>