<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입하기</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	/*  아이디 체크 */
	function idCheck(ojb) {
		$("#password-danger").hide();
		$(".idCheck").keyup(function() {
			var idReg = /^[A-za-z0-9]/g;
			if (idReg == false) {
				$("#id-danger").show();
				$("#submit").removeAttr("disabled");
			} else {
				$("#id-danger").hide();
				$("#submit").attr("disabled", "disabled");
			}
		})
	}
	/* 비밀번호 공백 제거 */
	function test(obj) {
		$("#password-danger").hide();
		$(".noSpace").keyup(function() {
			var pwCheck = $('.noSpace').val().replace(/ /gi, '');
			if (pwCheck == false) {
				$("#password-danger").show();
				$("#submit").removeAttr("disabled");
			} else {
				$("#password-danger").hide();
				$("#submit").attr("disabled", "disabled");
			}
		})
	}
	/* 비밀번호 확인 */
	$(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var pwd1 = $("#pw1").val();
			var pwd2 = $("#pw2").val();
			if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
				}
			}
		});
	});
	/* 이메일 확인  */
	function emailCheck() {

		/* alert(document.getElementById("email").value); */

		var email = document.getElementById("email").value;

		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

		if (exptext.test(email) == false) {

			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐 경우

			alert("이메일 형식이 올바르지 않습니다.");
			window.history.go(-1);
			return false;
		}

	}
</script>
</head>
<body>

	<form action="${pageContext.request.contextPath}/member/join"
		method="POST">
		<!-- 아이디  -->
		<p>아이디</p>
		<input type="text" name="id" value="${param.id} "
			placeholder="ID를 입력하세요" onkeyup="idCheck(this);" class="idCheck" maxlength="10">
		<div class="alert id-danger" id="id-danger">아이디는 영어 대문자, 소문자 그리고
			숫자만 허용합니다.</div>
		<c:if test="${errors.id }">ID를 입력하세요</c:if>
		<c:if test="${errors.duplicateId }">이미 사용중인 아이디 입니다.</c:if>
		<br>
		<!-- 비밀번호  -->
		<p>비밀번호</p>
		<div id="noSpace" onkeyup="test(this);" class="noSpace">
			<input type="text" id="pw1" name="pw" value="${param.pw} "
				placeholder="비밀번호를 입력하세요" class="noSpace" maxlength="10">
			<c:if test="${errors.pw }">비밀번호를 입력하세요</c:if>
			<br> <input type="text" id="pw2" name="confirmPw"
				value="${param.confirmPw} " placeholder="비밀번호 확인" class="noSpace" maxlength="10">
			<div class="alert alert-success" id="alert-success">비밀번호가
				일치합니다.</div>
			<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지
				않습니다</div>
			<div class="alert password-danger" id="password-danger">공백은
				허용하지 않습니다.</div>
		</div>
		<!-- 이메일  -->
		<p>이메일</p>
		<input type="email" name="email" id="email" value="${param.email} "
			placeholder="email을 입력하세요" onsubmit="emailCheck();">
		<c:if test="${errors.email }">이메일을 입력하세요</c:if>
		<br>
		<!-- 이름  -->
		<p>이름</p>
		<input type="text" name="name" value="${param.name} "
			placeholder="이름을 입력하세요">
		<c:if test="${errors.name }">이름을 입력하세요</c:if>
		<br>
		<!-- 생년월일  -->
		<p>생년월일</p>
		<input type="date" name="birth" value="${param.birth}"> <br>
		<p>성별</p>
		<input type="radio" class="" required="" autocomplete="off"
			name="gender" value="1" checked="checked"> 남자 <input
			type="radio" class="" required="" autocomplete="off" name="gender"
			value="2">여자
		<c:if test="${errors.gender}">성별을 입력하세요</c:if>
		<input type="submit" value="가입">
	</form>
</body>
</html>