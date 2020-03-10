<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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