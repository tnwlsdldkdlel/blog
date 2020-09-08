<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		
		var form = $("form");
		
		$("button[data-oper='join']").on("click",function(e){
			e.preventDefault();
			form.attr("action","/blog/join").attr("method","get").submit();
		});
	});
</script>
</head>
<body>
<%@include file="../includes/header.jsp" %>
<form action="/blog/login" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">id</label>
    <input type="text" class="form-control" name="id" >
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" name="password">
  </div>
 
  <button type="submit" data-oper="login" class="btn btn-primary">login</button>
  <button type="submit" data-oper="join" class="btn btn-primary">Join</button>
</form>
<%@include file="../includes/footer.jsp" %>
</body>
</html>