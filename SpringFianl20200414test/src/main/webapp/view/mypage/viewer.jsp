<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	test//${pageNum}//${bottomLine }//${isbn }
	
	<!-- <input type="button" value="말하기" /> -->
	<button id="test2">말하기	
	</button>
	<div id="test" value="${str1}" style="text-align: left"
	onmouseup="clip(this)"  onmousedown="window.getSelection().empty();">
	${str2}</div>
	
	<%-- <input id="code_html" type="text" value="${str}" autocomplete="off"
		readonly="">
	<input type="button" value="말하기" /> --%>
	<%-- <input id="code_html" type="text" value="${str}" autocomplete="off"
		readonly="">
		<input type="button" value="말하기" />
	 --%>
	
	<%-- <button onclick="speech(this.innerHTML)"> test
	<input type="hidden" value="${str}"/>
	</button> --%>
	<%-- <button onclick="speech()"> test</button>
	<div id="test" style="text-align: left">${str }</div> --%>
	
		
	<c:if test="${startPage >= bottomLine}">
		<a href="viewer?isbn=${isbn}&pageNum=${startPage - bottomLine}">[이전]</a>
	</c:if>


	<c:if test="${endPage < pageCount-1}">
		<a href="viewer?isbn=${isbn}&pageNum=${startPage + bottomLine}">[다음]</a>
	</c:if>

</body>

<script>
	
	
	
	var voices = [];
	function setVoiceList() {
		voices = window.speechSynthesis.getVoices();
	}

	setVoiceList();

	if (window.speechSynthesis.onvoiceschanged !== undefined) {
		window.speechSynthesis.onvoiceschanged = setVoiceList;
	}
	function speech(txt) {
		if (!window.speechSynthesis) {
			alert("음성 재생을 지원하지 않는 브라우저입니다. 크롬, 파이어폭스 등의 최신 브라우저를 이용하세요");
			return;
		}
		var lang = 'ko-KR';
		var utterThis = new SpeechSynthesisUtterance(txt);

		utterThis.onend = function(event) {
			console.log('end');
		};
		utterThis.onerror = function(event) {
			console.log('error', event);
		};

		var voiceFound = false;
		console.log(voices.length)
		for (var i = 0; i < voices.length; i++) {
			console.log(i)
			if (voices[i].lang.indexOf(lang) >= 0
					|| voices[i].lang.indexOf(lang.replace('-', '_')) >= 0) {
				utterThis.voice = voices[i];
				voiceFound = true;
			}
		}
		if (!voiceFound) {
			alert('voice not found');
			return;
		}
		utterThis.lang = lang;
		utterThis.pitch = 1;
		utterThis.rate = 1; //속도
		window.speechSynthesis.speak(utterThis);
	}
	
	var btn=document.getElementById("test2");
	btn.addEventListener("click",
		function(e) {
			var t = e.target;
			var input = t.previousElementSibling;
			speech(document.getElementById('test').innerHTML);
	});
	var clip = function(el){
		var selObj = window.getSelection().toString(); 		
		alert(selObj);
		var newWindow = window.open("about:blank");
		newWindow.location.href = "https://dict.naver.com/search.nhn?dicQuery="+selObj+"&query="+selObj ;

		
		/* location.href="https://dict.naver.com/search.nhn?dicQuery="+selObj+"&query="+selObj ;
		window.open('https://dict.naver.com/search.nhn?dicQuery='+selObj+'&query='+selObj ;'); */
	};
	
</script>

</html>