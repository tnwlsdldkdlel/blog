<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style>
html, body, h1, h2, h3, h4, h5 {
	font-family: "Open Sans", sans-serif
}
</style>

<script type="text/javascript">
	$(document).ready(
			function() {

				var actionForm = $("#actionForm");
				$(".page-item a").on(
						"click",
						function(e) {
							e.preventDefault();
							actionForm.find("input[name='currentPage']").val(
									$(this).attr("href"));
							actionForm.submit();
						});

			});
</script>
<body class="w3-theme-l5">

	<%@include file="../includes/header.jsp"%>

	<!-- Page Container -->
	<div class="w3-container w3-content"
		style="max-width: 1400px; margin-top: 80px">
		<!-- The Grid -->
		<div class="w3-row">
			<!-- Left Column -->
			<div class="w3-col m3">

				<!-- 로그인 안 했을경우 -->
				<!-- 로그인 폼 -->

				<div class="w3-card w3-round w3-white">
					<div class="w3-container">
						<h4 class="w3-center">login</h4>

						<hr>
						<form action="/blog/home" method="post" id="loginForm">
							<div class="form-group">
								<label for="exampleInputEmail1">id</label> <input type="text"
									class="form-control" name="id" id="id">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" name="password"
									id="password">
							</div>

							<button type="submit" data-oper="login" class="btn btn-primary">login</button>
							<button type="submit" data-oper="join" class="btn btn-primary">Join</button>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
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

			<!-- Middle Column -->
			<div class="w3-col m7">
				<c:forEach var="list" items="${list}">
					<div class="w3-container w3-card w3-white w3-round w3-margin">
						<br> <span class="w3-right w3-opacity"><c:out
								value="${list.regdate}"></c:out></span>
						<h4>
							<c:out value="${list.id}" />
						</h4>
						<br>
						<hr class="w3-clear">
						<p>
							<c:out value="${list.content}" />
						</p>
						<br />
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
			</div>
		</div>
	</div>

	<!-- End Middle Column -->
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${page.startPage > 1 }">
				<li class="page-item"><a class="page-link"
					href="${page.prevPage }" tabindex="-1" aria-disabled="true">Previous</a></li>
			</c:if>
			<c:forEach begin="${page.startPage }" end="${page.endPage }"
				var="list">
				<li class="page-item"><a class="page-link" href="${list }">${list }</a></li>
			</c:forEach>

			<li class="page-item"><a class="page-link"
				href="${page.nextPage }">Next</a></li>

		</ul>
	</nav>
	<form action="/blog/home" id="actionForm" method="get">
		<input type="hidden" name="currentPage" value="${page.currentPage }" />
	</form>

</body>
</html>


