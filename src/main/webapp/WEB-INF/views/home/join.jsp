<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	$(document).ready(
			function() {

				var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)");
				var maxSize = 5242880;
				var id ="";
				var password="";
				var nickname="";
				var inuptFile ="";
				var files = "";
				var formData = new FormData();
				var check = "";

				function checkExtenSize(fileName, fileSize) {
					if (fileSize >= maxSize) {
						alert("파일 사이즈가 큽니다");
						return false;
					}
					if (regex.test(fileName)) {
						alert("해당 파일은 업로드 할 수 있는 파일이 아닙니다");
						inuptFile = $("input[name='profileImage']").val("");
						return false;
					}
					return true;
				}

				//이미지 확인
				$("#profileImage").change(
						function() {
							inuptFile = $("input[name='profileImage']");
							files = inuptFile[0].files;

							//사이즈와 이름 체크
							for (var i = 0; i < files.length; i++) {
								if (!checkExtenSize(files[i].name, files[i].size)) {
									return false;
								}
								formData.append("uploadFile", files[i]);
							}
							
							if (this.files && this.files[0]) {
								var reader = new FileReader;
								reader.onload = function(data) {
									$(".select_img img").attr("src",
											data.target.result).width(161);
								}
								reader.readAsDataURL(this.files[0]);
							}
						});
				
				//아이디 중복확인 체크
				$("#idCheck").on("click", function(e) {
					id = $("input[name='id']").val();
					if(id == null){
						alert("아이디를 입력해주세요");
						return false;
					}
					$.ajax({
						type : 'post',
						url : '/check/id/' + id,
						success : function(result) {
							if (result == 'success') {
								check = "check";
								console.log(check);
								alert("사용가능한 아이디 입니다");
							} else if (result == 'fail') {
								alert("이미 존재하는 아이디 입니다");
								$("input[name='id']").val("");
							}

						}
					});
				});
				
				//널값체크
				nullCheck = function(){
					console.log(check);
					password = $("input[name='password']").val();
					passwordCheck = $("input[id='passwordCheck']").val();
					nickName = $("input[name='nickName']").val();
					if(password != passwordCheck){
						alert("비밀번호를 확인해주세요");
						return false;
					}
					if(check == ""){
						alert("아이디 중복 체크를 해주세요");
						return false;
					}
					if(id == null || password == null || nickName== null || files[0] == null ){
						alert("빈칸 없이 작성해 주세요");
						return false;
					}
					
					$("#joinForm").submit();
					
				}

			});
</script>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<br />
	<br />
	<div class="container w3-center w-25">
		<h1>회원가입</h1>
		<hr />
		<form role="form" action="/ITlog/join" method="post"
			enctype="multipart/form-data" id="joinForm">
			<ul class="list-group list-group-flush text-left">
			<c:if test="${error ne null }">
				<script type="text/javascript">
										alert("아이디 혹은 비밀번호 오류입니다");
									</script>
			</c:if>
				<li class="list-group-item w-40"><label>아이디</label>
					<div class="input-group mb-3">
						<input type="text" type="text" class="form-control" name="id" />
						<c:if test="${error ne null}">
						 ${error }
						</c:if>
						<div class="input-group-append">
							<button class="btn btn-secondary" type="button" id="idCheck">중복확인</button>
						</div>
					</div></li>
				<li class="list-group-item w-40"><label>패스워드</label> <input
					type="password" class="form-control" name="password" id="password" /></li>
					<li class="list-group-item w-40"><label>패스워드 확인</label> <input
					type="password" class="form-control" id="passwordCheck"/></li>
				<li class="list-group-item w-40"><label>별명</label> <input
					type="text" class="form-control" name="nickName" /></li>
				<li class="list-group-item w-40"><label>블로그 프로필 이미지</label> <input
					type="file" id="profileImage" class="form-control-file"
					name="profileImage" /> <br />
					<div class="select_img">
						<img src="" />
					</div></li>
			</ul>
			<div class=w3-center>
				<button type="button" id="joinBtn"
					class="w3-button btn-secondary rounded-pill w3-margin-bottom" onclick="nullCheck();">가입</button>
			</div>
		</form>
	</div>

</body>
</html>