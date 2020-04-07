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
button[type="button"] {
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
<title>회원 정보 변경</title>
</head>
<body>

			<div class="limiter">
		<div class="container-login100">
		
			<div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33">
				<form class="login100-form validate-form flex-sb flex-w" action="${pageContext.request.contextPath}/member/change_pw"	method="post"  autocomplete=”off”>
					<span class="login100-form-title p-b-53">
						비밀번호 변경
					</span>
					<div class="p-t-31 p-b-9">
						<span class="txt1" >
							현재 비밀번호
						</span>
					</div>
					<input type="hidden" name="id" value="${member.id}">
					<div class="wrap-input100 validate-input" data-validate = "현재 비밀번호를 입력해 주세요">
						<input class="input100" type="password" name="pw">
						<span class="focus-input100"></span>	
					</div>
					<c:if test="${errors.curPwd}">현재 암호를 입력하세요</c:if>	
					<c:if test="${errors.badCurPwd}">현재 암호가 일치하지 않습니다.</c:if>
					<div class="p-t-13 p-b-9">
						<span class="txt1">
							새 비밀번호
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "새 비밀번호를 입력하세요 ">
						<input class="input100" type="password"  name="newPw" >
						<span class="focus-input100"></span>
					</div>
					<c:if test="${errors.newPwd }">새로운  암호를 입력하세요</c:if>
					<c:if test="${errors.wrongPw}">아이디와 비밀번호가 같을 수 없슈!</c:if>
					<div class="container-login100-form-btn m-t-17">
						<button class="login100-form-btn" type="submit">
							비밀번호 변경하기
						</button>
						<button class="login100-form-btn" type="button" onclick="history.go(-1);">
							뒤로가기
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/view/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/view/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/view/vendor/bootstrap/js/popper.js"></script>
	<script src="<%=request.getContextPath()%>/view/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/view/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/view/vendor/daterangepicker/moment.min.js"></script>
	<script src="<%=request.getContextPath()%>/view/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/view/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/view/js/main.js"></script>

</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
// 로그인
	$(function() {
		$("#loginBtn").click(function() {
			location.href = '${pageContext.request.contextPath}/member/login';
		})
	})
// 회원가입
		$(function() {
		$("#joinBtn").click(function() {
			location.href = '${pageContext.request.contextPath}/member/join';
		})
	})

	$(function() {
		$("#find_id_btn")
				.click(
						function() {
							location.href = "${pageContext.request.contextPath}/member/find_id_form";
						})
	})
	$(function() {
		$("#find_pw_btn")
				.click(
						function() {
							location.href = "${pageContext.request.contextPath}/member/find_pw_form";
						})
	})
</script>
</html>
</html>