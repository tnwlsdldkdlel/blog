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

				//게시글 작성
				$("#writeBtn").on("click", function(e) {
					e.preventDefault();
					location.href = "/ITlog/myblog/write"
				});

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
							<div class="w3-center">
								<form action="/logoutCheck" method="post" id="logoutForm">
									<button type="submit" id="logout"
										class="w3-button btn-secondary rounded-pill w3-center">logout</button>
									<button type="button" id="writeBtn"
										class="w3-button btn-secondary rounded-pill w3-center">글쓰기</button>
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</form>
							</div>
						</div>
					</div>
				</div>





				<!-- End Left Column -->
			</div>

			<!-- Middle Column -->
			<div class="w3-col m7">
				<div>전체 ${page.totalConunt }개의 글</div>
				<c:forEach items="${list}" var="list">
					<c:forEach items="${list.member}" var="member">
					<div class="w3-white w3-margin " id="listDiv">
						<br>
						<h4 class="w3-margin">
							<b><a
								href="/ITlog/blog/${list.id}/boardContent?page=${page.currentPage }&bno=${list.bno }"><c:out
									value="${list.title }"></c:out></a></b>
						</h4>
						<div class="Blogintroduce w3-margin">
						
							<img alt="프로필이미지" src="/upload/${member.profileImage}"
								class="rounded-circle" style="max-height: 30px"/><a
								href="/ITlog/blog/${list.id }"><c:out value="${list.id }" /></a>
							<div class="w3-right">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${list.regdate }" />
							</div>
						</div>

						<p class=" w3-margin">${list.content }</p>
						<div class="w3-row-padding w3-margin" style="margin: 0 -16px">

						</div>
						<div class="button  w3-margin">
							<button type="button" class="w3-button w3-margin-bottom"
								onclick='like("${list.bno}")'>
								<i class="far fa-thumbs-up" style="font-size: 3em;"></i> 좋아요<span
									class="badge badge-light">${list.postlike }</span>
							</button>

							<i class="far fa-comments" style="font-size: 3em;"></i> 댓글<span
								class="badge badge-light">${list.replycount }</span>

						</div>
					</div>
					<br />
					<br />
					<br />
					</c:forEach>
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

	<form action="/ITlog/blog" method="get" id="actionForm">
		<input type="hidden" name="currentPage" value="${page.currentPage }">
	</form>

	<div class="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>Modal body text goes here.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>





</body>
</html>

