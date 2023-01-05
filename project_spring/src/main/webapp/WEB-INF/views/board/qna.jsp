<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/header.jsp" %>



    <!-- Breadcrumb Section Begin -->
    <section>
        <div class="container">
            <div class="row breadcrumb-section set-bg" data-setbg="/spring/resources/img/breadcrumb.jpg">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Contact Us</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Contact Us</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

  <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <div class="row">
		<div class="col-md-2">
			<h3>
				상품문의
			</h3>
</div>
<div class="col-md-10">
<button type="button" class="site-btn">문의 작성하기</button>
</div>


<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>
							#
						</th>
						<th>
							Product
						</th>
						<th>
							Payment Taken
						</th>
						<th>
							Status
						</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="boardVo">
					<tr>
						<td>
							1
						</td>
						<td>
							${boardVo.bno}
						</td>
						<td>
							ssss
						</td>
						<td>
							Default
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
</div>


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
        </div>
    </section>
    <!-- Contact Section End -->
    


<%@ include file="../include/footer.jsp" %>