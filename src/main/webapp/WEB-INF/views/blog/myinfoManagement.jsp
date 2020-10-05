<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.select_img img {
	margin: 20px 0;
}
</style>
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)");
						var maxSize = 5242880;
						var ModifiedForm = $("#ModifiedForm");
						var id = ModifiedForm.find(
								"input[name='id']").val();
						var password = ModifiedForm.find(
								"input[name='password']")
								.val();
						var nickname = ModifiedForm.find(
								"input[name='nickname']")
								.val();
						var blog_name = ModifiedForm.find(
								"input[name='blog_name']")
								.val();
						var blog_itroduction = ModifiedForm
								.find(
										"input[name='blog_itroduction']")
								.val();
						var profileImage = ModifiedForm
								.find(
										"input[name='profileImage']")
								.val();
						var token = $("input[name='_csrf.parameterName']").val();
						var header = "X-CSRF-TOKEN";
						

						function checkExtenSize(fileName, fileSize) {
							if (fileSize >= maxSize) {
								alert("파일 사이즈가 큽니다");
								return false;
							}
							if (regex.test(fileName)) {
								alert("해당 파일은 업로드 할 수 있는 파일이 아닙니다");
								return false;
							}
							return true;
						}
						
						
						$("#imageUploadBtn")
								.on(
										"click",
										function(e) {
											var formData = new FormData();
											var inuptFile = $("input[name='profileImage']");
											var files = inuptFile[0].files;

											//사이즈와 이름 체크
											for (var i = 0; i < files.length; i++) {
												if (!checkExtenSize(
														files[i].name,
														files[i].size)) {
													return false;
												}
												formData.append("uploadFile",
														files[i]);

											}
										});
						//이미지확인
						$("#profileImage").change(
								function() {
									if (this.files && this.files[0]) {
										var reader = new FileReader;
										reader.onload = function(data) {
											$(".select_img img").attr("src",
													data.target.result).width(
													161);
										}

										reader.readAsDataURL(this.files[0]);
										console.log(this.files[0]);
										
										
									}
								});
						
						
						//이미지 수정
						$("#imageModifiedBtn").on("click",function(e) {
											e.preventDefault();
											var formData = new FormData();
										    var inputFile =  $("input[name='profileImage']");
											var files = inputFile[0].files;
											formData.append("profileImage",files[0]);
											console.log(files);
											console.log(id);

											$.ajax({
														type : 'post',
														enctype: 'multipart/form-data',
														url : '/myinfo/Modified/'+id,
														contentType
														: false,
														processData : false,
														data : formData,
														beforeSend : function(xhr){
															xhr.setRequestHeader(header, token);
														},
														success : function(
																result) {
															if (result == 'success') {
																alert('프로필 이미지를 변경했습니다');
															}
														},
														error : function(
																request,
																status, error) {
															alert("code:"
																	+ request.status
																	+ "\n"
																	+ "message:"
																	+ request.responseText
																	+ "\n"
																	+ "error:"
																	+ error);
														}

													});

											
										});
						

					});
</script>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<br />
	<div class="container">
		<h1>회원정보수정</h1>
		<hr />
	</div>
	<div class="container">
		<form action="/ITlog/myinfoManagement" method="post"
			enctype="multipart/form-data" id="ModifiedForm">
			<ul class="list-group list-group-flush">
				<li class="list-group-item"><label>아이디</label> <input
					type="text" class="form-control" name="id" value='${user.id }'
					readonly="readonly"></li>
				<li class="list-group-item"><label>비밀번호</label> <input
					type="password" class="form-control" name="password"
					value='${user.password }' />${user.password }</li>
				<li class="list-group-item"><label>별명</label> <input
					type="text" class="form-control" name="nickname"
					value='${user.nickname }' /></li>
				<li class="list-group-item"><label>블로그이름</label> <input
					type="text" class="form-control" name="blog_name"
					value='${user.blog_name }' /></li>
				<li class="list-group-item"><label>블로그소개</label> <input
					type="text" class="form-control" name="blog_itroduction" value="${user.blog_itroduction}" /></li>
				<li class="list-group-item"><label>블로그 프로필 이미지</label> <input
					type="file" id="profileImage" name="profileImage">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					 <br />
					<div class="select_img">
						<img src="/upload/${user.profileImage }" style="max-height: 160px" />
					</div>
					<button type="button" id="imageModifiedBtn"
						class="w3-button btn-secondary rounded-pill w3-margin-bottom">이미지수정</button></li>
						
			</ul>
			<div class=w3-center>
				<button type="submit" id="ModifiedBtn"
					class="w3-button btn-secondary rounded-pill w3-margin-bottom">수정</button>
				<button type="button" id="joinBtn"
					class="w3-button btn-secondary rounded-pill w3-margin-bottom"
					onclick="history.go(-1)">취소</button>
				<input type="hidden" id="id" value="${user.id }" />
			</div>
		</form>
	</div>

</body>
</html>