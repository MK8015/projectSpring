<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/adminHeader.jsp" %>
<script>
$(document).ready(function(){
	

	$("#productInsert").click(function(e){
		e.preventDefault();
		$(".orderForm:gt(0)").parent().parent().remove();
		var form = $(".productForm").eq(0).clone();
		form.attr("class","productInsertForm");
		form.css("display","");
		$(this).parent().append(form);
	});
	
	$(".orderInfo").on("click","td",function(e){
		e.preventDefault();
		$(".productInsertForm").remove();
		$(".orderForm:gt(0)").parent().parent().remove();
		var form = $(".productForm").eq(0).clone();
		var tds = $(this).parent().find("td");
		var order_no = tds.eq(0).text();
		console.log(order_no);
		var tr = $(this).parent();
		$.post("/spring/admin/detailOrder",{"order_no":order_no},function(rData){
			var jsonObject = JSON.parse(rData);
			var inputs = form.find("input");
			inputs.eq(0).attr("readonly","true").val(jsonObject.order_no);
			inputs.eq(1).val(jsonObject.member_id);
			inputs.eq(2).val(jsonObject.product_id);
			inputs.eq(3).val(jsonObject.order_amount);
			inputs.eq(4).val(jsonObject.order_address);
			inputs.eq(5).val(jsonObject.address_detail);
			inputs.eq(6).val(jsonObject.order_phonenum);
			inputs.eq(7).val(jsonObject.order_date);
			form.css("display","");
			tr.after("<tr><td colspan='4'></td></tr>");
			var td = tr.next().find("td");
			form.find("a").attr("href","/spring/admin/deleteOrder?order_no="+jsonObject.order_no);
			form.find("form").attr("action","/spring/admin/updateOrder");
			td.append(form);
			
		});
	});
	
});
</script>

	<!--  입력,수정 양식 -->
	<div style="margin: 10px; display: none" class="orderForm">
		<form role="form" class="productInsert" action="/spring/admin/insertOrder" method="post">
			<div class="form-group">
				주문 번호
				<input type="text" class="form-control" placeholder="주문 번호" name="order_no"/>
			</div>
			<div class="form-group">
				주문한 회원
				<input type="text" class="form-control" placeholder="주문한 회원" name="member_id"/>
			</div>
			<div class="form-group">
				주문한 상품
				<input type="text" class="form-control" placeholder="주문한 상품" name="product_id"/>
			</div>
			<div class="form-group">
				수량
				<input type="number" class="form-control" placeholder="수량" name="order_amount"/>
			</div>
			<div class="form-group">
				배송지
				<input type="text" class="form-control" placeholder="배송지" name="order_address"/>
			</div>
			<div class="form-group">
				상세 주소
				<input type="text" class="form-control" placeholder="상세 주소" name="address_detail"/>
			</div>		
			<div class="form-group">
				전화번호
				<input type="text" class="form-control" placeholder="전화번호" name="order_phonenum"/>
			</div>
			<div class="form-group">
				주문 날짜
				<input type="text" class="form-control" placeholder="주문 날짜" name="order_date"/>
			</div>
			<button type="submit" class="site-smbtn">작성 완료</button>
			<a href="#" class="site-smbtn">삭제</a>
		</form>
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
													<h6 class="m-0 font-weight-bold text-primary">상품목록</h6>항목을 누르면 수정,삭제 가능
												</div>
												<!-- Card Body -->
												<div class="card-body">
													<table class="table table-hover" style="table-layout: fixed">
														<thead>
															<tr>
																<th>주문 번호</th>
																<th>주문한 아이디</th>
																<th>책 이름</th>
																<th>수량</th>
																<th>가격</th>
															</tr>
														</thead>
														<tbody>
												<c:forEach items="${list}" var="orderVo">
													<tr class="orderInfo">
														<td>${orderVo.order_no}</td>
														<td>${orderVo.member_id}</td>
														<td>${orderVo.product_name}</td>
														<td>${orderVo.order_amount}</td>
														<td>${orderVo.price}</td>
													</tr>
												</c:forEach>
														</tbody>
													</table>
													<a href="#" class="site-smbtn" id="productInsert">입력</a>				
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