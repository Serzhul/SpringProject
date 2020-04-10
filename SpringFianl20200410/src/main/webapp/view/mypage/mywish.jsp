<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

</head>
<body>
<c:if test="${!empty mywishList}">
<c:forEach var="article" items="${mywishList}">
	<div>${article.isbn}//${article.book_subject}</div>	
	<button type="button" id="deleteWish" name="deleteWish"
			class="rui_button_white_50 btn_cart js_add_cart trackable"
			mywish_isbn="${article.isbn}"
			mywish_id="${article.id}"
			>
			삭제
	</button>	
</c:forEach>
</c:if>
<c:if test="${empty mywishList}">
없음
</c:if>	
</body>
<script type="text/javascript">
$(document).on("click","button[name='deleteWish']", function(){
	var result = confirm("wishList에서 삭제하시겠습니까?");
	var isbn = $(this).attr("mywish_isbn");
	var id = $(this).attr("mywish_id");

	if(result){
		
		var objParams = {
			mywish_isbn       : isbn,
			mywish_id        : id
		};
				
		$.ajax({
			url            :    "deleteWish",
			dataType    :    "json",
			contentType :    "application/x-www-form-urlencoded; charset=UTF-8",
			type         :    "post",
			async        :     false, //동기: false, 비동기: ture
			data        :    objParams
		});
		location.reload(); 
	}else{
	    alert("취소하셨습니다");
	}    
});
</script>
</html>