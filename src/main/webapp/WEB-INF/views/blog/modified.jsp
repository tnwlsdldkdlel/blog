<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- JSTL사용하기 위한 태그 : 사용할 태그는 코어태그! -->
<!-- 태그는 대부분 'c'  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- JSTL사용하기 위한 태그 : 사용할 태그는 함수태그! -->
<!-- 태그는 대부분 'fn'  -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	$(document)
			.ready(
					function() {
						var actionForm = ("#actionForm");
						var modifiedForm = ("#modifiedForm");

						$("#listbtn").on("click", function(e) {
							actionForm.submit();
						});

						$("#modifiedbtn")
								.on(
										"click",
										function(e) {
											$("#tempDiv")
													.append(
															'<input type="hidden" name="bno" value="${content.bno}" />')
													.append(
															'<input type="hidden" name="page" value="${page}" />');
											modifiedForm.submit();
										});

					});
</script>
</head>
<body>
	<%@ include file="../includes/header.jsp"%>
	<script src="/resources/ckeditor/ckeditor.js"></script>
	<div class="container">
		<form action="/ITlog/myblog/content/modified" method="post"
			id="modifiedForm">
			<div class="form-group">
				<label for="exampleFormControlInput1">title</label> <input
					type="text" class="form-control" name="title"
					value='<c:out value="${content.title }"/>' />
			</div>

			<div class="form-group" id="tempDiv">
				<label for="exampleFormControlInput1">id</label> <input type="text"
					class="form-control" name="id" readonly="readonly"
					value='<c:out value="${content.id }"/>'
					placeholder='<sec:authentication property="principal.id"/>'>
			</div>


			<div class="form-group">
				<label for="exampleFormControlTextarea1">content</label>
				<textarea class="form-control" name="content" rows="3"><c:out
						value="${content.content }" /></textarea>
				<script>
					var ckeditor_config = {
						resize_enaleb : false,
						enterMode : CKEDITOR.ENTER_BR,
						shiftEnterMode : CKEDITOR.ENTER_P,
						filebrowserUploadUrl : "/admin/ckUpload"

					};

					CKEDITOR.replace("content", ckeditor_config);
				</script>
			</div>

			<button type="submit" id="modifiedbtn"
				class="w3-button w3-theme-d2 w3-margin-bottom">수정</button>
			<button type="button" id="listbtn"
				class="w3-button w3-theme-d2 w3-margin-bottom">목록</button>

		</form>
	</div>
	<!-- 액션폼 -->
	<form action="/ITlog/myblog/boardContent" id="actionForm">
		<input type="hidden" name="bno" value="${content.bno}" /> <input
			type="hidden" name="page" value="${page}" />
	</form>
	<!-- 액션폼 -->

</body>
</html>