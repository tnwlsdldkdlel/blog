<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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
				var loginForm = $("#loginForm");
				var id = "";
				var password ="";

				$("#joinBtn").on("click", function(e) {
					e.preventDefault();
					location.href = "/ITlog/join";
				});
				
				nullCheck = function(){
					id = $("input[name='id']").val();
					password = $("input[name='password']").val();
					if(id == "" || password == ""){
						alert("아이디 혹은 비밀번호를 입력해주세요");
						return false;
					}
					
					loginForm.submit();
					
					
				}
				
				move = function(id, bno) {
					location.href = "/ITlog/blog/boardContent?id=" + id
							+ "&bno=" + bno;
				}
				QANDAmove = function(bno) {
					location.href = "/ITlog/Q&A/content?currentPage=1&bno=" + bno;
				}
				Communitymove = function(bno) {
					location.href = "/ITlog/community/content?currentPage=1&bno=" + bno;
				}
				
				//관리 페이지로 이동
				$("#managementbtn").on("click", function(e) {
					e.preventDefault();
					location.href = "/ITlog/myblog/myinfoManagement";
				});
				
				
				
				
			});
</script>
<body>

	<%@include file="../includes/header.jsp"%>
	<c:if test="${join ne null }">
		<script type="text/javascript">
			alert("회원가입을 축하합니다!");
		</script>
	</c:if>
	<!-- Page Conainer -->
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
							<c:if test="${error ne null}">
								<script type="text/javascript">
										alert("아이디 혹은 비밀번호가 틀렸습니다");
									</script>

							</c:if>
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

								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> <br />
								<div class="w3-center">
									<button type="button" id="loginBtn"
										class="w3-button  btn-secondary rounded-pill w3-margin-bottom"
										onclick="nullCheck();">login</button>
									<button type="button" id="joinBtn"
										class="w3-button  btn-secondary rounded-pill w3-margin-bottom">Join</button>
								</div>
							</form>


						</sec:authorize>
						<br />
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
											class="w3-button btn-secondary rounded-pill  w3-center">logout</button>
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />
										<button type="submit" id="managementbtn"
											class="w3-button btn-secondary rounded-pill  w3-center">정보변경</button>
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />
									</div>
								</div>
							</form>
						</sec:authorize>
						<br />
					</div>
				</div>

				<!-- End Left Column -->
			</div>

			<!-- bestPost -->

			<div class="w3-col m7 mr-3 container">

				<h1>
					Best Blog Post <i class="fas fa-crown"></i>
				</h1>
				<div class="w3-right">
					<a href="/ITlog/blog"><i class="fas fa-running"></i> 블로그 보러가기</a>
				</div>
				<br />

				<ul class="list-group list-group-flush">
					<c:forEach var="bestPostList" items="${bestPostList}">
						<li class="list-group-item">
							<div class="d-flex justify-content-between">
								<div class="p-2 bd-highlight">
									<a href="#"
										onclick="move('<c:out value='${bestPostList.id}'/>','<c:out value='${bestPostList.bno}'/>')">
										<c:out value="${bestPostList.title}" />
									</a>
								</div>
								<div class="p-2 bd-highlight">
									작성자 :
									<c:out value="${bestPostList.id}" />
									| 좋아요 :
									<c:out value="${bestPostList.postlike}" />
									| 작성일 :
									<fmt:formatDate pattern="yyyy-MM-dd"
										value="${bestPostList.regdate}" />

								</div>
							</div>
						</li>

					</c:forEach>
				</ul>
				<br />
				<!-- new Post -->

				<h1>New Blog Post</h1>
				<div class="w3-right">
					<a href="/ITlog/blog"><i class="fas fa-running"></i> 블로그 보러가기</a>
				</div>
				<br />
				<ul class="list-group list-group-flush">
					<c:forEach var="newPostList" items="${newPostList}" begin="0"
						end="4">
						<li class="list-group-item">
							<div class="d-flex justify-content-between">
								<div class="p-2 bd-highlight">
									<a href="#"
										onclick="move('<c:out value='${newPostList.id}'/>','<c:out value='${newPostList.bno}'/>')"><c:out
											value="${newPostList.title}" /></a>
								</div>
								<div class="p-2 bd-highlight">
									작성자 :
									<c:out value="${newPostList.id}" />
									| 좋아요 :
									<c:out value="${newPostList.postlike}" />
									| 작성일 :
									<fmt:formatDate pattern="yyyy-MM-dd"
										value="${newPostList.regdate}" />
								</div>
							</div>
						</li>

					</c:forEach>
				</ul>

				<!-- new Post -->
				<br />
				<!-- Q&A -->

				<h1>
					Q&A <i class="fas fa-search"></i>
				</h1>
				<div class="w3-right">
					<a href="/ITlog/Q&A"><i class="fas fa-running"></i> Q&A 보러가기</a>
				</div>
				<br />
				<ul class="list-group list-group-flush">
					<c:forEach var="qandalist" items="${qandalist}" begin="0" end="4">
						<li class="list-group-item">
							<div class="d-flex justify-content-between">
								<div class="p-2 bd-highlight">
									<a href="#"
										onclick="QANDAmove('<c:out value='${qandalist.bno}'/>')">
										<c:out value="${qandalist.title}" />
									</a>
								</div>
								<div class="p-2 bd-highlight">
									작성자 :
									<c:out value="${qandalist.id}" />
									| 작성일 :
									<fmt:formatDate pattern="yyyy-MM-dd"
										value="${qandalist.regdate}" />

								</div>
							</div>
						</li>

					</c:forEach>
				</ul>

				<!-- Q&A -->
				<br />
				<!-- community  -->

				<h1>
					Community <i class="far fa-comments"></i>
				</h1>
				<div class="w3-right">
					<a href="/ITlog/community"><i class="fas fa-running"></i>
						Community 보러가기</a>
				</div>
				<br />
				<ul class="list-group list-group-flush">
					<c:forEach var="commlist" items="${commlist}" begin="0" end="4">
						<li class="list-group-item">
							<div class="d-flex justify-content-between">
								<div class="p-2 bd-highlight">
									<a href="#"
										onclick="Communitymove('<c:out value='${commlist.bno}'/>')"><c:out
											value="${commlist.title}" /></a>
								</div>
								<div class="p-2 bd-highlight">
									작성자 :
									<c:out value="${commlist.id}" />
									| 작성일 :
									<fmt:formatDate pattern="yyyy-MM-dd"
										value="${commlist.regdate}" />

								</div>
							</div>
						</li>

					</c:forEach>
				</ul>
			</div>

		</div>


	</div>

	<%@include file="../includes/footer.jsp"%>

</body>
</html>


