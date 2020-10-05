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
<script type="text/javascript" id="etc">
	$(document)
			.ready(
					function() {

						var actionForm = $("#actionForm");
						var commentsDiv = $("#commentsDiv");
						var content = $("#content");
						//게시글 작성자 아이디
						var id = $("#id").val();
						//로그인 아이디
						var loginID = $("#loginID").val();
						var bno = actionForm.find("input[id='bno']").val();
						var replyList = $(".list-group");
						var str = "";
						var currentPage = 1;
						var replyPageFooter = $(".pagination");
						var value;

						nullCheck = function() {
							id = $("input[name='id']").val();
							password = $("input[name='password']").val();
							if (id == "" || password == "") {
								alert("아이디 혹은 비밀번호를 입력해주세요");
							} else {
								loginForm.submit();
							}

						}

						$("#commentsDiv").hide();

						//댓글버튼
						$("#commentBtn").on("click", function(e) {
							if (loginID == null) {
								alert("로그인 후 이용 가능합니다.");
							} else {
								$("#commentsDiv").toggle();
								list(currentPage);
							}

						});

						//댓글목록
						function list(currentPage) {

							//ajax호출
							$
									.getJSON(
											"/reply/QANDAlist/" + currentPage
													+ "/" + bno + ".json",
											function(result) {

												var replyCnt = result.relyCount;
												var list = result.list;
												if (result == null
														|| result.length == 0) {
													replyList.html("");
													return;
												}

												var str = "";
												console.log(id);
												for (var i = 0; i < result.list.length; i++) {
													//게시글 작성자가 아닐경우
													if (id != loginID) {
														//댓글작성자가 로그인 상태인 경우 -> 수정, 삭제 가능
														if (list[i].id == loginID) {

															str += "<li class='list-group-item' id='rid-" + list[i].rno + "'></br>"
																	+ "<a class='btn  dropdown-toggle w3-right' href='#'"
																+"role='button' id='dropdownMenuLink' data-toggle='dropdown'"
																+"aria-haspopup='true' aria-expanded='false'> </a>"
															+list[i].id
															+ "<div class='w3-right' id='nolikeDiv'>";
															
															if (list[i].selection != null) {
																str+= "<i class='fas fa-check-circle' style='font-size: 3em;'></i>";
															}

															
															
															
																	str += "<a href='#' id='testA' class='note-vote-btn note-select-btn note-deselected'>"
																	+ "</a>"
																	+ "</div>"
																	+ "<div class='dropdown-menu' aria-labelledby='dropdownMenuLink'>"
																	+ "<a class='dropdown-item' onclick=' replyModify("
																	+ list[i].rno
																	+ ", \""
																	+ list[i].id
																	+ "\", \""
																	+ list[i].content
																	+ "\" ) '>수정</a>"
																	+ "<a class='dropdown-item'  onclick='replyRemove("
																	+ list[i].rno
																	+ ", \""
																	+ list[i].id
																	+ "\" );'>삭제</a></div></div><br />";
															str += "<p>"
																	+ list[i].content
																	+ "</p>";
															str += "<span class='w3-left w3-opacity'>"
																	+ displayTime(list[i].regdate)

																	+ "</span></li>";

															//댓글작성자가 로그인 상태가 아닐 경우 -> 수정, 삭제 불가능
														} else if (list[i].id != loginID) {

															str += "<li class='list-group-item' id='rid-" + list[i].rno + "'></br>"
																+ list[i].id
															+"<div class='w3-right'>";
															
															if (list[i].selection != null) {
																str +=  "<i class='fas fa-check-circle'style='font-size: 3em;'></i>";
															}

															
															str += "</div><br />";
															str += "<p>"
																	+ list[i].content
																	+ "</p>";
															str += "<span class='w3-left w3-opacity'>"
																	+ displayTime(list[i].regdate)
																	+ "</span></li>";
														}

														//게시글 작성자
													} else if (id == loginID) {
														if (list[i].selection == null) {
															str += "<li class='list-group-item' id='rid-" + list[i].rno + "'></br>"
																	+ "<a class='btn  dropdown-toggle w3-right' href='#'"
														+"role='button' id='dropdownMenuLink' data-toggle='dropdown'"
														+"aria-haspopup='true' aria-expanded='false'> </a>"
																	+ list[i].id
																	+ "<div class='w3-right' id='nolikeDiv'>"
																	+ "<button type='button' class='w3-button w3-margin-bottom'onclick='replyevent("
																	+ list[i].rno
																	+ ");' id='selectionBtn'>"
																	+ "<i class='far fa-check-circle' style='font-size: 3em;'></i>"
																	+ "</button>"

																	+ "<a href='#' class='note-vote-btn note-select-btn note-deselected'>"
																	+ "</a>"
																	+ "</div>"
																	+ "<div class='dropdown-menu' aria-labelledby='dropdownMenuLink'>"
																	+ "<a class='dropdown-item'  onclick='replyRemove("
																	+ list[i].rno
																	+ ", \""
																	+ list[i].id
																	+ "\" );'>삭제</a></div></div><br />";
															str += "<p>"
																	+ list[i].content
																	+ "</p>";
															str += "<span class='w3-left w3-opacity'>"
																	+ displayTime(list[i].regdate)

																	+ "</span></li>";
														} else {

															str += "<li class='list-group-item' id='rid-" + list[i].rno + "'></br>"
																	+ "<a class='btn  dropdown-toggle w3-right' href='#'"
															+"role='button' id='dropdownMenuLink' data-toggle='dropdown'"
															+"aria-haspopup='true' aria-expanded='false'> </a>"
																	+ list[i].id
																	+ "<div class='w3-right' id='nolikeDiv'>"
																	+ "<button type='button' class='w3-button w3-margin-bottom' onclick='replyevent("
																	+ list[i].rno
																	+ ");' id='selectionBtn'>"
																	+ "<i class='fas fa-check-circle' style='font-size: 3em;'></i>"
																	+ "</button>"

																	+ "<a href='#' id='testA' class='note-vote-btn note-select-btn note-deselected'>"
																	+ "</a>"
																	+ "</div>"
																	+ "<div class='dropdown-menu' aria-labelledby='dropdownMenuLink'>"
																	+ "<a class='dropdown-item'  onclick='replyRemove("
																	+ list[i].rno
																	+ ", \""
																	+ list[i].id
																	+ "\" );'>삭제</a></div></div><br />";
															str += "<p>"
																	+ list[i].content
																	+ "</p>";
															str += "<span class='w3-left w3-opacity'>"
																	+ displayTime(list[i].regdate)

																	+ "</span></li>";

														}
													}

												}

												replyList.html(str);
												showReplyPage(replyCnt);

											});
						}
						;

						function showReplyPage(replyCnt) {

							var nextPage = currentPage + 1;
							var prevPage = currentPage - 1;
							var range = Math.ceil(currentPage / 10.0) * 10;
							var endPage = Math.ceil(replyCnt / 10.0);
							var startPage = this.range - 9;

							//전체페이지가 범위보다 큰 경우 딱 10페이지만 보여주게
							if (endPage > range) {
								endPage = range;
							}

							//작은 경우 실제 끝페이지 보여주게
							if (endPage < range) {
								range = endPage;
								startPage = 1;
							}

							var str = "";
							if (startPage > 1) {
								str += " <li class='page-item'><a class='page-link' href='"
										+ prevPage
										+ "'>Previous</a></li>";
							}

							for (var i = startPage; i <= endPage; i++) {
								var active = currentPage == i ? "active" : "";
								str += "<li class='page-item "+active+" '><a class='page-link' href="+i+">"
										+ i + "</a></li>";
							}

							if (currentPage < range) {
								str += "<li class='page-item'><a class='page-link' href="
										+ nextPage + ">Next</a></li>";
							}

							str += "</ul></nav>";

							//아무것도 없는 replyPageFooter에 html추가
							replyPageFooter.html(str);
							console.log(str);
						}

						//페이지 번호를 클릭했을 때 새로운 댓글 가져오기
						//중요한건 그냥 클릭한 경우가 아닌 li의 a태그를 클릭했을 경우!
						replyPageFooter.on("click", "li a", function(e) {
							//기존의 a태그의 경로 막고
							e.preventDefault();
							console.log("page click");
							//a의 태그의 번호를 변수에 저장
							var targetCurrentPage = $(this).attr("href");

							currentPage = targetCurrentPage;

							list(currentPage);

							console.log(currentPage);
							console.log(bno);
							replyList.html("");

						});

						//댓글쓰기
						$("#replyWriteBtn").on("click", function(e) {
							var reply = {
								id : loginID,
								bno : bno,
								content : content.val()
							};

							console.log(id);
							console.log(bno);
							console.log(content.val());

							//ajax호출
							$.ajax({
								type : 'post',
								url : '/reply/QANDAwrite',
								data : JSON.stringify(reply),
								contentType : "application/json;charset=UTF-8",
								success : function(result) {
									if (result == "success") {
										alert("댓글이 등록 되었습니다");
										list(currentPage);

									}
								},
								error : function(xhr, status, err) {
									if (error) {
										alert("댓글이 등록 실패했습니다");
									}
								}

							});

							content.val("");

						});

						//댓글삭제
						replyRemove = function(rno, replyID) {

							//ajax호출
							$.ajax({
								type : 'delete',
								url : '/reply/QANDAremove/' + rno,
								success : function(result) {
									console.log(result);
									if (result == "success") {
										alert("댓글을 삭제했습니다");
										replyList.html("");
										list(currentPage);
									}
								}

							});

						}

						//댓글수정
						replyModify = function(rno, id, content) {

							console.log("수정");
							var html = "";
							html += "<li class='list-group-item' id='rid-" +rno + "'><br>"
									+ id
									+ "<br />"
									+ "<div class='form-group'>"
									+ "<textarea class='form-control' id='replyModifyCotent' name='replyModifyCotent' rows='3'>"
									+ content
									+ "</textarea>"

									+ "</div>"
									+ "<div class='w3-right' style='margin: 0 -16px'>"
									+ "<button class='btn btn-outline-secondary btn-margin-bottom' id='replyModifyBtn' type='button'>수정</button>"
									+ "<button class='btn btn-outline-secondary btn-margin-bottom' id='replybackBtn' type='button'>취소</button>"
									+ "</div>" + "</div>" + "</li>";
							$('#rid-' + rno).replaceWith(html);

							$("#replybackBtn").on("click", function(e) {
								replyList.html("");
								list(currentPage);
							});

							$("#replyModifyBtn")
									.on(
											"click",
											function(e) {
												var replyModify = {
													rno : rno,
													content : $(
															"#replyModifyCotent")
															.val()
												};
												//ajax호출
												$
														.ajax({
															type : 'PATCH',
															url : '/reply/QANDAmodify/'
																	+ rno,
															data : JSON
																	.stringify(replyModify),
															contentType : "application/json;charset=UTF-8",
															success : function(
																	result) {
																if (result == "success") {
																	alert("댓글을 수정 했습니다");
																	list(currentPage);
																}
															},
															error : function(
																	xhr,
																	status, err) {
																if (error) {
																	alert("댓글 수정이 실패 했습니다");
																	list(currentPage);
																}
															}

														});

											});

						}

						displayTime = function(timeValue) {
							var today = new Date();
							var gap = today.getTime() - timeValue;

							var dataObj = new Date(timeValue);
							var str = "";

							if (gap < (1000 * 60 * 60 * 24)) {
								var hh = dataObj.getHours();
								var mi = dataObj.getMinutes();
								var ss = dataObj.getSeconds();

								return [ (hh > 9 ? '' : '0') + hh, ':',
										(mi > 9 ? '' : '0') + mi, ':',
										(ss > 9 ? '' : '0') + ss ].join('');
							} else {
								var yy = dataObj.getFullYear();
								var mm = dataObj.getMonth() + 1;
								var dd = dataObj.getDate();

								return [ yy, '/', (mm > 9 ? '' : '0') + mm,
										'/', (dd > 9 ? '' : '0') + dd ]
										.join('');
							}
						}

						//취소버튼
						$("#backBtn").on("click", function(e) {
							list(currentPage);
						});

						//수정페이지 이동
						$("#modifiedContent").on(
								"click",
								function(e) {
									e.preventDefault();
									actionForm.attr("action",
											"/ITlog/Q&A/content/modified");
									actionForm.submit();
								});

						//글 내용 삭제
						$("#removeContent").on( "click", function(e) {
							
									actionForm.attr("action",
											"/ITlog/Q&A/content/remove");
									actionForm.submit();
								});

						//회원가입
						$("#joinBtn").on("click", function(e) {
							e.preventDefault();
							location.href = "/ITlog/join";
						});

						//글쓰기
						$("#writeBtn").on("click", function(e) {
							e.preventDefault();
							location.href = "/ITlog/Q&A/write"
						});

						//댓글 좋아요
						replyevent = function(rno) {
							console.log(rno);
							$.ajax({
								type : 'post',
								url : '/reply/replylike/' + rno,
								success : function(result) {
									if (result == "success") {
										alert("댓글을 채택했습니다!");
										list(currentPage);

									}

								}
							});
						}

					});
