
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>메인 화면</title>
  <meta name="description" content="A free and modern UI toolkit for web makers based on the popular Bootstrap 4 framework.">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="css/shards.min.css?v=3.0.0">
  <link rel="stylesheet" href="css/shards-demo.min.css?v=3.0.0">
<title>Insert title here</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/member/login">로그인하러가기</a>
	<br>
	<a href="${pageContext.request.contextPath}/member/join">회원가입하러가기</a>
	<br>
	<a href="${pageContext.request.contextPath}/member/logout">로그아웃하기</a>
	<br>
	<a href="${pageContext.request.contextPath}/member/changePw">비밀번호 바꾸기</a>
	<br>
	<a href="${pageContext.request.contextPath}/member/delete">회원 탈퇴하기</a>
	<c:if test="${auth.id != null }">
	<br>
	안녕하세요 ${auth.id} 님
	<br>
	이름 ${auth.name} 님
	<br>
	관리자 권한 ${auth.auth} 님 
	</c:if>
</body>
</html>