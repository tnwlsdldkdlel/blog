<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
<script type="text/javascript" src="/resoures/js/blog.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {

				var actionForm = $("#actionForm");
				
				$("#listbtn").on("click",function(e){
					location.href = actionForm.attr('action');
				});

			});
</script>
<style>
html, body, h1, h2, h3, h4, h5 {
	font-family: "Open Sans", sans-serif
}
</style>
<body class="w3-theme-l5">

	<%@include file="../includes/header.jsp"%>

	<!-- Page Container -->
	<div class="w3-container w3-content"
		style="max-width: 1400px; margin-top: 80px">
		<!-- The Grid -->
		<div class="w3-row">
			<!-- Left Column -->
			<div class="w3-col m3">
				<!-- Profile -->
				<div class="w3-card w3-round w3-white">
					<div class="w3-container">
						<h5 class="w3-center">
							<sec:authentication property="principal.nickname" />
						</h5>
						<p class="w3-center">
							(
							<sec:authentication property="principal.id" />
							)
						</p>
						<hr>
						<form action="/blog/myblog/write">
							<button type="submit" id="writebtn"
								class="w3-button w3-theme-d2 w3-margin-bottom">글쓰기</button>
							<button type="submit" id="managementbtn"
								class="w3-button w3-theme-d2 w3-margin-bottom">관리</button>
						</form>
					</div>
				</div>
				<br>

				<!-- Accordion -->
				<div class="w3-card w3-round">
					<div class="w3-white">
						<button onclick="myFunction('Demo1')"
							class="w3-button w3-block w3-theme-l1 w3-left-align">
							<i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i> My
							Groups
						</button>
						<div id="Demo1" class="w3-hide w3-container">
							<p>Some text..</p>
						</div>
						<button onclick="myFunction('Demo2')"
							class="w3-button w3-block w3-theme-l1 w3-left-align">
							<i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> My
							Events
						</button>
						<div id="Demo2" class="w3-hide w3-container">
							<p>Some other text..</p>
						</div>
						<button onclick="myFunction('Demo3')"
							class="w3-button w3-block w3-theme-l1 w3-left-align">
							<i class="fa fa-users fa-fw w3-margin-right"></i> My Photos
						</button>
						<div id="Demo3" class="w3-hide w3-container">
							<div class="w3-row-padding">
								<br>
								<div class="w3-half">
									<img src="/w3images/lights.jpg" style="width: 100%"
										class="w3-margin-bottom">
								</div>
								<div class="w3-half">
									<img src="/w3images/nature.jpg" style="width: 100%"
										class="w3-margin-bottom">
								</div>
								<div class="w3-half">
									<img src="/w3images/mountains.jpg" style="width: 100%"
										class="w3-margin-bottom">
								</div>
								<div class="w3-half">
									<img src="/w3images/forest.jpg" style="width: 100%"
										class="w3-margin-bottom">
								</div>
								<div class="w3-half">
									<img src="/w3images/nature.jpg" style="width: 100%"
										class="w3-margin-bottom">
								</div>
								<div class="w3-half">
									<img src="/w3images/snow.jpg" style="width: 100%"
										class="w3-margin-bottom">
								</div>
							</div>
						</div>
					</div>
				</div>
				<br>




				<!-- End Left Column -->
			</div>

			<div class="w3-col m7">


				<c:forEach items="${content}" var="content">
					<div class="w3-container w3-card w3-white w3-round w3-margin">
						<br>
						<h4>
							<c:out value="${content.title }"></c:out>
						</h4>
						<div class="w3-left">
							<c:out value="${content.regdate }" />
						</div>
						<div class="dropdown">
							<a class="btn btn-light dropdown-toggle w3-right" href="#"
								role="button" id="dropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> </a>

							<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
								<a class="dropdown-item" id="modified" href="/blog/myblog/boardContent/modified?bno=<c:out value="${content.bno }"/>">수정</a>
								<a class="dropdown-item" id="remove" href="/blog/myblog/boardContent/remove?bno=<c:out value="${content.bno }"/>">삭제</a>
							</div>
						</div>
						<br>
						<hr class="w3-clear">
						<p>
							<c:out value="${content.content }" />
						</p>
						<div class="w3-row-padding" style="margin: 0 -16px">
							<div class="w3-half"></div>
							<div class="w3-half"></div>
						</div>
						<button type="button"
							class="w3-button w3-theme-d1 w3-margin-bottom">
							<i class="fa fa-thumbs-up"></i>  Like
						</button>
						<button type="button"
							class="w3-button w3-theme-d2 w3-margin-bottom">
							<i class="fa fa-comment"></i>  Comment
						</button>
					</div>
				</c:forEach>
				
				<div class=w3-center>
				<button type="button" id="listbtn" class="w3-button w3-theme-d2 w3-margin-bottom">목록</button>
				</div>
				<form action="/blog/myblog" method="get" id="actionForm">
					<input type="hidden" id="" value="" />
				</form>
				<!-- End Middle Column -->
			</div>

		</div>

		<!-- End Grid -->
	</div>

	<br>




</body>
</html>

