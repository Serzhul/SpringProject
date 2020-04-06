<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html lang="en">
<style type="text/css">
body {
  background: #17C66F;
  /* fallback for old browsers */
  background: -webkit-linear-gradient(to top, #17C66F, #17C66F);
  background: -moz-linear-gradient(to top, #17C66F, #17C66F);
  background: -o-linear-gradient(to top, #17C66F, #17C66F);
  background: linear-gradient(to top, #17C66F, #17C66F);
  background-size: cover;
  background-attachment: fixed;
  font-family: 'Roboto', sans-serif;
}

button[type="submit"]:hover {
    -webkit-transition: .5s all;
    -moz-transition: .5s all;
    -o-transition: .5s all;
    -ms-transition: .5s all;
    transition: .5s all;
    background: #8DC26F;
}
}
button[type="submit"]:hover {
    -webkit-transition: .5s all;
    -moz-transition: .5s all;
    -o-transition: .5s all;
    -ms-transition: .5s all;
    transition: .5s all;
    background: #17C66F;
}
button[type="submit"] {
    font-size: .9em;
    color: #fff;
    background: #17C66F;
    outline: none;
    border: 1px solid #76b852;
    cursor: pointer;
    -webkit-appearance: none;
    width: 100%;
    margin-top: 20px;
    letter-spacing: 4px;
}
</style>
<head>
	<title>Login V5</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/view/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/view/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/view/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/view/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/view/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/view/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/view/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/view/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/view/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/view/css/util.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/view/css/mainNew.css">
<!--===============================================================================================-->
<title>아이디 찾기</title>
</head>
<body>
<%--      	<div class="container">
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
	</div> --%>
		<div class="limiter">
		<div class="container-login100">
		
			<div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33">
				<form class="login100-form validate-form flex-sb flex-w" action="${pageContext.request.contextPath}/member/find_id" method="POST">
					<span class="login100-form-title p-b-53">
						아이디 찾기
					</span>
					<div class="p-t-31 p-b-9">
						<span class="txt1" >
							이메일을 입력하세요
						</span>
					</div>
					<input type="hidden" name="id" value="${member.id}">
					<div class="wrap-input100 validate-input" data-validate = "이메일을 입력해 주세요">
						<input class="input100" type="email"  name="email" id="email" value="${param.email}" required>
						<span class="focus-input100"></span>	
					</div>
						<c:if test="${errors.emailNotFound }">존재하지 않는 회원입니다</c:if>
					<div class="p-t-31 p-b-9">
						<span class="txt1" >
							아이디를 입력하세요
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "아이디를 입력해 주세요">
						<input type="text"	class="input100" id="id" name="id" value="${param.id}" required>
						<span class="focus-input100"></span>	
					</div>
					
					
					<div class="container-login100-form-btn m-t-17">
						<button class="login100-form-btn" type="submit">
							아이디 찾기
						</button>
						<button class="login100-form-btn" type="submit" onclick="history.go(-1);">
							뒤로가기
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>