</script>
<style>
html, body, h1, h2, h3, h4, h5 {
	font-family: "Open Sans", sans-serif
}
</style>
<body>

	<%@include file="../includes/header.jsp"%>
	<script src="/resources/ckeditor/ckeditor.js"></script>

	<!-- Page Container -->
	<div class="w3-container w3-content"
		style="max-width: 1400px; margin-top: 80px">
		<!-- The Grid -->
		<div class="w3-row">
			<!-- Left Column -->
			<div class="w3-col m3">
				<!-- Profile -->
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
						<c:if test="${error ne null}">
							<script type="text/javascript">
								alert("아이디 혹은 비밀번호가 틀렸습니다");
							</script>

						</c:if>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" /> <br />
						<div class="w3-center">
							<button type="button" id="loginBtn"
								class="w3-button btn-secondary rounded-pill w3-margin-bottom"
								onclick="nullCheck();">login</button>
							<button type="button" id="joinBtn"
								class="w3-button btn-secondary rounded-pill w3-margin-bottom">Join</button>
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
								<input type="hidden" id="loginID" value="${user.id }" /> )
							</p>
							<p class="w3-center">
								<c:out value="${user.blog_itroduction }" />
							</p>
							<hr>
							<div class="w3-center">
								<button type="submit" id="logout"
									class="w3-button btn-secondary rounded-pill w3-center">logout</button>
								<button type="submit" id="writeBtn"
									class="w3-button btn-secondary rounded-pill w3-center">글쓰기</button>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</div>
						</div>
					</form>
				</sec:authorize>
				<br>
				<!-- End Left Column -->
			</div>

			<div class="w3-col m7">

				<div class="w3-container w3-margin">
					<br>
					<h4>
						<c:out value="${content.title }"></c:out>
					</h4>
					<div class="w3-left">
						<c:out value="${content.regdate }" />

						<img alt="프로필이미지"
							src="/upload/<c:out value='${writer.profileImage}' />"
							class="rounded-circle" style="max-height: 30px">
						<c:out value="${writer.id}" />
						<input type="hidden" id="id" name="id"
							value="<c:out value='${writer.id}' />" />
					</div>
					<c:if test="${user.id eq writer.id }">
						<div class="dropdown">
							<a class="btn dropdown-toggle w3-right" href="#" role="button"
								id="dropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> </a>

							<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">

								<a class="dropdown-item" id="modifiedContent" href="#">수정</a> <a
									class="dropdown-item" id="removeContent">삭제</a>

							</div>
						</div>
					</c:if>
					<br>
					<hr class="w3-clear">
					<p>
						${content.content }
						<script type="text/javascript">
							var ckeditor_config = {
								resize_enaleb : false,
								enterMode : CKEDITOR.ENTER_BR,
								shiftEnterMode : CKEDITOR.ENTER_P,
								filebrowserUploadUrl : "/admin/ckUpload"

							};
							CKEDITOR.replace("content", ckeditor_config);
						</script>
					</p>
					<div class="w3-row-padding" style="margin: 0 -16px">
						<div class="w3-half"></div>
						<div class="w3-half"></div>
					</div>
					<button type="button" class="w3-button w3-margin-bottom"
						id="commentBtn">
						<i class="far fa-comments" style="font-size: 3em;"></i> 댓글<span
							class="badge badge-light">${content.reply }</span>
					</button>

				</div>


				<!-- 댓글  -->
				<div class="w3-container" id="commentsDiv">
					<c:if test="${user.id ne null }">
						<div class="w3-container w3-white w3-margin" id="inputComment">
							<br />
							<div class="input-group mb-3">
								<input type="text" class="form-control" id="content"
									name="content" placeholder="댓글을 입력해주세요">
								<div class="input-group-append">
									<button class="btn btn-secondary" id="replyWriteBtn"
										type="submit">등록</button>
								</div>
							</div>
						</div>
					</c:if>
					<!-- 댓글리스트  -->
					<div class="w3-container w3-whitew3-margin">
						<ul class="list-group list-group-flush">
						</ul>
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">

							</ul>
						</nav>

					</div>


				</div>
				<!-- 댓글리스트  -->

				<div class=w3-center>
					<button type="button" id="listbtn"
						class="w3-button btn-secondary rounded-pill w3-margin-bottom"
						onclick="history.go(-1)">목록</button>
				</div>
				<!-- End Middle Column -->
			</div>

		</div>

		<!-- End Grid -->
	</div>

	<!-- 액션폼 -->
	<form action="/blog/myblog" method="get" id="actionForm">
		<input type="hidden" id="bno" name="bno" value="${content.bno }" /> <input
			type="hidden" id="currentPage" name="currentPage" value="${page}" />
	</form>
	<!-- 액션폼 -->







</body>
</html>

