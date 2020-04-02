<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

</head>
<body>


	<article class="container">
	<div class="page-header">
		<h1>
			회원가입 <small>Sign up</small>
		</h1>
	</div>
	<form action="${pageContext.request.contextPath}/member/join"
		method="POST" onsubmit="return checkAll()" name="form">
		<div class="col-md-6 col-md-offset-3">
			<div class="form-group">
				<label for="InputId">아이디</label> <input type="text"
					class="form-control" id="id" name="id" value="${param.id}"
					placeholder="ID를 입력하세요" maxlength="10" onkeyup="noSpace(this);">
				<button type="button" id="check" class="btn btn-primary mb-2">중복체크</button>
				<table>
					<tr>
						<td colspan=3 id="idCheck"></td>
						<td class="check_font" id="idCheck"></td>
					</tr>
				</table>
			</div>
		

			<div class="form-group">
				<label for="InputEmail">이메일 주소</label> <input type="email"
					class="form-control" name="email" id="email"
					value="${param.email} " placeholder="email을 입력하세요"onkeyup="noSpace(this);" >
				<c:if test="${errors.email }">이메일을 입력하세요</c:if>
				<c:if test="${errors.duplicateEmail }">이미 사용중인 이메일 입니다.</c:if>
			</div>

			<div>
				<div class="form-group">
					<label for="InputPassword1">비밀번호</label> <input type="password"
						class="form-control" id="pw1" name="pw" value="${param.pw}"
						placeholder="비밀번호를 입력하세요" maxlength="12" onkeyup="noSpace(this);">
				</div>

				<div class="form-group">
					<label for="InputPassword2">비밀번호 확인</label> 
					<input type="password" class="form-control" id="pw2" name="pw2"
						placeholder="비밀번호 확인" maxlength="10" onkeyup="noSpace(this);"	>
					<p class="help-block">비밀번호 확인을 위해 다시 한번 입력 해 주세요</p>
					<div class="password-danger" id="password-danger">공백은 허용하지 않습니다.</div>
					<div class="check_font" id="alert-success">비밀번호가 일치합니다.</div>
					<div class="check_font" id="alert-danger">비밀번호가 일치하지 않습니다</div>
				</div>
				<div class="form-group">
					<label for="username">이름</label><input type="text"
						class="form-control username" name="name" value="${param.name} "
						placeholder="이름을 입력하세요" onkeyup="noSpace(this);">
					<c:if test="${errors.name }">이름을 입력하세요</c:if>
					<div class="check_font" id="name_check"></div>
				</div>
					<div class="form-group required">
				<label for="user_birth">생년월일</label>
					<input type="text" class="form-control" id="user_birth" name="birth" placeholder="ex) 19990415" onkeyup="noSpace(this);">
				<div class="check_font" id="birth_check"></div>
				</div>
				<label for="InputPassword2">성별</label>
				<div class="custom-control custom-radio">

					<input type="radio" id="customRadio1" name="gender"	class="custom-control-input" value="남자"> 
					<label	class="custom-control-label" for="customRadio1">남자</label> 
					<input	type="radio" id="customRadio1" name="gender" class="custom-control-input" value="여자"> 
					<label	class="custom-control-label" for="customRadio1">여자</label>
					<c:if test="${errors.gender}">성별을 입력하세요</c:if>
				</div>

				<div class="form-group text-center">
					<button type="submit" class="btn btn-info">
						회원가입<i class="fa fa-check spaceLeft"></i>
					</button>
					<div class="btn btn-warning">
						<a href="${pageContext.request.contextPath}/member/main">가입취소</a>
					<i class="fa fa-times spaceLeft"></i>
					</div>
				</div>
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
// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
// 아이디 중복 검사 Ajax
	$(document).ready(
	function checkId(obj) {
	var idx = false;
	$('#check').click(function() {
	$.ajax({
	url : "${pageContext.request.contextPath}/member/idCheck",
	type : "GET",
	data : {
	"id" : $('#id').val()},
	success : function(data) {
	if (data == 0 && $.trim($('#id').val()) != '') {
		idx = true;
		/* $('#id').attr("readonly",true); */
		var html = "<tr><td colspan='3' style='color: green'>사용가능</td></tr>";
		$('#idCheck').empty();
		$('#idCheck').append(html);
		return true;
		
		} else {
		var html = "<tr><td colspan='3' style='color: red'>사용불가능한 아이디 입니다.</td></tr>";
		$('#idCheck').empty();
		$('#idCheck').append(html);
		return false;
		}
			},
		error : function() {
		alert("서버에러");
		}
		});

		});
	});
 


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
					$('#alert-success').css('color', 'green');
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
					return false;
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					$('#alert-danger').css('color', 'red');
					$("#submit").attr("disabled", "disabled");
					return true;
				}
			}
		});
	});
	
	$(".username").blur(function() {
		if (nameJ.test($(this).val())) {
				console.log(nameJ.test($(this).val()));
				$("#name_check").text('');
		} else {
			$('#name_check').text('이름은 한글 혹은 영어만 가능합니다');
			$('#name_check').css('color', 'red');
		}
	});
	
	// 생일 유효성 검사
	var birthJ = false;
	
	// 생년월일	birthJ 유효성 검사
	$('#user_birth').blur(function(){
		var dateStr = $(this).val();		
	    var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
	    var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
	    var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
	    var today = new Date(); // 날짜 변수 선언
	    var yearNow = today.getFullYear(); // 올해 연도 가져옴
		
	    if (dateStr.length <=8) {
			// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
		    if (1900 > year || year > yearNow){
		    	
		    	$('#birth_check').text('생년월일을 확인해주세요 :)');
				$('#birth_check').css('color', 'red');
		    	
		    }else if (month < 1 || month > 12) {
		    		
		    	$('#birth_check').text('생년월일을 확인해주세요 :)');
				$('#birth_check').css('color', 'red'); 
		    
		    }else if (day < 1 || day > 31) {
		    	
		    	$('#birth_check').text('생년월일을 확인해주세요 :)');
				$('#birth_check').css('color', 'red'); 
		    	
		    }else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
		    	 
		    	$('#birth_check').text('생년월일을 확인해주세요 :)');
				$('#birth_check').css('color', 'red'); 
		    	 
		    }else if (month == 2) {
		    	 
		       	var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
		       	
		     	if (day>29 || (day==29 && !isleap)) {
		     		
		     		$('#birth_check').text('생년월일을 확인해주세요 :)');
					$('#birth_check').css('color', 'red'); 
		    	
				}else{
					$('#birth_check').text('');
					birthJ = true;
				}//end of if (day>29 || (day==29 && !isleap))
		     	
		    }else{
		    	
		    	$('#birth_check').text(''); 
				birthJ = true;
			}//end of if
			
			}else{
				//1.입력된 생년월일이 8자 초과할때 :  auth:false
				$('#birth_check').text('생년월일을 확인해주세요 :)');
				$('#birth_check').css('color', 'red');  
			}
		}); //End of method /*
		
		var nameJ = /^[가-힝a-zA-Z]{2,}$/;	
		// 이름에 특수문자 들어가지 않도록 설정
		$(".username").blur(function() {
			if (nameJ.test($(this).val())) {
					console.log(nameJ.test($(this).val()));
					$("#name_check").text('');
			} else {
				$('#name_check').text('이름은 한글 혹은 영어만 가능합니다');
				$('#name_check').css('color', 'red');
			}
		});
		
	
		 
