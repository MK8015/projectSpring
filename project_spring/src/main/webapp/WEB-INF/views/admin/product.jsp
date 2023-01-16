<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/adminHeader.jsp" %>
<script>
$(document).ready(function(){
	var openDetail = false;
	$(document).on("change","input[type=file]",function(){
		var image = this.files[0];
		var input = $(this);
		var fileReader = new FileReader();
		fileReader.readAsDataURL(image);
		fileReader.onload = function(e) {
		
		var imgFileName = input.val();
		var spliteImgFileName = imgFileName.split("\\");
		var ImageName= spliteImgFileName.pop();
		input.next().text(ImageName);
		input.parent().parent().prev().find("img").attr("src",e.target.result);
		
		};
	});
	
	$("#productInsert").click(function(e){
		e.preventDefault();
		$(".productForm:gt(0)").parent().parent().remove();
		var form = $(".productForm").eq(0).clone();
		form.attr("class","productInsertForm");
		form.css("display","");
		$(this).parent().append(form);
	});
	
	$(".productInfo").on("click","td",function(e){
		e.preventDefault();
		openDetail = !openDetail;
		if(openDetail){
			$(".productInsertForm").remove();
			$(".productForm:gt(0)").parent().parent().remove();
			var form = $(".productForm").eq(0).clone();
			var tds = $(this).parent().find("td");
			var product_id = tds.eq(0).text();
			console.log(product_id);
			var tr = $(this).parent();
			$.post("/spring/admin/productDetail",{"product_id":product_id},function(rData){
				var jsonObject = JSON.parse(rData);
				var inputs = form.find("input");
				var textarea = form.find("textarea");
				var img = form.find("img");
				inputs.eq(0).attr("readonly","true").val(jsonObject.product_id);
				inputs.eq(1).val(jsonObject.product_name);
				inputs.eq(2).val(jsonObject.price);
				inputs.eq(3).val(jsonObject.product_quantity);
				inputs.eq(4).val(jsonObject.product_category);
				textarea.text(jsonObject.product_description);
				inputs.eq(5).val(jsonObject.product_author);
				inputs.eq(6).val(jsonObject.product_publisher);
				form.css("display","");
				tr.after("<tr><td colspan='4'></td></tr>");
				img.attr("src","/spring/product/getImage?imageName="+ jsonObject.product_image);
				var td = tr.next().find("td");
				form.find("a").attr("href","/spring/admin/productDelete?product_id="+jsonObject.product_id);
				form.find("form").attr("action","/spring/admin/productUpdate");
				td.append(form);
			});
		}else{
			$(".productInsertForm").remove();
			$(".productForm:gt(0)").parent().parent().remove();
		}
	});
	
});
</script>

	<!--  입력,수정 양식 -->
	<div style="margin: 10px; display: none" class="productForm">
		<form role="form" class="productInsert" action="/spring/admin/productInsert" method="post" enctype="multipart/form-data">
			<div class="form-group">
				상품 번호
				<input type="text" class="form-control" placeholder="상품 번호" name="product_id"/>
			</div>
			<div class="form-group">
				상품 이름
				<input type="text" class="form-control" placeholder="상품 이름" name="product_name"/>
			</div>
			<div class="form-group">
				가격
				<input type="number" class="form-control" placeholder="가격" name="price"/>
			</div>
			<div class="form-group">
				재고
				<input type="number" class="form-control" placeholder="재고" name="product_quantity"/>
			</div>
			<div class="form-group">
				카테고리
				<input type="text" class="form-control" placeholder="카테고리" name="product_category"/>
			</div>
			<div class="form-group">
				상세 정보
				<textarea rows="5" cols="" class="form-control" style="resize:none" name="product_description"></textarea>
			</div>
			<div class="form-group">
				작가
				<input type="text" class="form-control" placeholder="작가" name="product_author"/>
			</div>
			<div class="form-group">
				출판사
				<input type="text" class="form-control" placeholder="출판사" name="product_publisher"/>
			</div>
			<div class="col-lg-5 d-none d-lg-block bg-register-image"
				id="productImagePreview">
				<img src="/spring/resources/img/defaultprofile.png">
			</div>

			<div class="form-group">
				<div class="custom-file" style="margin: 20px">
					<input type="file" class="custom-file-input productImage" id="productImage" name="file"> 
					<label class="custom-file-label" id="productImageLabel" for="productImage">이미지 선택</label>

				</div>
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
																<th>상품 번호</th>
																<th>상품 이름</th>
																<th>재고</th>
																<th>단가</th>
															</tr>
														</thead>
														<tbody>
												<c:forEach items="${list}" var="productVo">
													<tr class="productInfo">
														<td>${productVo.product_id}</td>
														<td>${productVo.product_name}</td>
														<td>${productVo.product_quantity}</td>
														<td>${productVo.price}</td>
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