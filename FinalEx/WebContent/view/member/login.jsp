<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>
</head>
<body>
	<p>로그인 페이지</p>
	<div>
		<form action="${pageContext.request.contextPath}/member/login"
			method="POST">
			<c:if test="${errors.idOrPwNotMatch }">
			아이디와 암호가 일치하지 않습니다.
			</c:if>
			 아이디: <input type="text" name="id" value="${param.id}" placeholder="아이디를 입력하세요">
			<c:if test="${errors.id }">ID를 입력하세요</c:if> 
				<br>
			비밀번호: <input type="password" name="pw" value="${param.pw}" placeholder="비밀번호를 입력하세요">
			<c:if test="${errors.pw}">암호를 입력하세요</c:if> 
				<br>
					<input type="submit" value="로그인">
				<br>
				<a href="${pageContext.request.contextPath}/member/join">[회원가입하기]</a>
				<a href="${pageContext.request.contextPath}/member/main">[메인으로]</a>
				<a href="${pageContext.request.contextPath}/member/findId">아이디
					찾기</a>
				<br>
				<a href="${pageContext.request.contextPath}/member/findpw">비밀번호
					찾기</a>
		</form>
	</div>


</body>
</html>