/* 		   function check(re, what, message) {
		       if(re.test(what.value)) {
		           return true;
		       }
		       alert(message);
		       what.value = "";
		       what.focus();
		       //return false;
		   } */

			// 유효성 검사 함수
			function checkAll() {
		        if (!checkUserId(form.id.value)) {
		            return false;
		        } else if (!checkPassword(form.id.value, form.pw.value,
		                form.pw2.value)) {
		            return false;
		        } else if (!checkMail(form.mail.value)) {
		            return false;
		        } else if (!checkName(form.name.value)) {
		            return false;
		        } else if (!checkId(form.id.value)){
		        	return false;
		        }
		        return true;
		    }
		   
		// 유효성 아이디 ----------------------------------------
	    function checkUserId(id) {
	        //Id가 입력되었는지 확인하기
	        if (!checkExistData(id, "아이디를"))
	            return false;
	 
	        var idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
	        if (!idRegExp.test(id)) {
	            alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
	            form.id.value = "";
	            form.id.focus();
	            return false;
	        }
	        return true; //확인이 완료되었을 때
	    }
		 //유효성 - 비밀번호 ----------------------------------------
		 function checkPassword(id, pw, pw2) {
		        //비밀번호가 입력되었는지 확인하기
		        if (!checkExistData(pw, "비밀번호를"))
		            return false;
		        //비밀번호 확인이 입력되었는지 확인하기
		        if (!checkExistData(pw2, "비밀번호 확인을"))
		            return false;
		 
		        var password1RegExp = /^[a-zA-z0-9]{4,12}$/; //비밀번호 유효성 검사
		        if (!password1RegExp.test(pw)) {
		            alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
		            form.pw.value = "";
		            form.pw.focus();
		            return false;
		        }
		        //비밀번호와 비밀번호 확인이 맞지 않다면..
		        if (pw != pw2) {
		            alert("두 비밀번호가 맞지 않습니다.");
		            form.pw.value = "";
		            form.pw2.value = "";
		            form.pw2.focus();
		            return false;
		        }
		 
		        //아이디와 비밀번호가 같을 때..
		        if (id == pw) {
		            alert("아이디와 비밀번호는 같을 수 없습니다!");
		            form.pw.value = "";
		            form.pw2.value = "";
		            form.pw2.focus();
		            return false;
		        }
		        return true; //확인이 완료되었을 때
		    }    

		 	// 유효성 - 이메일 ----------------------------------------
		    function checkMail(mail) {
		        //mail이 입력되었는지 확인하기
		        if (!checkExistData(mail, "이메일을"))
		            return false;
		 
		        var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
		        if (!emailRegExp.test(mail)) {
		            alert("이메일 형식이 올바르지 않습니다!");
		            form.mail.value = "";
		            form.mail.focus();
		            return false;
		        }
		        return true; //확인이 완료되었을 때
		    }

		 	// 유효성 - 이름 ----------------------------------
		    function checkName(name) {
		        if (!checkExistData(name, "이름을"))
		            return false;
		 
		        var nameRegExp = /^[가-힣]{2,4}$/;
		        if (!nameRegExp.test(name)) {
		            alert("이름이 올바르지 않습니다.");
		            return false;
		        }
		        return true; //확인이 완료되었을 때
		    }

		 // 공백확인 함수
		    function checkExistData(value, dataName) {
		        if (value == "") {
		            alert(dataName + " 입력해주세요!");
		            return false;
		        }
		        return true;
		 }
	

			
</script>
</html>
