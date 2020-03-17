<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 유효성 체크</title>

<script type="text/javascript">
	function validate() {

		// 이메일검사

		// 4글자이상(\w=[a-zA-Z0-9_],[\w-]:'-'까지는 허용) @가 나오고

		// hanmail.net, naver.com, lycos.co.kr, iei.or.kr

		// 1글자 이상(주소).글자 가 1~3번 반복

		var userid = document.getElementById("userid");

		// 첫글자는 반드시 영문소문자, 4~12자로 이루어지고, 숫자가  하나 이상 포함되어야한다.

		// 영문소문자와 숫자로만 이루어져야 한다.

		// \d : [0-9]와 같다. {n,m} : n에서 m사이

		if (!chk(/^[a-z][a-z\d]{3,11}$/, userid, "잘못된 형식의 ID입니다."))
			return false;

		if (!chk(/[\d]/, userid, "잘못된 형식의 ID입니다."))
			return false;

		//alert(re.test(userid.value));

		var pass = document.getElementById("pass");

		var pass1 = document.getElementById("pass1");

		if (!pwchk(pass, pass1, "비밀번호가 다릅니다."))

			//if(!pwchk(pass.value, pass2.value)) return false;

			// 이름 검사 : 2글자 이상,한글로만 입력

			// 통과하지 못하면 한글로 2글자 이상을 넣으세요 메세지 출력

			var name = document.getElementById("name");

		if (!chk(/^[가-힝]{2,}$/, name, "한글만 입력하세요!!!(2글자 이상)"))
			return false;

		var email = document.getElementById("email");

		if (!chk(/^[\w-]{4,}@[\w-]+(\.\w+){1,3}$/, email, "이메일 형식이 잘못되었습니다."))
			;

		var tel1 = document.getElementById("tel1");

		var tel2 = document.getElementById("tel2");

		var tel3 = document.getElementById("tel3");

		if (tel1.value != '') {

			if (!chk(/^0(2|1[016789])$/, tel1, "앞자리는 2~3자리 숫자"))
				return false;

			if (!chk(/^\d{3,4}$/, tel2, "둘째자리는 3~4자리 숫자"))
				return false;

			if (!chk(/^\d{4}$/, tel3, "셋째자리는 4자리 숫자"))
				return false;

		}

		var email = document.getElementById("email");

		//return false;

	}

	function chk(re, e, msg) {

		if (re.test(e.value))
			return true;

		alert(msg);

		e.value = "";

		e.focus();

		return false;

	}

	function pwchk(e1, e2, msg) {

		if (e1 == e2)
			return true;

		alert(msg);

		e.value = "";

		e.focus();

		return false;

	}
</script>

</head>

<body>

	<h1>회원가입 유효성 체크</h1>



	<form action="" method="post" onsubmit="return validate();">

		<!-- input타입이 텍스트인경우 일반 텍스트로 입력받는다. -->

		<label for="userid">* 유저아이디</label> <input type="text" name="userid"
			id="userid" /> <br />



		<!-- password인 경우 입력한 값이 보이지 않는다. -->

		<label for="pass">* 비밀번호</label> <input type="password" name="pass"
			id="pass" /> <br /> <label for="pass1">* 비밀번호확인</label> <input
			type="password" name="pass1" id="pass1" /> <br /> <label for="name">*
			이름</label> <input type="text" name="name" id="name" /> <br /> <label
			for="email">* 이메일</label> <input type="text" name="email" id="email" />
		<br /> <label for="tel1">전화번호</label> <input type="text" name="tel1"
			id="tel1" maxlength="3" />- <input type="text" name="tel2" id="tel2"
			maxlength="4" />- <input type="text" name="tel3" id="tel3"
			maxlength="4" /> <br />



		<!-- select는 option중 한가지를 선택하도록 한다. -->

		<label for="job">직업</label> <select name="job" id="job">

			<option>개발자</option>

			<option>프로그래머</option>

			<option>자영업자</option>

		</select> <br />



		<!-- radio는 여러개 선택이 불가능하다. -->

		<label for="gender">성별</label> <input type="radio" name="gender"
			value="m" /> 남 <input type="radio" name="gender" value="f" /> 여 <br />

		<label for="hobby">취미</label>



		<!-- checkbox는 여러개 선택이 가능하다. -->

		<input type="checkbox" name="hobby" value="reading" /> 독서 <input
			type="checkbox" name="hobby" value="drama" /> 드라마보기 <input
			type="checkbox" name="hobby" value="soccer" /> 축구 <br /> <input
			type="checkbox" name="hobby" value="movie" /> 영화보기 <input
			type="checkbox" name="hobby" value="basket" /> 농구 <input
			type="checkbox" name="hobby" value="game" /> 게임 <br />



		<!-- 입력한 값을 리셋한다. -->

		<input type="reset" value="리셋" />



		<!-- 입력한 값을 제출한다. -->

		<input type="submit" value="완료" />

	</form>

</body>

</html>

