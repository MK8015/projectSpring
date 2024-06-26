<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<head>
<meta charset="utf-8">
</head>
<div class="row">
</div>
<!-- START : Shopping Cart 이미지 Section -->
<section class="subtitle spad">
   <div class="container">
      <div class="row subtitle-section set-bg" data-setbg="/spring/resources/img/paymentok.png">
         <div class="col-lg-12 text-center">
            <div class="subtitle__text">
               <h2>　<font color="#7fad39">주문이 정상적으로 완료</font><font color="#252525">되었습니다.</font></h2>
               </div>
            </div>
         </div>
      </div>
   </section>
<!-- END : Shopping Cart 이미지 Section -->

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
								<th colspan="2">상품정보</th>
								<th>수량</th>
								<th>상품금액</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var="orderVo">
							<tr>
								<td class="shoping__cart__date">${orderVo.order_date}</td>
								<td style="padding-left: 50px">
									<img width="100px" src="/spring/product/getImage?imageName=${orderVo.product_image}"
									onclick="location.href='/spring/product/detail?product_id=${orderVo.product_id}'">
								</td>
								<td class="shoping__order__item" style="padding-left: 20px">	
									<h5 onclick="location.href='/spring/product/detail?product_id=${orderVo.product_id}'">
									${orderVo.product_name}<br>
									<span style="font-size:11px; color:gray;"
									>${orderVo.product_author}|${orderVo.product_publisher}</span></h5>
								</td>
								<td class="shoping__order__quantity">${orderVo.order_amount}</td>
								<td class="shoping__order__price">
								<fmt:formatNumber value="${orderVo.price*orderVo.order_amount}" pattern="#,###"/>
								원</td>
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