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
<script type="text/javascript">
	$(document).ready(function(){
		
		var actionForm = $("#actionForm");
		var a = ${page.range};
		var a = ${page.endPage};
		$(".page-item a").on("click",function(e){
			e.preventDefault();
			actionForm.find("input[name='currentPage']").val($(this).attr("href"));
			actionForm.submit();
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
								<button type="submit" id="writebtn" class="w3-button w3-theme-d2 w3-margin-bottom">글쓰기</button>
								<button type="submit" id="managementbtn" class="w3-button w3-theme-d2 w3-margin-bottom">관리</button>
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


				<c:forEach items="${list}" var="list">
					<div class="w3-container w3-card w3-white w3-round w3-margin">
						<br> <span class="w3-right w3-opacity"><c:out
								value="${list.regdate }" /></span>
						<h4>
							<a href="/blog/myblog/boardContent?bno=${list.bno }"><c:out value="${list.title }" ></c:out></a>
						</h4>
						<br>
						<hr class="w3-clear">
						<p>
							<c:out value="${list.content }" />
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
				<!-- End Middle Column -->
			</div>

		</div>

		<!-- End Grid -->
	</div>

	<!-- End Page Container -->
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${page.startPage > 1 }">
				<li class="page-item disabled"><a class="page-link" href="${page.prevPage }" tabindex="-1" aria-disabled="true">Previous</a></li>
			</c:if>
			<c:forEach begin="${page.startPage }" end="${page.endPage }" var="page">
				<li class="page-item"><a class="page-link" href="${page }"><c:out value="${page }"/></a></li>
			</c:forEach>
			<c:if test="${page.currentPage < page.range }">
			<li class="page-item"><a class="page-link" href="${page.nextPage }">Next</a></li>
			</c:if>
		</ul>
	</nav>
	
	<form action="/blog/myblog" method="get" id="actionForm">
		<input type="hidden" name="currentPage" value="${page.currentPage }" >
	</form>
	<br>
	



</body>
</html>

