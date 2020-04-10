<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%-- <c:set var="path" value="${pageContext.request.contextPath}"/> --%>
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

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>


	<article class="container">
	<div class="page-header">
		<h1>
			회원가입 <small>Sign up</small>
		</h1>
	</div>
	<form action="${pageContext.request.contextPath}/member/join"
		method="POST">
		<div class="col-md-6 col-md-offset-3">
			<div class="form-group">
				<label for="InputId">아이디</label> <input type="text"
					class="form-control" id="id" name="id" value="${param.id}"
					placeholder="ID를 입력하세요" maxlength="10" required> 
					  <button type="button" class="btn btn-primary mb-2">중복체크</button>
					<input
					type="button" id="check" value="중복체크">
				<table>
					<tr>
						<td colspan=3 id="idCheck"></td>
					</tr>
				</table>
			</div>

			<div class="form-group">
				<label for="InputEmail">이메일 주소</label> <input type="email"
					class="form-control" name="email" id="email"
					value="${param.email} " placeholder="email을 입력하세요"
					onsubmit="emailCheck();" required>
				<c:if test="${errors.email }">이메일을 입력하세요</c:if>
				<c:if test="${errors.duplicateEmail }">이미 사용중인 이메일 입니다.</c:if>
			</div>

			<div onkeyup="noSpace(this);">
				<div class="form-group">
					<label for="InputPassword1">비밀번호</label> <input type="password"
						class="form-control" id="pw1" name="pw" value="${param.pw}"
						placeholder="비밀번호를 입력하세요" maxlength="10" onkeyup="noSpace(this);"
						required>
				</div>

				<div class="form-group">
					<label for="InputPassword2">비밀번호 확인</label> <input type="password"
						class="form-control" id="pw2" name="pw" value="${param.pw}"
						placeholder="비밀번호 확인" maxlength="10" onkeyup="noSpace(this);"
						required>
					<p class="help-block">비밀번호 확인을 위해 다시 한번 입력 해 주세요</p>
					<div class="success" id="alert-success">비밀번호가 일치합니다.</div>
					<div class="fail" id="alert-danger">비밀번호가 일치하지 않습니다</div>
					<div class="alert password-danger" id="password-danger">공백은
						허용하지 않습니다.</div>
				</div>
				<div class="form-group">
					<label for="username">이름</label> <input type="text"
						class="form-control" name="name" value="${param.name} "
						placeholder="이름을 입력하세요" required>
					<c:if test="${errors.name }">이름을 입력하세요</c:if>
				</div>

	 			<div class="form-group">
					<label for="birth">생년월일</label> <input type="date"
						class="form-control" name="birth" value="${param.birth}" required>
				</div>
				<%-- 
				<div class="form-group">
					<input type="radio" class="form-control" autocomplete="off"
						name="gender" value="남자"> 남자 <input type="radio"
						class="form-control" autocomplete="off" name="gender" value="여자">여자
					<c:if test="${errors.gender}">성별을 입력하세요</c:if>
				</div> --%>
				<label for="InputPassword2">성별</label>
				<div class="custom-control custom-radio">
					
					<input type="radio" id="customRadio1" name="customRadio"
						class="custom-control-input"> 
					<label class="custom-control-label" for="customRadio1">남자</label>
					<input type="radio" id="customRadio1" name="customRadio"
						class="custom-control-input"> 
					<label class="custom-control-label" for="customRadio1">여자</label>
				</div>

				<div class="form-group text-center">
					<button type="submit" class="btn btn-info">
						회원가입<i class="fa fa-check spaceLeft"></i>
					</button>
					<button type="submit" class="btn btn-warning">
						가입취소<i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
			</div>
		</form>
	</article>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	/*  아이디 체크 */
	function idCheck(obj) {
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
	}
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

	$(document)
			.ready(
					function(e) {
						var idx = false;
						$('#check')
								.click(
										function() {
											$
													.ajax({
														url : "${pageContext.request.contextPath}/member/idCheck",
														type : "GET",
														data : {
															"id" : $('#id')
																	.val()
														},
														success : function(data) {
															if (data == 0
																	&& $
																			.trim($(
																					'#id')
																					.val()) != '') {
																idx = true;
																$('#id')
																		.attr(
																				"readonly",
																				true);
																var html = "<tr><td colspan='3' style='color: green'>사용가능</td></tr>";
																$('#idCheck')
																		.empty();
																$('#idCheck')
																		.append(
																				html);
															} else {
																var html = "<tr><td colspan='3' style='color: red'>사용불가능한 아이디 입니다.</td></tr>";
																$('#idCheck')
																		.empty();
																$('#idCheck')
																		.append(
																				html);
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
