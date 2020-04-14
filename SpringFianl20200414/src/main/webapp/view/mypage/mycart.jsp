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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<c:if test="${!empty mycartList}">	
	<c:forEach var="article" items="${mycartList}">	
		${article.isbn }/${article.id }/${article.book_subject}/${article.book_price }
		<div>
			<button type="button" id="deleteCart" name="deleteCart"
			class="rui_button_white_50 btn_cart js_add_cart trackable"
			mycart_isbn="${article.isbn}"
			mycart_id="${article.id}"
			>
			삭제
			</button>
		</div>		
	</c:forEach>
</c:if>


<c:if test="${empty mycartList}">	
<div>없음</div>
</c:if>
</body>
<script type="text/javascript">
$(document).on("click","button[name='deleteCart']", function(){
	var result = confirm("장바구니에서 삭제 담으시겠습니까?");
	var isbn = $(this).attr("mycart_isbn");
	var id = $(this).attr("mycart_id");
	console.log(isbn);
	console.log(id);
	if(result){
		
		var objParams = {
			mycart_isbn       : isbn,
			mycart_id        : id
		};
				
		$.ajax({
			url            :    "deleteCart",
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