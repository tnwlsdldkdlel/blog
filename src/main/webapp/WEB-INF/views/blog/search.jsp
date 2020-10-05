<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

				var myblogBtnForm = $("#myblogBtnForm");

				//관리 페이지로 이동
				$("#managementbtn").on("click", function(e) {
					e.preventDefault();
					location.href = "/ITlog/myblog/myinfoManagement";
				});

				//좋아요 버튼
				like = function(bno) {
					console.log(bno);
					$.ajax({
						type : 'post',
						url : '/like/' + bno,
						success : function(result) {
							alert("좋아요!");
							location.reload(true);
						}
					});

				}

			});
</script>
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
<body>

	<%@include file="../includes/header.jsp"%>

	<!-- Page Container -->
	<div class="w3-container w3-content"
		style="max-width: 1400px; margin-top: 80px">
		<!-- The Grid -->
		<div class="w3-row">
			<!-- Left Column -->
			<div class="w3-col m3">
				<!-- Profile -->
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
					</div>
				</div>
				<br>




				<!-- End Left Column -->
			</div>

			<!-- Middle Column -->
			<div class="w3-col m7">
				<div>전체 ${page.totalConunt }개의 글</div>
				<c:forEach items="${list}" var="list">
					<div class="w3-white w3-margin " id="listDiv">
						<br>
						<h4 class="w3-margin">
							<a
								href="/ITlog/myblog/boardContent?page=${page.currentPage }&bno=${list.bno }"><c:out
									value="${list.title }"></c:out></a>
						</h4>
						<div class="Blogintroduce w3-margin">
							<img alt="프로필이미지" src="/upload/${user.profileImage }"
								class="rounded-circle" style="max-height: 30px">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${list.regdate }" />
							<c:out value="${user.nickname }" />
						</div>
						<hr class="w3-clear">
						<p class=" w3-margin">${list.content }</p>
						<div class="w3-row-padding w3-margin" style="margin: 0 -16px">
							<div class="w3-half"></div>
							<div class="w3-half"></div>
						</div>
						<div class="button  w3-margin">
							<button type="button"
								class="w3-button w3-theme-d1 w3-margin-bottom"
								onclick='like("${list.bno}")'>
								<i class="fa fa-thumbs-up"></i>  좋아요 <span
									class="badge badge-light">${list.postlike }</span>
							</button>
							<%-- <button type="button"
								class="w3-button w3-theme-d2 w3-margin-bottom">
								<i class="fa fa-comment" onclick="move('${list.bno}','${page.currentPage}')"></i>  댓글
							</button>
							<input type="hidden" id="bnoInput" value="${list.bno }" /> --%>
						</div>
					</div>
				</c:forEach>
				<!-- End Middle Column -->
			</div>

		</div>

		<!-- End Grid -->
	</div>

	<!-- End Page Container -->
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${page.startPage > 1 }">
				<li class="page-item disabled"><a class="page-link"
					href="${page.prevPage }" tabindex="-1" aria-disabled="true">Previous</a></li>
			</c:if>
			<c:forEach begin="${page.startPage }" end="${page.endPage }"
				var="page">
				<li class="page-item"><a class="page-link" href="${page }"><c:out
							value="${page }" /></a></li>
			</c:forEach>
			<c:if test="${page.currentPage < page.range }">
				<li class="page-item"><a class="page-link"
					href="${page.nextPage }">Next</a></li>
			</c:if>
		</ul>
	</nav>

	<form action="/ITlog/myblog" method="get" id="actionForm">
		<input type="hidden" name="currentPage" value="${page.currentPage }">
	</form>
	<br>




</body>
</html>

