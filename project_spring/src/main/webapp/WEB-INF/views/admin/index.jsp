<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/adminHeader.jsp"%>

<div class="col-lg-10 col-md-7 order-md-1 order-1">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">관리자 페이지</h1>
					</div>
					<!-- Content Row -->
					<div class="row">
						<!-- Area Chart -->
						<div class="col-xl-12 col-lg-7">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">최근 주문 내역</h6>

								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-area">
										<table>
											<thead>
												<tr>
													<th>주문일</th>
													<th colspan="2" style="padding-left: 50px">상품정보</th>
													<th style="padding-left: 50px">수량</th>
													<th style="padding-left: 50px">상품금액</th>

												</tr>
											</thead>
											<tbody>
												<c:forEach items="${orderList}" var="orderVo">
													<tr>
														<td class="shoping__cart__date">${orderVo.order_date}</td>
														<td style="padding-left: 50px"><img width="100px"
															src="/spring/product/getImage?imageName=${orderVo.product_image}"
															onclick="location.href='/spring/product/detail?product_id=${orderVo.product_id}'">
														</td>
														<td class="shoping__order__item"
															style="padding-left: 20px">
															<h5
																onclick="location.href='/spring/product/detail?product_id=${orderVo.product_id}'">
																${orderVo.product_name}<br> <span
																	style="font-size: 11px; color: gray;">
																	${orderVo.product_author}|${orderVo.product_publisher}</span>
															</h5>
														</td>
														<td class="shoping__order__quantity"
															style="padding-left: 50px">${orderVo.order_amount}</td>
														<td class="shoping__order__price"
															style="padding-left: 50px"><fmt:formatNumber
																value="${orderVo.price}" pattern="#,###" /> 원</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Content Row -->
					<div class="row">
						<div class="col-xl-12 col-lg-7">

							<div class="card shadow mb-4">
								<div class="card-header py-12">
									<h6 class="m-0 font-weight-bold text-primary">일별 매출 통계</h6>
								</div>
								<div class="card-body">
									<div class="chart-bar">
										<canvas id="myBarChart"></canvas>
									</div>
									<hr>

								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<!-- Content Column -->
						<div class="col-lg-12 mb-4">

							<!-- Project Card Example -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">베스트셀러</h6>
								</div>
								<div class="card-body">
									<c:forEach items="${bsList}" var="AdminVo">
										<h4 class="small font-weight-bold">${AdminVo.product_name}<span
												class="float-right">${AdminVo.cnt}부</span>
										</h4>
										<div class="progress mb-4">
											<div class="progress-bar bg-primary" role="progressbar"
												style="width: ${AdminVo.cnt*2}%"
												aria-valuenow="${AdminVo.cnt/100}" aria-valuemin="0"
												aria-valuemax="100"></div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2021</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->
</div>
</div>
</div>
</section>
<!-- Blog Details Section End -->


<!-- Js Plugins -->
<script src="/spring/resources/js/jquery-3.3.1.min.js"></script>
<script src="/spring/resources/js/bootstrap.min.js"></script>
<script src="/spring/resources/js/jquery.nice-select.min.js"></script>
<script src="/spring/resources/js/jquery-ui.min.js"></script>
<script src="/spring/resources/js/jquery.slicknav.js"></script>
<script src="/spring/resources/js/mixitup.min.js"></script>
<script src="/spring/resources/js/owl.carousel.min.js"></script>
<script src="/spring/resources/js/main.js"></script>

<!-- chart 스크립트 -->
<script src="/spring/resources/js/chart/chart.js/Chart.min.js"></script>
<script src="/spring/resources/js/chart/chart-bar-demo.js"></script>
<script>
	var ctx = document.getElementById("myBarChart");
	var chartArray = ${chartArray};
	var orderDate = [];
	var revenue = [];
	for (var i = 0; i < chartArray.length; i++) {
		orderDate.push(chartArray[i].order_date);
		revenue.push(chartArray[i].revenue);
	}

	var myBarChart = new Chart(
			ctx,
			{
				type : 'bar',
				data : {
					labels : orderDate,
					datasets : [ {
						label : "일 매출",
						backgroundColor : "#4e73df",
						hoverBackgroundColor : "#2e59d9",
						borderColor : "#4e73df",
						data : revenue,
					} ],
				},
				options : {
					maintainAspectRatio : false,
					layout : {
						padding : {
							left : 10,
							right : 25,
							top : 25,
							bottom : 0
						}
					},
					scales : {
						xAxes : [ {
							time : {
								unit : 'month'
							},
							gridLines : {
								display : false,
								drawBorder : false
							},
							ticks : {
								maxTicksLimit : 6
							},
							maxBarThickness : 25,
						} ],
						yAxes : [ {
							ticks : {
								min : 0,
								max : 500000,
								maxTicksLimit : 5,
								padding : 10,
								// Include a dollar sign in the ticks
								callback : function(value, index, values) {
									return '\\' + number_format(value);
								}
							},
							gridLines : {
								color : "rgb(234, 236, 244)",
								zeroLineColor : "rgb(234, 236, 244)",
								drawBorder : false,
								borderDash : [ 2 ],
								zeroLineBorderDash : [ 2 ]
							}
						} ],
					},
					legend : {
						display : false
					},
					tooltips : {
						titleMarginBottom : 10,
						titleFontColor : '#6e707e',
						titleFontSize : 14,
						backgroundColor : "rgb(255,255,255)",
						bodyFontColor : "#858796",
						borderColor : '#dddfeb',
						borderWidth : 1,
						xPadding : 15,
						yPadding : 15,
						displayColors : false,
						caretPadding : 10,
						callbacks : {
							label : function(tooltipItem, chart) {
								var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label
										|| '';
								return datasetLabel + ': \\'
										+ number_format(tooltipItem.yLabel);
							}
						}
					},
				}
			});
</script>

</body>

</html>