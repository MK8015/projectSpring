<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/adminHeader.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(document).ready(function(){
	var openDetail = false;
	
	// member image 변경
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
			input.parent().prev().find("img").attr("src",e.target.result);
		};
	});
	
	// member 상세정보 열기
	$(".memberInfo").on("click","td",function(e){
		e.preventDefault();
		openDetail = !openDetail;
		if(openDetail){
			$(".memberForm:gt(0)").parent().parent().remove();
			var form = $(".memberForm").eq(0).clone();
			var tds = $(this).parent().find("td");
			var member_id = tds.eq(0).text();
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
	
	//주소 api
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
		<form role="form" action="/spring/admin/updateMember" method="post" 
			enctype="multipart/form-data" class="mypage_form">
			
			<div class="form-gruop row">
				<div class="col-lg-2">
					<p style="padding-top: 13px;">아이디</p>
				</div>
				<div class="col-lg-10">
					<input type="text" class="mypage__input" placeholder="아이디" name="member_id"/>
				</div>
			</div>
			
			<div class="form-gruop row">
				<div class="col-lg-2">
					<p style="padding-top: 13px;">이름</p>
				</div>
				<div class="col-lg-10">
					<input type="text" class="mypage__input" placeholder="이름" name="member_name"/>
				</div>
			</div>
			
			<div class="form-gruop row">
				<div class="col-lg-2">
					<p style="padding-top: 13px;">비밀번호</p>
				</div>
				<div class="col-lg-10">
					<input type="text" class="mypage__input" placeholder="비밀번호" name="password"/>
				</div>
			</div>
			
			<div class="form-gruop row">
				<div class="col-lg-2">
					<p style="padding-top: 13px;">전화번호</p>
				</div>
				<div class="col-lg-10">
					<input type="text" class="mypage__input" placeholder="전화번호" name="phonenum"/>
				</div>
			</div>
			
			<div class="form-gruop row">
				<div class="col-lg-2">
					<p style="padding-top: 13px;">이메일</p>
				</div>
				<div class="col-lg-10">
					<input type="text" class="mypage__input" placeholder="이메일" name="email"/>
				</div>
			</div>
			
			<div class="form-gruop row">
				<div class="col-lg-2">
					<p style="padding-top: 13px;">주소</p>
				</div>
				<div class="col-lg-10">
					<input type="text" class="mypage__input address" 
						 placeholder="주소" name="address" style="margin-bottom: 10px;">
					<p style="padding-left: 10px; margin-bottom: 10px;">상세</p>
					<input type="text" class="mypage__input address_detail"
						 placeholder="상세 주소" name="address_detail">
				</div>
			</div>
			
			
			<div class="form-gruop row">
				<div class="col-lg-2">
					<p style="padding-top: 13px;">사진</p>
				</div>
				<div class="col-lg-10">
					<div class="col-lg-5 d-none d-lg-block bg-register-image" style="margin-bottom: 18px;">
						<img src="/spring/resources/img/defaultprofile.png" style="margin-left: 10px;">
					</div>
					<div class="custom-file">
						<input type="file" class="custom-file-input productImage" id="member_pic" name="file"
							 style="margin-top: 20px; padding-left: 10px;"> 
						<label class="custom-file-label" id="productImageLabel" for="member_pic"
								style="margin-left: 10px;">사진 선택</label>
					</div>
				</div>
			</div>
			
			<button type="submit" class="site-smbtn">작성 완료</button>
			<a href="#" class="site-smbtn">삭제</a>
		</form>
	</div>
	
	<!-- 오른쪽 관리 부분 -->
	<div class="col-lg-10 col-md-7 order-md-1 order-1">
		<div class="mypage_title">
			<h3>회원 관리</h3>
			<p style="text-align: center; padding-top: 7px; padding-bottom: 15px;">항목을 누르면 수정/삭제 가능</p>
		</div>
	
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
</section>
<!-- 끝 -->


<%@ include file="../include/footer.jsp" %>
</body>

</html>

