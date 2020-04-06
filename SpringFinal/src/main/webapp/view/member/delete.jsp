<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="description"
	content="A free and modern UI toolkit for web makers based on the popular Bootstrap 4 framework.">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/shards.min.css?v=3.0.0">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/shards-demo.min.css?v=3.0.0">
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css"
	media="screen" title="no title" charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴</title>
</head>
<body>

	<div class="container">
		<div class="page-header">
			<h1>
				회원 탈퇴 <small>Leave</small>
			</h1>
			<form action="${pageContext.request.contextPath}/member/delete"
				method="post">
				<div class="col-md-6 col-md-offset-3" style="padding-top: 100px;">
					<div class="form-group">
						<label for="InputEmail"></label> <input type="password"
							class="form-control" name="pw" id="pw" value="${member.pw}"
							placeholder="암호를 입력하세요">
						<div>
							<c:if test="${errors.wrongPw}">잘못된 비밀번호 입니다</c:if>
							<%-- <c:if test="${errors.null}">입력하슈!</c:if>  --%>
						</div>
						<input type="hidden" name="id" value="${member.id}">
					</div>
					<div class="form-group">
						<input type="submit" class="form-control" value="회원 탈퇴하기">
					</div>
					<div>
						<button type="button" onclick="history.go(-1);"
							class="form-control">뒤로가기</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>