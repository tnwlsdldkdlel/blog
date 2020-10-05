<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link href="css/clean-blog.min.css" rel="stylesheet">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Navbar -->
<br />
<div>
	<ul class="nav justify-content-center w3-large w3-margin">
		<li class="nav-item"><a href="/ITlog/home" class="w3-bar-item w3-button w3-padding-large ">
		<i class="fa fa-home w3-margin-right"></i>home
	</a>
		</li>
		<li class="nav-item"> <a href="/ITlog/myblog"
		class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
		title="Account Settings" onclick="loginCheck()">myBlog</a></li>
		<li class="nav-item"><a
		href="/ITlog/blog"
		class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
		title="Account Settings">Blog</a></li>
		<li class="nav-item"><a href="/ITlog/Q&A"
		class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
		title="Account Settings">Q&A</a></li>
		<li class="nav-item"> <a href="/ITlog/community"
		class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
		title="Account Settings">Community</a></li>
	</ul>
</div>
<img alt="로고" src="../resources/img/log.png"  style="display: block; margin: 0 auto; width:300px ">
<html>
<body>

	<c:if test="${user eq null }">
		<script type="text/javascript">
			loginCheck = function() {
				alert("로그인을 해주세요");
			};
		</script>
	</c:if>
</body>
</html>


