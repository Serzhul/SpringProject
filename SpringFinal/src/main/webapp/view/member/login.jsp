<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.logindiv {
	margin: 0 auto;
}

.account-login .remember-wrapper {
	margin-top: -1px;
	padding: 13px 8px 13px 16px;
	overflow: hidden;
	border: 1px solid #d6deeb;
	border-radius: 0 0 4px 4px;
	background: #f7fbff;
	z-index: 1;
}

.account-login .remember-wrapper .external-links {
	margin-left: 14px;
	padding-top: 3px;
	float: right;
}

.login-section {
	padding: 24px 10px;
}

.pt {
	padding-top: 100px;
}

.login-Button {
	color: balack;
	margin-right: auto;
	margin-left: auto;
	margin-top: 20px;
	margin-bottom: auto;
}

.text-align {
	text-align: center;
}
</style>
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
	href="${pageContext.request.contextPath}/view/css/shards.min.css?v=3.0.0">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/view/css/shards-demo.min.css?v=3.0.0">
<link
	href="${pageContext.request.contextPath}/view/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/view/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/view/css/style.css"
	media="screen" title="no title" charset="utf-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>
<style>
.dd input[type=submit] { text-align:center }
</style>
</head>
<body>
	<div class="contact section-invert pt">
		<div class="container">
			<div class="row justify-content-md-center px-4">
				<form action="${pageContext.request.contextPath}/member/login"
					method="post">
					<div class="remember-wrapper">
						<div class="col-md-8 logindiv">
							<div class="form-group">
								<input type="text" class="form-control" id="contactFormFullName"
									placeholder="아이디를 입력하세요" name="id" value="${param.id}">
								<c:if test="${errors.idOrPwNotMatch }">	아이디나 암호가 일치하지 않습니다.	</c:if>
								<c:if test="${errors.id }">ID를 입력하세요</c:if>
							</div>
						</div>
						<div class="col-md-8 logindiv">
							<div class="form-group">
								<input type="password" class="form-control"
									id="contactFormEmail" placeholder="비밀번호를 입력하세요" name="pw"
									value="${param.pw}">
								<c:if test="${errors.pw}">암호를 입력하세요</c:if>
							</div>
						</div>
					</div>
					<div class="remember-wrapper" style="text-align: center">
						<div class="col-md-8 logindiv">
							<%-- 	<a href="${pageContext.request.contextPath}/member/findId">아이디
								찾기</a>  --%>
							<span title="아이디 찾기" id="find_id_btn"> <i>아이디 찾기&nbsp;&nbsp;&nbsp;&nbsp;</i>
							</span> 

							 <span title="아이디 찾기" id="find_pw_btn"> <i>비밀번호 찾기</i>
							</span>
						</div>
					</div>
					<div class="dd">
						<input class="btn login-Button btn-pill d-flex  contact-form col-md-8 p-4  card" type="submit" value="로그인 하기">
					</div>
					<div
						class="btn login-Button btn-pill d-flex ml-auto mr-auto contact-form col-md-8 p-4 mb-4 card" id="joinBtn">
						회원가입하기
					</div>
				</form>
			</div>
		</div>
	</div>
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