<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <!-- 세션에서 token을 가져와서 출력한다. -->
    ${sessionScope.token}
     <a href="<%=request.getContextPath()%>/member/logout">로그아웃</a><br>
</body>
</html>