<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
  background: #76b852;
  /* fallback for old browsers */
  background: -webkit-linear-gradient(to top, #76b852, #8DC26F);
  background: -moz-linear-gradient(to top, #76b852, #8DC26F);
  background: -o-linear-gradient(to top, #76b852, #8DC26F);
  background: linear-gradient(to top, #76b852, #8DC26F);
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
    background: #8DC26F;
}
button[type="submit"] {
    font-size: .9em;
    color: #fff;
    background: #76b852;
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
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/view/css/main.css">
<!--===============================================================================================-->
</head>
<title>아이디 찾기</title>
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
		
			<div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33">
				<form class="login100-form validate-form flex-sb flex-w" action="${pageContext.request.contextPath}/member/login"
					method="post">
					<span class="login100-form-title p-b-53">
						아이디 찾기 검색 결과
					</span>
					<div>
							<h3 style="text-align: center">${ id }</h3>
					</div>
						<div class="container-login100-form-btn m-t-17">
						<button class="login100-form-btn" type="submit" id="loginBtn">
							로그인하기
						</button>
						<button class="login100-form-btn" type="submit" onclick="history.go(-1);">
							뒤로가기
						</button>
						</div>
				</form>
			</div>
		</div>
	</div>
	
	<div class="main-agileinfo">
			<div class="agileits-top">
				<form action="${pageContext.request.contextPath}/member/join"
		method="POST" onsubmit="return checkAll()" name="form">
					<!-- 아이디  -->
					<input class="text" type="text" name="id" placeholder="아이디를 적어주세요" required=""  id="id" name="id" value="${param.id}" maxlength="10" onkeyup="noSpace(this);">
					<div class="wthree-text">
						<label class="anim" id="check">
							<input type="checkbox" class="checkbox" required="">
							<span>중복 확인</span>
							<table>
								<tr>
								<td colspan=3 id="idCheck"></td>
								<td class="check_font" id="idCheck"></td>
								</tr>
							</table>
						</label>
						<div class="clear"> </div>
					</div>
					<!-- 이름  -->
					<input class="text" type="text" placeholder="이름을 적어주세요" required="" style="margin-top: 28.8px" onkeyup="noSpace(this);" name="name" value="${param.name}">
					<c:if test="${errors.name }">이름을 입력하세요</c:if>
					<!-- 이메일  -->
					<input class="text email" type="email" name="email" id="email" placeholder="이메일을 적어주세요" required="" onkeyup="noSpace(this);">
					<c:if test="${errors.email }">이메일을 입력하세요</c:if>
					<c:if test="${errors.duplicateEmail }">이미 사용중인 이메일 입니다.</c:if>
					<!-- 비밀번호  -->
					<input class="text" type="password" placeholder="비밀번호를 적어주세요" required="" id="pw1" name="pw" value="${param.pw}"  maxlength="12" onkeyup="noSpace(this);">
					<input class="text w3lpass" type="password" name="password" placeholder="비밀번호 확인" required="" id="pw2" name="pw2" maxlength="12" onkeyup="noSpace(this);">
					<div class="check_font" id="alert-success">비밀번호가 일치합니다.</div>
					<div class="check_font" id="alert-danger">비밀번호가 일치하지 않습니다</div>
					<!-- 생년월일  -->
					<input class="text" type="text" placeholder="생년월일을 적어주세요" required=""  onkeyup="noSpace(this);" id="user_birth" name="birth" >
					<!-- 성별 -->
					
					<input type="text" value="성별을 선택해주세요" readonly style="margin-top: 28.8px"><br><br>
					<div class="text">
					<input type="radio" id="customRadio1" name="gender"value="남자"> 
					<label	class="text" for="customRadio1"><font color="white">남자</font></label> 
					<input	type="radio" id="customRadio1" name="gender"  value="여자"> 
					<label class="text"	for="customRadio1"><font color="white">여자</font></label>
					<c:if test="${errors.gender}">성별을 입력하세요</c:if>
					</div>
					<input type="submit" value="회원가입 하기">
				</form>
				<p>이미 회원이라면?? </p>
				<br>
				<p id="loginBtn"> 로그인하러 가기</p>
			</div>
		</div>
		<!-- copyright -->
		<div class="colorlibcopy-agile">
			<p>© 2020 주식회사 치킨. All rights reserved | Design by <a href="https://colorlib.com/" target="_blank">우리집 내방</a></p>
		</div>
		<!-- //copyright -->
		<ul class="colorlib-bubbles">
		</ul>
	</div>
	
	
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>
	$(function() {
		$("#loginBtn").click(function() {
			location.href = '${pageContext.request.contextPath}/member/login';
		})
	})
</script>
</html>
