<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
     	<div class="container">
		<div class="page-header">
			<h1>
				비밀번호 찾기<small>Find ID</small>
			</h1>
		</div>
		<form action="${pageContext.request.contextPath}/member/find_pw"
			method="POST">
			<div class="col-md-6 col-md-offset-3">
				<div class="form-group">
					<label for="InputEmail"></label> <input type="text"
						class="form-control" id="id" placeholder="아이디를 입력하세요" name="id" value="${param.id}">
					<label for="InputEmail"></label> <input type="text"
						class="form-control" id="email" placeholder="이메일을 입력하세요" name="email" value="${param.email}">
				
				     <input type="submit"
						class="form-control" id="email" value="아이디 찾기 ">
				</div>
			</div>
		</form>
	</div>
</body>
</html>