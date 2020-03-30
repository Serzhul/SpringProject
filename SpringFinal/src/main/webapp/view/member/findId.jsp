<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   	
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

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
</head>
<body>
	<!-- 
	<div class="subscribe section bg-dark py-4">
		<h3 class="section-title text-center text-white m-5">아이디 찾기</h3>
		<form class="form-inline d-table mb-5 mx-auto" action="/">
			<div class="form-group">
				<input type="text" class="form-control border-0 mr-3 mb-2 mr-sm-0 text-center" 
					placeholder="이메일 주소 입력">
			</div>
			<div class="form-group">		
				<input type="submit" class="form-control border-0 mr-3 mb-2 mr-sm-0 text-center" value="아이디 찾기">
			</div>
		</form>
		<p class="text-muted col-md-6 text-center mx-auto">이메일이 기억나지 않는다면
			고객센터로 문의해주세요! 1993-3012</p>
	</div> -->
	<!-- <div class="subscribe section bg-dark py-4"> -->
	<div class="container">
		<div class="page-header">
			<h1>
				아이디찾기<small>Find ID</small>
			</h1>
		</div>
		<form action="${pageContext.request.contextPath}/member/findId"
			method="POST">
			<div class="col-md-6 col-md-offset-3">
				<div class="form-group">
					<label for="InputEmail"></label> 
					<input type="text"	class="form-control" name="email" placeholder="이메일을 입력하세요" value="${param.email}">
						<c:if test="${errors.emailNotFound }">존재하지 않는 이메일입니다</c:if>
				     <input type="submit"
						class="form-control" value="아이디 찾기 ">
				</div>
			</div>
		</form>
	</div>
</body>
</html>