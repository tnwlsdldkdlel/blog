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

a:link {
	text-decoration: none;
	color: black;
}

a:visited {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: underline;
	color: black;
}

a:active {
	text-decoration: none;
	color: black;
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
				$(".table-light a").on(
						"click",
						function(e) {
							e.preventDefault();
							actionForm.find("input[name='bno']").val(
									$(this).attr("href"));
							actionForm.attr("action", "/ITlog/Q&A/content");
							actionForm.submit();
						});

				$("#joinBtn").on("click", function(e) {
					e.preventDefault();
					location.href = "/ITlog/join";
				});

				$("#writeBtn").on("click", function(e) {
					e.preventDefault();
					location.href = "/ITlog/Q&A/write"
				});

			});
</script>
<body>

	<%@include file="../includes/header.jsp"%>

	<!-- Page Container -->
	<div class="w3-container w3-content"
		style="max-width: 1400px; margin-top: 80px">
		<!-- The Grid -->
		<div class="w3-row">
			<!-- Left Column -->
			<div class="w3-col m3 ">

				<div class="w3-white">
					<div class="w3-container">

						<!-- 로그인 안 했을경우 -->
						<!-- 로그인 폼 -->
						<sec:authorize access="isAnonymous()">
							<h4 class="w3-center">login</h4>

							<hr>
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
									<button type="submit" id="loginBtn"
										class="w3-button w3-theme-d2 w3-margin-bottom">login</button>
									<button type="submit" id="joinBtn"
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
									<br />
									<div class="w3-container w3-center">
										<img alt="프로필이미지" src="/upload/${user.profileImage }"
											class="rounded-circle" style="max-height: 200px">
									</div>
									<br />
									<p class="w3-center">
										<b><c:out value="${user.nickname }" /></b> (
										<c:out value="${user.id }" />
										)
									</p>
									<p class="w3-center">
										<c:out value="${user.blog_itroduction }" />
									</p>
									<hr>
									<div class="w3-center">
										<button type="submit" id="logout"
											class="w3-button w3-theme-d2 w3-center">logout</button>
										<button type="submit" id="writeBtn"
											class="w3-button w3-theme-d2 w3-center">글쓰기</button>
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />
									</div>
								</div>
							</form>
						</sec:authorize>
						<br />
					</div>
				</div>
				<br />

				<!-- End Left Column -->
			</div>
			<!-- 검색 -->
			<div class="container">
				<div class="row right">
					<form action="/ITlog/community/search">
						<div class="input-group mb-3">
							<input type="text" class="form-control" name="keyword">
							<div class="input-group-append">
								<button class="btn btn-outline-secondary w3-theme-d2"
									type="submit" data-oper="search">검색</button>
							</div>
						</div>
					</form>
				</div>
			</div>

			<!-- 검색끝  -->
			<!-- Middle Column -->
			<div class="w3-col m7">
				<table class="table table-hover">
					<thead>
						<tr class="table-light">
							<th scope="col">글번호</th>
							<th scope="col">제목</th>
							<th scope="col">아이디</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="search" items="${search}">
							<tr class="table-light">
								<td>#<c:out value="${search.bno }" /></td>
								<td><a href="${search.bno }"><c:out
											value="${search.title }" /></a></td>
								<td><c:out value="${search.id }" /></td>
								<td><c:out value="${search.regdate }" /></td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>
			<button type="button" id="listBtn" class="w3-button w3-theme-d2">목록</button>
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

	<form action="/ITlog/Q&A" id="actionForm" method="get">
		<input type="hidden" name="currentPage"
			value="<c:out value='${page.currentPage }'/>" /> <input
			type="hidden" name="bno" value="" />
	</form>


</body>
</html>


