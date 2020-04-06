<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("button").click(function() {
			$("p").toggle();
		});
	});
</script>
</head>
<body>

	<button>Toggle between hiding and showing the paragraphs</button>

	<p>This is a paragraph with little content.</p>
	<p>This is another small paragraph.</p>

</body>
</html>