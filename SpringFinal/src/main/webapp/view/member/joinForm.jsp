<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style>
.success {
	background-color: lightblue;
}

.fail {
	background-color: red;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입하기</title>
</head>
<body>

	<form action="${pageContext.request.contextPath}/member/join"
		method="POST">
		<!-- 아이디  -->
		<p>아이디</p>
		<div>
		<input type="text" id="id" name="id" value="${param.id} "
			placeholder="ID를 입력하세요" maxlength="10" required>
			 <input	type="button" id="check" value="중복체크">
				<table>
					<tr>
						<td colspan=3 id="idCheck"></td>
					</tr>
				</table>
		</div>		
		<div onkeyup="noSpace(this);">
			<div class="alert id-danger" id="id-danger">아이디는 영어 대문자, 소문자
				그리고 숫자만 허용합니다.</div>
			<c:if test="${errors.id }">ID를 입력하세요</c:if>
			<c:if test="${errors.duplicateId }">이미 사용중인 아이디 입니다.</c:if>

			<br>
			<!-- 비밀번호  -->
			<p>비밀번호</p>
			<input type="text" id="pw1" name="pw" value="${param.pw} "
				placeholder="비밀번호를 입력하세요" maxlength="10" onkeyup="noSpace(this);"
				required> <br> <input type="text" id="pw2"
				name="confirmPw" placeholder="비밀번호 확인" maxlength="10"
				onkeyup="noSpace(this);">
			<div class="success" id="alert-success">비밀번호가 일치합니다.</div>
			<div class="fail" id="alert-danger">비밀번호가 일치하지 않습니다</div>
			<div class="alert password-danger" id="password-danger">공백은
				허용하지 않습니다.</div>
			<!-- 이메일  -->
			<p>이메일</p>
			<input type="email" name="email" id="email" value="${param.email} "
				placeholder="email을 입력하세요" onsubmit="emailCheck();" required>
			<c:if test="${errors.email }">이메일을 입력하세요</c:if>
			<c:if test="${errors.duplicateEmail }">이미 사용중인 이메일 입니다.</c:if>
			<br>
			<!-- 이름  -->
			<p>이름</p>
			<input type="text" name="name" value="${param.name} "
				placeholder="이름을 입력하세요" required>
			<c:if test="${errors.name }">이름을 입력하세요</c:if>
			<br>
			<!-- 생년월일  -->
			<p>생년월일</p>
			<input type="date" name="birth" value="${param.birth}" required>
			<br>
			<p>성별</p>
			<input type="radio" autocomplete="off" name="gender" value="남자">
			남자 <input type="radio" autocomplete="off" name="gender" value="여자">여자
			<c:if test="${errors.gender}">성별을 입력하세요</c:if>
			<input type="submit" value="가입">
		</div>
	</form>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	/*  아이디 체크 */
	/* 	function idCheck(obj) {
	 $("#id-danger").hide();
	 $(".idCheck").keyup(function() {
	 var idReg = /^[A-za-z0-9]/g;
	 if (idReg.val() !== idReg) {
	 $("#id-danger").show();
	 $("#submit").removeAttr("disabled");
	 } else {
	 $("#id-danger").hide();
	 $("#submit").attr("disabled", "disabled");
	 }
	 })
	 } */
	/* 비밀번호 공백 제거 */
	function noSpace(obj) {
		$("#password-danger").hide();
		$("input").keyup(function() {
			var pwCheck = /\s/; // 공백 체크
			if (pwCheck.exec(obj.value)) {
				$("#password-danger").show();
				obj.focus();
				obj.value = obj.value.replace(' ', ''); // 공백제거
				return false;
			} else {
				$("#password-danger").hide();
				return true;
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
					return false;
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
					return true;
				}
			}
		});
	});

	$(document).ready(function(e) {
			var idx = false;
			$('#check').click(function() {
				$.ajax({url : "${pageContext.request.contextPath}/member/idCheck",
						type : "GET",
						data : {
						"id" : $('#id').val()
						},
						success : function(data) {
							if (data == 0 && $.trim($('#id').val()) != '') {
								idx = true;
								$('#id').attr("readonly",true);
									var html = "<tr><td colspan='3' style='color: green'>사용가능</td></tr>";
									$('#idCheck').empty();
									$('#idCheck').append(html);
							} else {
							var html = "<tr><td colspan='3' style='color: red'>사용불가능한 아이디 입니다.</td></tr>";
							$('#idCheck').empty();
							$('#idCheck').append(html);
										}
										},
							error : function() {
									alert("서버에러");
														}
													});

										});
					});
</script>
</html>