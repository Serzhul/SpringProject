<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	${member}
	<li>마이페이지 홈
	</li>
	<li>책/구매
		<ul>
			<li><a href="<%=request.getContextPath()%>/mypage/mylibrary">내 책장</a></li>
			<li><a href="<%=request.getContextPath()%>/mypage/mycart">장바구니</a></li>
			<li><a href="<%=request.getContextPath()%>/mypage/mywish">위시리스트</a></li>
			<li><a href="#">이어보기</a></li>
		</ul>
	</li>
	
	
	<li>개인
		<ul>
			<li><a href="#">1:1 문의</a></li>
			<li><a href="#">내 리뷰 관리</a></li>
			<li><a href="#">정보 변경</a></li>
		</ul>
	</li>
	
	<div>		
		<li>내 계정 기본 정보 출력
		<ul>
			<li>아이디 : ${member.id}</li>
			<li>이메일 : ${member.email}</li>
		</ul>
	</li>
	</div>
</body>
</html>