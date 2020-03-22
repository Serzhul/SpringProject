<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style>
#page_search_result {
    padding-bottom: 70px;
}
.result_list_wrapper {
    width: 630px;
    float: left;
}

.result_list_wrapper .search_title_wrapper {
    font-size: 18px;
    color: #333;
    font-weight: 400;
    display: inline-block;
    line-height: 1.3em;
}
.result_list_wrapper .search_title_wrapper .search_title {
    font-weight: 700;
}

.book_macro_landscape {
    display: table;
    width: 100%;
    border-bottom: 1px solid #dfdfdf;
}

.book_macro_110 .book_thumbnail_wrapper {
    width: 110px;
}

.book_macro_landscape .book_metadata_wrapper, .book_macro_landscape .book_thumbnail_wrapper {
    display: table-cell;
    vertical-align: top;
    padding: 20px 15px;
}

.book_thumbnail_wrapper .book_thumbnail .thumbnail_btn {
    display: block;
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    z-index: 200;
    cursor: pointer;
    box-sizing: border-box;
}

.book_macro_landscape .book_metadata_wrapper {
    position: relative;
}

.book_metadata_wrapper .meta_title .title_link .title_text {
    font-weight: 400;
    color: #333;
}

.book_metadata_wrapper .author a, .book_metadata_wrapper .author span {
    font-size: 12px;
    color: #666;
    font-weight: 400;
    line-height: 1.2em;
    word-break: break-all;
}

.Rating-Star {
	width: 11px;
	height: 11px;
}
</style>
<body>
<section id="page_search_result">
<div class="result_list_wrapper">
<h3 class="search_title_wrapper" />
<span class="search_title">'${keyword}'</span> 검색결과

<c:forEach var="sr" items="${searchresult}">
<div class="book_macro_landscape">
<div class="book_macro_110">
<div class="book_thumbnail_wrapper">
<a class="book_thumnail" href="index"><img src="<%=request.getContextPath()%>/view/images/carousel/${sr.isbn}.jpg" style="width:110px"></a></div></div>
<div class="book_metadata_wrapper">
<div class="title_text">${sr.book_subject}</div>
<a class="author" style="font-size:12px">${sr.book_writer}</a>
</div>
</div>
</c:forEach>
</div>



</section>
</body>
</html>