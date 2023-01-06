<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>NONFICTION</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/spring/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="/spring/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="/spring/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="/spring/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="/spring/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="/spring/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="/spring/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/spring/resources/css/styleB.css"
	type="text/css">
<!-- css/style이 바로 안 읽힘, 이름 바꿔서 읽어야 읽힘 ㅠㅠ 나중에 style로 수정하기 -->

<!-- Js Plugins -->
<script src="/spring/resources/js/jquery-3.3.1.min.js"></script>
<script src="/spring/resources/js/bootstrap.min.js"></script>
<script src="/spring/resources/js/jquery.nice-select.min.js"></script>
<script src="/spring/resources/js/jquery-ui.min.js"></script>
<script src="/spring/resources/js/jquery.slicknav.js"></script>
<script src="/spring/resources/js/mixitup.min.js"></script>
<script src="/spring/resources/js/owl.carousel.min.js"></script>
<script src="/spring/resources/js/main.js"></script>

</head>

<body>
	<!-- Blog Details Section Begin -->
	<section class="blog-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-2 col-md-5 order-md-1 order-2">
					<div class="blog__sidebar">
						<div class="blog__sidebar__item">
							<h4>메뉴</h4>
							<ul>
								<li><a href="#">상품 관리</a></li>
								<li><a href="#">주문 관리</a></li>
								<li><a href="#">회원 관리</a></li>
								<li><a href="#">통계</a></li>
							</ul>
						</div>
					</div>
				</div>
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
													<h6 class="m-0 font-weight-bold text-primary">상품목록</h6>
												</div>
												<!-- Card Body -->
												<div class="card-body">
													<table class="table">
														<thead>
															<tr>
																<th>상품 번호</th>
																<th>상품 이름</th>
																<th>재고</th>
																<th>단가</th>
															</tr>
														</thead>
														<tbody>
												<c:forEach items="${list}" var="productVo">
													<tr>
														<td>${productVo.product_id}</td>
														<td>${productVo.product_name}</td>
														<td>${productVo.product_quantity}</td>
														<td>${productVo.price}</td>
													</tr>
												</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>


									<div class="row">

										<!-- Content Column -->
										<div class="col-lg-6 mb-4">

											<!-- Project Card Example -->
											<div class="card shadow mb-4">
												<div class="card-header py-3">
													<h6 class="m-0 font-weight-bold text-primary">Projects</h6>
												</div>
												<div class="card-body">
													<h4 class="small font-weight-bold">
														Server Migration <span class="float-right">20%</span>
													</h4>
													<div class="progress mb-4">
														<div class="progress-bar bg-danger" role="progressbar"
															style="width: 20%" aria-valuenow="20" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
													<h4 class="small font-weight-bold">
														Sales Tracking <span class="float-right">40%</span>
													</h4>
													<div class="progress mb-4">
														<div class="progress-bar bg-warning" role="progressbar"
															style="width: 40%" aria-valuenow="40" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
													<h4 class="small font-weight-bold">
														Customer Database <span class="float-right">60%</span>
													</h4>
													<div class="progress mb-4">
														<div class="progress-bar" role="progressbar"
															style="width: 60%" aria-valuenow="60" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
													<h4 class="small font-weight-bold">
														Payout Details <span class="float-right">80%</span>
													</h4>
													<div class="progress mb-4">
														<div class="progress-bar bg-info" role="progressbar"
															style="width: 80%" aria-valuenow="80" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
													<h4 class="small font-weight-bold">
														Account Setup <span class="float-right">Complete!</span>
													</h4>
													<div class="progress">
														<div class="progress-bar bg-success" role="progressbar"
															style="width: 100%" aria-valuenow="100" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
												</div>
											</div>

											<!-- Color System -->
											<div class="row">
												<div class="col-lg-6 mb-4">
													<div class="card bg-primary text-white shadow">
														<div class="card-body">
															Primary
															<div class="text-white-50 small">#4e73df</div>
														</div>
													</div>
												</div>
												<div class="col-lg-6 mb-4">
													<div class="card bg-success text-white shadow">
														<div class="card-body">
															Success
															<div class="text-white-50 small">#1cc88a</div>
														</div>
													</div>
												</div>
												<div class="col-lg-6 mb-4">
													<div class="card bg-info text-white shadow">
														<div class="card-body">
															Info
															<div class="text-white-50 small">#36b9cc</div>
														</div>
													</div>
												</div>
												<div class="col-lg-6 mb-4">
													<div class="card bg-warning text-white shadow">
														<div class="card-body">
															Warning
															<div class="text-white-50 small">#f6c23e</div>
														</div>
													</div>
												</div>
												<div class="col-lg-6 mb-4">
													<div class="card bg-danger text-white shadow">
														<div class="card-body">
															Danger
															<div class="text-white-50 small">#e74a3b</div>
														</div>
													</div>
												</div>
												<div class="col-lg-6 mb-4">
													<div class="card bg-secondary text-white shadow">
														<div class="card-body">
															Secondary
															<div class="text-white-50 small">#858796</div>
														</div>
													</div>
												</div>
												<div class="col-lg-6 mb-4">
													<div class="card bg-light text-black shadow">
														<div class="card-body">
															Light
															<div class="text-black-50 small">#f8f9fc</div>
														</div>
													</div>
												</div>
												<div class="col-lg-6 mb-4">
													<div class="card bg-dark text-white shadow">
														<div class="card-body">
															Dark
															<div class="text-white-50 small">#5a5c69</div>
														</div>
													</div>
												</div>
											</div>

										</div>

										<div class="col-lg-6 mb-4">

											<!-- Illustrations -->
											<div class="card shadow mb-4">
												<div class="card-header py-3">
													<h6 class="m-0 font-weight-bold text-primary">Illustrations</h6>
												</div>
												<div class="card-body">
													<div class="text-center"></div>
													<p>
														Add some quality, svg illustrations to your project
														courtesy of <a target="_blank" rel="nofollow"
															href="https://undraw.co/">unDraw</a>, a constantly
														updated collection of beautiful svg images that you can
														use completely free and without attribution!
													</p>
													<a target="_blank" rel="nofollow" href="https://undraw.co/">Browse
														Illustrations on unDraw &rarr;</a>
												</div>
											</div>

											<!-- Approach -->
											<div class="card shadow mb-4">
												<div class="card-header py-3">
													<h6 class="m-0 font-weight-bold text-primary">Development
														Approach</h6>
												</div>
												<div class="card-body">
													<p>SB Admin 2 makes extensive use of Bootstrap 4
														utility classes in order to reduce CSS bloat and poor page
														performance. Custom CSS classes are used to create custom
														components and custom utility classes.</p>
													<p class="mb-0">Before working with this theme, you
														should become familiar with the Bootstrap framework,
														especially the utility classes.</p>
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


					<!-- Logout Modal-->
					<div class="modal fade" id="logoutModal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Ready to
										Leave?</h5>
									<button class="close" type="button" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
								</div>
								<div class="modal-body">Select "Logout" below if you are
									ready to end your current session.</div>
								<div class="modal-footer">
									<button class="btn btn-secondary" type="button"
										data-dismiss="modal">Cancel</button>
									<a class="btn btn-primary" href="login.html">Logout</a>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
	<!-- Blog Details Section End -->

</body>

</html>