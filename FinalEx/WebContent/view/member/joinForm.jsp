<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입하기</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/member/join" method="POST">
		<p>아이디</p>
		<input type="text" name="id" value="${param.id} "placeholder="ID를 입력하세요">
		<c:if test="${errors.id }">ID를 입력하세요</c:if>
		<c:if test="${errors.duplicateId }">이미 사용중인 아이디 입니다.</c:if>
		<br>
		<p>비밀번호</p>
		<input type="text" name="pw" value="${param.pw} "placeholder="비밀번호를 입력하세요">
			<c:if test="${errors.pw }">비밀번호를 입력하세요</c:if>
		<br>
		<input type="text" name="confirmPw" value="${param.confirmPw} "placeholder="비밀번호 확인">
		<c:if test="${errors.confirmpasswd }">확인을 입력하세요</c:if>
		<c:if test="${errors.notMatch}">암호가 일치하지 않습니다.</c:if>
		<p>이메일</p>
		<input type="text" name="email" value="${param.email} "placeholder="email을 입력하세요">
		<c:if test="${errors.email }">이메일을 입력하세요</c:if>
		<br>
		<p>이름</p>
		<input type="text" name="name" value="${param.name} "placeholder="이름을 입력하세요">
		<c:if test="${errors.name }">이름을 입력하세요</c:if>
		<br>
		<p>생년월일</p>
		<input type="date" name="birth" value="${param.birth}">
		<br>
		<p>성별</p>
		  <input type="radio" class=""
		required="" autocomplete="off" name="gender" value="1"
		checked="checked"> 남자 <input type="radio" class=""
		required="" autocomplete="off" name="gender" value="2">여자
		 <c:if test="${errors.gender}">성별을 입력하세요</c:if> 
		<input type="submit" value="가입"> 
	</form>
	
</body>
</html>