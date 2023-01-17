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
					<h2>주문상세정보</h2>
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
								<th id="product_info" align="center" class="shoping__product" colspan="3" >상품정보</th>
								<th>수량</th>
								<th>상품금액</th>
							
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var="orderList">
							<tr>
								<td>${orderList.order_date}</td>
								<td class="order__item">
								<img src="/spring/product/getImage?imageName=${orderList.product_image}" height="150" width="100" alt=""></td>			
								<td><a href="/spring/product/detail?product_id=${orderList.product_id}" style="color: black; font-size: 14pt;"><strong>${orderList.product_name}</strong></a><br>
								<span>${orderList.product_author}|${orderList.product_publisher}<br> 
								</span></td>
								
								<td></td>
								<td class="order__quantity">${orderList.order_amount}</td>
								<td class="order__price">${orderList.price}</td>
								
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
			<div><a href="/spring/main/index" class="btn site-btn">메인으로 돌아가기</a></div>
				
		</div>
	
	
</section>
<!-- Shoping Cart Section End -->

<%@ include file="../include/footer.jsp" %>