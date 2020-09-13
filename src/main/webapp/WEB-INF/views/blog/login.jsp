<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="/resources/js/blog.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		

		var loginForm = $("#loginForm");
		
		$("button[data-oper='join']").on("click", function(e) {
			e.preventDefault();
			loginForm.attr("action", "/blog/join").attr("method", "get").submit();
		});

	});
</script>
</head>
<body>
	<%@ include file="../includes/header.jsp"%>
	<div class="container">
		<div>
			<h1>login</h1>
		</div>
		<br>
		
		<form action="/loginCheck" method="post" id="loginForm">
			<div class="form-group">
				<label for="exampleInputID">ID</label> <input type="text"
					class="form-control" id="exampleInputEmail1" name="id">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Password</label> <input
					type="password" class="form-control" name="password">
			</div>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token }">
			<div class="form-group form-check">
				<input type="checkbox" class="form-check-input" name="remember-me">
				<label class="form-check-label" for="exampleCheck1"> 자동로그인</label>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
</body>
</html>