<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

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


<!-- Navbar -->

<div class="w3-bar w3-theme-d2 w3-left-align w3-large">
	<a
		class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2"
		href="javascript:void(0);" onclick="openNav()"><i
		class="fa fa-bars"></i></a> <a href="/blog/home"
		class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i
		class="fa fa-home w3-margin-right"></i>home</a> <a href="/myblog/home"
		class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
		title="Account Settings">myBlog</a>
	<sec:authorize access="isAnonymous() ">
		<a href="/blog/login"
			class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
			title="Account Settings">login/join</a>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<a href="/blog/logout"
			class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
			title="Account Settings">logout</a>
	</sec:authorize>
</div>






