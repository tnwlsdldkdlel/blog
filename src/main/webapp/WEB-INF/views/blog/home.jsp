<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 태그는 대부분 'c'  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- JSTL사용하기 위한 태그 : 사용할 태그는 함수태그! -->
<!-- 태그는 대부분 'fn'  -->
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

	$(document).ready(function(){
		
		$(".page-item a").on("click",function(e){
				e.preventDefault();
				console.log('click');
				$("#actionForm").find("input[name='currentPage']").val($(this).attr("href"));
		});
	});
</script>
</head>
<body>


	<%@ include file="../includes/header.jsp"%>

	<!-- Main Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<c:forEach items="${list }" var="list">
					<div class="post-preview">
						<a href="post.html">
							<h2 class="post-title">
								<c:out value="${list.title }"></c:out>
							</h2>
							<h3 class="post-subtitle">
								<c:out value="${list.content }"></c:out>
							</h3>
						</a>
						<p class="post-meta">
							Posted by <a href="#"> <c:out value="${list.id }"></c:out></a>
							<fmt:formatDate value="${list.regdate }" pattern="yyyy-MM-dd" />
					</div>
					<hr>
				</c:forEach>
				
				<!-- Pager -->
				<nav aria-label="...">
					  <ul class="pagination justify-content-center">
					  
						<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a></li>
						
						
						<c:forEach begin="${page.startPage }" end="${page.endPage }" var="page">
						    <li class="page-item"><a class="page-link" href="${page }">${page }</a></li>
						</c:forEach>
						
						<li class="page-item"><a class="page-link" href="#">Next</a>
						</li>
					</ul>
				</nav>  
				
				<form action="/blog/home" id="actionForm" method="get">
					<input type="hidden" name="currentPage" value="${page.currentPage }"/>
				</form>

			</div>
		</div>
	</div>

	<%@ include file="../includes/footer.jsp"%>

</body>
</html>