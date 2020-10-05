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

				$(button).data("join").on("click", function(e) {
					e.preventDefault();
					actionForm.attr("action").val
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
			<div class="w3-col m3 ">

				<div class="w3-card w3-round w3-white">
					<div class="w3-container">
						<h4 class="w3-center">login</h4>

						<hr>
						<!-- 로그인 안 했을경우 -->
						<!-- 로그인 폼 -->
						<sec:authorize access="isAnonymous()">
							<form action="/loginCheck" method="post" id="loginForm">
								<div class="form-group">
									<label for="exampleInputEmail1">id</label> <input type="text"
										class="form-control" name="id" id="id">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" class="form-control" name="password"
										id="password">
								</div>

								<div class=w3-center>
									<button type="submit" data-oper="login"
										class="w3-button w3-theme-d2 w3-margin-bottom">login</button>
									<button type="submit" data-oper="join"
										class="w3-button w3-theme-d2 w3-margin-bottom">Join</button>
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" /> <br />
								</div>
							</form>
						</sec:authorize>
						<!-- 로그인한 경우 -->
						<!-- 로그아웃 폼 -->
						<sec:authorize access="isAuthenticated()">
							<form action="/logoutCheck" method="post" id="logoutForm">
								<div class=w3-center>
									<button type="submit" data-oper="logout"
										class="w3-button w3-theme-d2 w3-center">logout</button>
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</div>
							</form>
						</sec:authorize>
						<br />
					</div>
				</div>
				<br />

				<!-- 검색 -->
				<div class="container">
					<div class="row row-cols-3">
						<form action="/ITlog/search" method="get" id="searchForm">
							<select class="custom-select my-1 mr-sm-2"
								id="inlineFormCustomSelectPref" name="rangeType">
								<option value="text" selected>글·내용</option>
								<option value="idANDnickname">아이디·별명</option>
							</select> <input type="text" name="keyword" class="form-control" />
							<button type="submit" data-oper="search"
								class="w3-button w3-theme-d2">검색</button>
						</form>
					</div>
				</div>
				<br>

				<!-- 검색끝  -->

				<br>
				<!-- End Left Column -->
			</div>

			<!-- Middle Column -->
			<div class="w3-col m7">

				<div class="w3-container w3-card w3-white w3-round w3-margin">
					
					<c:forEach var="idANDnickname" items="${idANDnickname}">
						<ul class="list-group list-group-flush">
							<li class="list-group-item">
								<em><c:out value="${idANDnickname.nickname}"/></em>
								(<em><c:out value="${idANDnickname.id}"/></em>)
								<p>${idANDnickname.blog_name} | ${idANDnickname.blog_itroduction}</p>
							</li>
						</ul>
						
					</c:forEach>
				</div>

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
			<c:if test="${page.currentPage < page.range }">
				<li class="page-item"><a class="page-link"
					href="${page.nextPage }">Next</a></li>
			</c:if>
		</ul>
	</nav>
	<form action="/ITlog/home" id="actionForm" method="get">
		<input type="hidden" name="currentPage" value="${page.currentPage }" />
	</form>

</body>
</html>


