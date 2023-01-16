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
	
	
	$(".memberInfo").on("click","td",function(e){
		e.preventDefault();
		openDetail = !openDetail;
		if(openDetail){
			$(".memberForm:gt(0)").parent().parent().remove();
			var form = $(".memberForm").eq(0).clone();
			var tds = $(this).parent().find("td");
			var member_id = tds.eq(0).text();
			console.log(member_id);
			var tr = $(this).parent();
			$.post("/spring/admin/memberDetail",{"member_id":member_id},function(rData){
				var jsonObject = JSON.parse(rData);
				var inputs = form.find("input");
				var img = form.find("img");
				inputs.eq(0).attr("readonly","true").val(jsonObject.member_id);
				inputs.eq(1).val(jsonObject.member_name);
				inputs.eq(2).val(jsonObject.password);
				inputs.eq(3).val(jsonObject.phonenum);
				inputs.eq(4).val(jsonObject.email);
				inputs.eq(5).val(jsonObject.address);
				inputs.eq(6).val(jsonObject.address_detail);
				form.css("display","");
				tr.after("<tr><td colspan='4'></td></tr>");
				img.attr("src","/spring/product/getImage?imageName="+ jsonObject.member_pic);
				var td = tr.next().find("td");
				form.find("a").attr("href","/spring/admin/deleteMember?member_id="+jsonObject.member_id);
				td.append(form);
				
			});
		}else{
			$(".memberForm:gt(0)").parent().parent().remove();
		}
	});
	
	
	$(document).on("click",".address",function(){
		var address = $(this);
		 new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	            	address.val(data.address); // 주소 넣기
	            	address.parent().next().find("input").focus(); //상세입력 포커싱
	            }
	        }).open();
	});

	
});
</script>

	<!--  입력,수정 양식 -->
	<div style="margin:10px; display:none" class="memberForm">
		<form role="form" action="/spring/admin/updateMember" method="post" enctype="multipart/form-data">
			<div class="form-group">
				아이디
				<input type="text" class="form-control" placeholder="아이디" name="member_id"/>
			</div>
			<div class="form-group">
				이름
				<input type="text" class="form-control" placeholder="이름" name="member_name"/>
			</div>
			<div class="form-group">
				비밀번호
				<input type="text" class="form-control" placeholder="비밀번호" name="password"/>
			</div>
			<div class="form-group">
				폰번호
				<input type="text" class="form-control" placeholder="폰번호" name="phonenum"/>
			</div>
			<div class="form-group">
				이메일
				<input type="text" class="form-control" placeholder="이메일" name="email"/>
			</div>
			<div class="form-group">
				주소
				<input type="text" class="form-control address" placeholder="주소" name="address"/>
			</div>
			<div class="form-group">
				상세 주소
				<input type="text" class="form-control address_detail" placeholder="상세 주소" name="address_detail"/>
			</div>
			<div class="col-lg-5 d-none d-lg-block bg-register-image">
				<img src="/spring/resources/img/defaultprofile.png">
			</div>
			<div class="form-group">
				<div class="custom-file" style="margin: 20px">
					<input type="file" class="custom-file-input productImage" id="member_pic" name="file"> 
					<label class="custom-file-label" id="productImageLabel" for="member_pic">사진 선택</label>

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
													<h6 class="m-0 font-weight-bold text-primary">회원 목록</h6>항목을 누르면 수정,삭제 가능
												</div>
												<!-- Card Body -->
												<div class="card-body">
													<table class="table table-hover" style="table-layout: fixed">
														<thead>
															<tr>
																<th>회원 아이디</th>
																<th>회원 이름</th>
																<th>가입일</th>
																<th>이메일</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${list}" var="memberVo">
																<tr class="memberInfo">
																	<td>${memberVo.member_id}</td>
																	<td>${memberVo.member_name}</td>
																	<td>${memberVo.regdate}</td>
																	<td>${memberVo.email}</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>					
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