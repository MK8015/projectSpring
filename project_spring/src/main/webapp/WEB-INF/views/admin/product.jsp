<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/adminHeader.jsp" %>
<script>
$(document).ready(function(){
	
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
				id="productImagePreview" style="margin-bottom: 18px;">
				<img src="/spring/resources/img/defaultprofile.png">
			</div>

			<div class="form-group">
				<div class="custom-file">
					<input type="file" class="custom-file-input productImage" id="productImage" name="file"
						 style="margin-top: 20px;"> 
					<label class="custom-file-label" id="productImageLabel" for="productImage">이미지 선택</label>

				</div>
			</div>

					
		
			<button type="submit" class="site-smbtn">작성 완료</button>
			<a href="#" class="site-smbtn">삭제</a>
		</form>
	</div>


<!-- 오른쪽 관리 부분 -->
<div class="col-lg-10 col-md-7 order-md-1 order-1">
	<div class="mypage_title">
		<h3>상품 관리</h3>
		<p style="text-align: center; margin-bottom: 3px; margin-top: 7px;">
			항목을 누르면 수정/삭제 가능</p>
		<p style="text-align: center; padding-top: 7px;">
			<a href="#" class="mypage-btn" id="productInsert">상품 입력</a></p>
	</div>
	
	
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
</div>


</div>
</div>
</section>
<!-- 끝 -->


<%@ include file="../include/footer.jsp" %>
</body>

</html>