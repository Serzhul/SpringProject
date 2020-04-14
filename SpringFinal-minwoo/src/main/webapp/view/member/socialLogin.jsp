<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
</head>
<title>아이디 찾기</title>
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
		
			<div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33">
				<form>
					<span class="login100-form-title p-b-53">
						네이버로 소셜 로그인이 완료되었습니다.
					</span>
						<div class="container-login100-form-btn m-t-17">
						<button class="login100-form-btn" type="button" id="mainBtn">
							메인 페이지로
						</button>
						</div>
				</form>
			</div>
		</div>
	</div>
	<meta http-equiv="Refresh" content="1; url=${pageContext.request.contextPath}/member/main">
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>
	$(function() {
		$("#mainBtn").click(function() {
			location.href = '${pageContext.request.contextPath}/main/index';
		})
	})
</script>
</html>
