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
<title>회원 정보 변경</title>
</head>
<body>

	<div class="container">
		<div class="page-header">
			<h1>
				비밀번호 변경 <small>Change Password</small>
			</h1>
			<form action="${pageContext.request.contextPath}/member/change_pw"
				method="post">
				<div class="col-md-6 col-md-offset-3" style="padding-top: 100px;">
					<div class="form-group">
						<label for="pw"></label> <input type="password" name="pw"
							placeholder="현재 암호를 입력하세요" class="form-control""> 
						<c:if test="${errors.curPwd}">현재 암호를 입력하세요</c:if>	
						<c:if test="${errors.badCurPwd}">현재 암호가 일치하지 않습니다.</c:if>
						<input type="hidden" name="id" value="${member.id}">
						<input type="password" name="newPw" placeholder="새암호를 입력하세요"
							class="form-control">
						<c:if test="${errors.newPwd }">새로운  암호를 입력하세요</c:if>
						<c:if test="${errors.wrongPw}">아이디와 비밀번호가 같을 수 없슈!</c:if>
					</div>

					<div class="form-group">
						<input type="submit" class="form-control" value="비밀번호 변경">
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