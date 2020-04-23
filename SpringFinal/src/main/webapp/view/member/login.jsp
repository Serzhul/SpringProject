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
	background: #17C66F;
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
<title>로그인 페이지</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/view/css/util.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/view/css/mainNew.css">
<!--===============================================================================================-->
</head>
<body>

	<div class="limiter">
		<div class="container-login100">

			<div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33">
				<form class="login100-form validate-form flex-sb flex-w"
					autocomplete="off" name="login" onsubmit="loginPost();">
					<span class="login100-form-title p-b-53"> 로그인 페이지 </span>

					<div class="p-t-31 p-b-9">
						<span class="txt1"> 아이디 </span> <a href="#" class="txt2 bo1 m-l-5"
							id="find_id_btn"> 아이디를 잊으셨나요? </a>
					</div>
					<div class="wrap-input100 validate-input"
						data-validate="아이디를 입력해주세요">
						<c:if test="${errors.badEmail }">이미 가입한 이메일이 있습니다.</c:if>
						<input class="input100" type="text" id="id" name="id"
							value="${param.id}" required> <span class="focus-input100"></span>
					</div>
					<c:if test="${errors.idOrPwNotMatch }">	아이디나 암호가 일치하지 않습니다.</c:if>

					<div class="p-t-13 p-b-9">
						<span class="txt1"> 비밀번호 </span> <a href="#"
							class="txt2 bo1 m-l-5" id="find_pw_btn"> 비밀번호를 잊으셨나요? </a>
					</div>
					<div class="wrap-input100 validate-input"
						data-validate="비밀번호를 입력하세요 ">
						<input class="input100" type="password" id="pw" name="pw"
							value="${param.pw}" required> <span class="focus-input100"></span>
					</div>

					<br>
				<div style="margin-top: 20px">
					<a href="${url}"> <img width="225" height="50" align="top"
						src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
				</div>
			  <div style="margin-top: 20px">
				 <a href="https://kauth.kakao.com/oauth/authorize?client_id=3ef8d9de8d6e54b2b36e9a5c816d413d&redirect_uri=http://localhost:9080/SpringFinal/member/kakao_login&response_type=code">
                       <img width="225" height="50" align="top" src="${pageContext.request.contextPath}/images/kakao_login_btn_medium_narrow.png">
					</a>
					</div>
					<div class="container-login100-form-btn">
						<button class="login100-form-btn" type="submit">로그인하기</button>
					</div>
					<button class="login100-form-btn" type="button"
						onclick="history.go(-1);">뒤로가기</button>

					<div class="w-full text-center p-t-55">
						<span class="txt2"> 아직 회원이 아닌가요? </span> <a href="#"
							class="txt2 bo1" id="joinBtn"> 회원가입하러가기 </a>
					</div>
				</form>
				<br>
			</div>
		</div>
	</div>

</body>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	// 로그인
	function loginPost() {
		var id = $('#id').val();
		var pw = $('#pw').val();

		var form = document.login;
		form.id.value = id;
		form.pw.value = pw;
		form.method = "POST";
		form.action = "${pageContext.request.contextPath}/member/login_2"
		form.submit();
	}
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
	// 네이버 로그인
	 	$(function() {
	 $("#naver_id_login").click(function() {
	 location.href = "${pageContext.request.contextPath}/member/login";
	 })
	 }) 
</script>
</html>