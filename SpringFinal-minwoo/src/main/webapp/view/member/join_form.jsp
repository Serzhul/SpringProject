<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
input[type="text"], input[type="email"], input[type="password"] {
    font-size: 0.9em;
    color: #fff;
    font-weight: 100;
    width: 94.5%;
    display: block;
    border: none;
    padding: 0.8em;
    border: solid 1px rgba(255, 255, 255, 0.37);
    -webkit-transition: all 0.3s cubic-bezier(0.64, 0.09, 0.08, 1);
    transition: all 0.3s cubic-bezier(0.64, 0.09, 0.08, 1);
    background: -webkit-linear-gradient(top, rgba(255, 255, 255, 0) 96%, #fff 4%);
    background: linear-gradient(to bottom, rgba(255, 255, 255, 0) 96%, #fff 4%);
    background-position: -800px 0;
    background-size: 100%;
    background-repeat: no-repeat;
    color: black;
    font-family: 'Roboto', sans-serif;
}

label {
  margin: 0;
}

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

input[type="submit"]:hover {
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

input[type="radio"] {
  font-family: Poppins-Regular;
  color: #333333;
  font-size: 18px;
  width: 10%;
  height: 20px;
}

input.checkbox {
  background: #e2d7d7;
  cursor: pointer;
  width: 1.2em;
  height: 1.2em;
}

input.checkbox:before {
  content: "";
  position: absolute;
  width: 1.2em;
  height: 1.2em;
  background: inherit;
  cursor: pointer;
}

input.checkbox:after {
  content: "";
  position: absolute;
  top: 0px;
  left: 0;
  z-index: 1;
  width: 1.2em;
  height: 1.2em;
  border: 1px solid #fff;
  -webkit-transition: .4s ease-in-out;
  -moz-transition: .4s ease-in-out;
  -o-transition: .4s ease-in-out;
  transition: .4s ease-in-out;
}
.container-login100 {
    width: 100%;
    min-height: 50vh;
    max-height: 50vh;
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
    padding: 15px;
    background-position: center;
    background-size: cover;
    background-repeat: no-repeat;
}
</style>
<link href="${pageContext.request.contextPath}/view/css/joinFormNew.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/view/css/util.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/view/css/mainNew.css">

<head>
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%-- <link href="${pageContext.request.contextPath}/view/css/joinForm.css" rel="stylesheet" type="text/css" media="all" /> --%>
<link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
</head>
<body>
	<!-- main -->
		<div class="limiter">
			<div class="container-login100">
				<div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33">
				<form class="login100-form validate-form flex-sb flex-w" action="${pageContext.request.contextPath}/member/join" method="POST" onsubmit="return checkAll()" name="form"   autocomplete=”off”>
					<span class="login100-form-title p-b-53">
						회원가입
					</span>
					<!-- 아이디  -->
					<div class="p-t-31 p-b-9">
						<span class="txt1" >
							아이디
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate="아이디를 입력해 주세요" id="check">
						<input class="input100" type="text"  name="id" placeholder="아이디는 4~12자 영문소문자와 숫자만 가능"   id="id" name="id" value="${param.id}" maxlength="10" onkeyup="noSpace(this);">
						<span class="focus-input100"></span>	
					<div class="wrap-input100 ">
						<label class="anim" id="check">
							<span id="idCheck"></span>
						</label>
					</div>
					</div>	
					<!-- 이름  -->
					<div class="p-t-31 p-b-9">
						<span class="txt1">
							이름
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "이름을 입력해 주세요">
					<input class="input100" type="text" placeholder="이름을 적어주세요"  onkeyup="noSpace(this);" name="name" value="${param.name}">
					<span class="focus-input100"></span>	
					<c:if test="${errors.name }">이름을 입력하세요</c:if>
					</div>
					<!-- 이메일  -->
					<div class="p-t-31 p-b-9">
						<span class="txt1" >
							이메일
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "이메일을 입력해 주세요">
					<input class="input100" type="email" name="email" id="email" placeholder="이메일을 적어주세요" onkeyup="noSpace(this);">
					<span class="focus-input100"></span>	
					<c:if test="${errors.email }">이메일을 입력하세요</c:if>
					<c:if test="${errors.duplicateEmail }">이미 사용중인 이메일 입니다.</c:if>
					</div>
					<!-- 비밀번호  -->
					<div class="p-t-31 p-b-9">
						<span class="txt1" >
							비밀번호
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "비밀번호를 입력해 주세요">
					<input class="input100" type="password" placeholder="비밀번호를 적어주세요"  id="pw1" name="pw" value="${param.pw}"  maxlength="12" onkeyup="noSpace(this);">
					<span class="focus-input100"></span>	
					</div>
					<div class="p-t-31 p-b-9">
						<span class="txt1" >
							비밀번호 확인
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "비밀번호 확인">
					<input class="input100" type="password" name="password" placeholder="비밀번호 확인"  id="pw2" name="pw2" maxlength="12" onkeyup="noSpace(this);">
					<span class="focus-input100"></span>	
					<div class="check_font" id="alert-success">비밀번호가 일치합니다.</div>
					<div class="check_font" id="alert-danger">비밀번호가 일치하지 않습니다</div>
					</div>
					<!-- 생년월일  -->
					<div class="p-t-31 p-b-9">
						<span class="txt1" >
							생년월일
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "생년월일을 입력해주세요">
					<input class="input100" type="text" placeholder="생년월일을 적어주세요 ex)19930312"   onkeyup="noSpace(this);" id="user_birth" name="birth" >
					<span class="focus-input100"></span>	
					</div>
					<!-- 성별 -->
					<div class="p-t-31 p-b-9">
						<span class="txt1" >
							성별
						</span>
					</div>
					
					<div class="wrap-input100" data-validate = "성별을 선택해주세요">
					<input type="radio" id="customRadio1" name="gender"value="남자" > 
					<label	for="customRadio1" >남자</label> 
					<input	type="radio" id="customRadio1"  name="gender" value="여자"> 
					<label 	for="customRadio1" >여자</label>
					<!-- <input type="button" class="btn btn-secondary" name="gender"value="남자" id="customRadio1"></button>
					<input type="button" class="btn btn-secondary" name="gender"  value="여자" id="customRadio1"></button> -->
					</div>
					<input type="submit" value="회원가입 하기">
					<p>이미 회원이라면?? </p>
					<span id="loginBtn">
							로그인하러 가기
					</span>
				</form>
			</div>
		</div>
	</div>	

</body>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#mainBtn").click(function() {
		location.href = '${pageContext.request.contextPath}/member/main';
	})
})
$(function() {
	$("#loginBtn").click(function() {
		location.href = '${pageContext.request.contextPath}/member/login_2';
	})
})
// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
// 아이디 중복 검사 Ajax
 	$(document).ready(function checkId(obj) {
	var idx = false;
	$('#check').keyup(function() {
	$.ajax({
	url : "${pageContext.request.contextPath}/member/id_check",
	type : "get",
	data : {
	"id" : $('#id').val()},
	success : function(data) {
	if (data == 0 && $.trim($('#id').val()) != '') {
		idx = true;
	//	$('#id').attr("readonly",true);
		var html = "<tr><td colspan='3' style='color: green'>&nbsp;&nbsp;사용가능</td></tr>";
		$('#idCheck').empty();
		$('#idCheck').append(html);
		return true;
		} else {
		var html = "<tr><td colspan='3' style='color: red'>&nbsp;&nbsp;중복된 아이디가 존재합니다</td></tr>";
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