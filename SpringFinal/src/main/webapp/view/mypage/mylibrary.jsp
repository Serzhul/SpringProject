<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="article" items="${library}">
	<div>${article.isbn}//${article.book_subject}//	
	
	
	<%-- <button type="button" onclick="viewer(${article.isbn})">내 서재</button> --%>
	<button type="button" id="viewer" name="viewer" viewer_isbn="${article.isbn}">보기</button>
	</div>
</c:forEach>

</body>
<script type="text/javascript">
<%-- function viewer(isbn) {
	location.href="<%=request.getContextPath()%>/mypage/viewer?isbn="+isbn;
} --%>

//좋아요
$(document).on("click","button[name='viewer']", function(){
	var viewer_isbn = $(this).attr("viewer_isbn");
	var result = confirm("책을 보시겠습니까?");
	console.log(viewer_isbn);
    
    if(result){
    	location.href="viewer?isbn="+viewer_isbn;
	}else{
	    alert("취소하셨습니다");
	}
    
});
</script>
</html>