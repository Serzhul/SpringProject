<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/view/css/shards.min.css?v=3.0.0">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/view/css/shards-demo.min.css?v=3.0.0">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/view/carousel/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/view/carousel/slick/slick-theme.css" />
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/view/carousel/slick/slick.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>


</head>
<style>
button {
	height: 100px;
	width: 150px;
}

.red {
	background-color: red;
}

.blue {
	background-color: blue;
}

.rui_button_white_50 {
	font-family: ridi-roboto, Helvetica Neue, Apple SD Gothic Neo, "나눔고딕",
		Nanum Gothic, "돋움", arial, Dotum, Tahoma, Geneva, sans-serif;
	letter-spacing: -.03em;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	margin: 0;
	padding: 0;
	-webkit-appearance: none;
	-webkit-tap-highlight-color: transparent;
	appearance: none;
	border: 0;
	box-shadow: none;
	outline: 0;
	text-decoration: none;
	box-sizing: border-box;
	border-radius: 4px;
	font-weight: 700;
	display: inline-block;
	text-align: center;
	cursor: pointer;
	line-height: 1em;
	vertical-align: baseline;
	-webkit-transition: background .2s, color .2s;
	transition: background .2s, color .2s;
	color: #808991;
	background: white;
	border: 1px solid #d1d5d9;
	box-shadow: 0 1px 1px 0 rgba(209, 213, 217, .3);
	font-size: 16px;
	padding: 16px 34px;
}

.rui_button_red_50 {
	font-family: ridi-roboto, Helvetica Neue, Apple SD Gothic Neo, "나눔고딕",
		Nanum Gothic, "돋움", arial, Dotum, Tahoma, Geneva, sans-serif;
	letter-spacing: -.03em;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	margin: 0;
	padding: 0;
	-webkit-appearance: none;
	-webkit-tap-highlight-color: transparent;
	appearance: none;
	border: 0;
	box-shadow: none;
	outline: 0;
	text-decoration: none;
	box-sizing: border-box;
	border-radius: 4px;
	font-weight: 700;
	display: inline-block;
	text-align: center;
	cursor: pointer;
	line-height: 1em;
	vertical-align: baseline;
	-webkit-transition: background .2s, color .2s;
	transition: background .2s, color .2s;
	color: #808991;
	background: red;
	border: 1px solid #d1d5d9;
	box-shadow: 0 1px 1px 0 rgba(209, 213, 217, .3);
	font-size: 16px;
	padding: 16px 34px;
}
</style>
<body>

	<button id="test" class="rui_button_white_50">찜하기</button>



</body>
<script>
$("#test").click(function(){
	if($(this).html() == '찜하기' ) {
		$(this).toggleClass('rui_button_red_50');
		$(this).toggleClass('rui_button_white_50');
		$(this).html('취소');
	}else{
		$(this).toggleClass('rui_button_white_50');
		$(this).toggleClass('rui_button_red_50');
		$(this).html('찜하기');
	}    
});

/* $(function(){
	$('#button1').click( function() {
		if( $(this).html() == '접기' ) {
			$(this).html('펼치기');
	    }
	    else {
	    	$(this).html('접기');
	    }
	});
}); */
</script>
</html>