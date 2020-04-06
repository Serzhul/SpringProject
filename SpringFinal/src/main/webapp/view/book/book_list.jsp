<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>

<style>
		.main_category_wrapper{
			width: 200px;
			height: 600px;
			border: 2px solid #e91bf5;
		}
		.box-container div{
			padding: 10px;
			border: 1px solid green;
			background-color: #e3ffe0;
		}
		#list_menu { position: absolute; top: 20px; left: 30px; }
		#content_page { position: absolute; top: 20px; left: 300px; }
		#box3 { position: absolute; top: 20px; right: 30px; }
		#box4 { position: fixed; top: 20px; right: 30px; }
		
		.module_category_section {
    margin-top: 30px;
}

.book_macro_column_5 {
    width: 20%;
    float: left;
    margin-top: 20px;
}

.book_macro_portrait {
    text-align: center;
}

.book_macro_portrait .book_thumbnail_wrapper {
    position: relative;
    text-align: left;
    display: block;
    margin: 0 auto;
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
.book_metadata_wrapper {
    cursor: default;
}

.book_macro_portrait .book_metadata_wrapper {
    text-align: left;
    display: block;
    margin: 8px auto 0 auto;
}

.book_thumbnail_wrapper .book_thumbnail .thumbnail_image {
    display: block;
    width: 100%;
    height: 100%;
    position: relative;
    background: #d9d9d9;
}

.book_thumbnail_wrapper .book_thumbnail {
    display: inline-block;
    position: relative;
    height: auto;
}

.book_macro_110 .book_macro_portrait .book_thumbnail_wrapper {
    height: 167px;
}

.book_macro_110 .book_thumbnail_wrapper {
    width: 180px;
}

.thumnail_image {
width: 100px;
    height: 140px;
}

.book-list-thumbnail {
    display: block;
    box-sizing: border-box;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(to right, rgba(0, 0, 0, .2) 0, rgba(0, 0, 0, 0) 5%, rgba(0, 0, 0, 0) 95%, rgba(0, 0, 0, .2) 100%);
    border: solid 1px rgba(0, 0, 0, .1);
    content: '';
}

.book_macro_110.book_macro_portrait .book_metadata_wrapper {
    width: 170px;
}

.book_macro_portrait .book_metadata_wrapper {
    text-align: left;
    display: block;
    margin: 8px auto 0 auto;
}

.book_metadata_wrapper {
    cursor: default;
}

.book_metadata_wrapper .meta_title .title_link .title_text {
    font-size: 13px;
    line-height: 1.4em;
    font-weight: 700;
    color: #333;
    word-break: keep-all;
    text-overflow: ellipsis;
    display: block;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    word-wrap: break-word;
    word-break: break-all;
    white-space: normal;
    max-height: 2.7em;
    overflow: hidden;
    
}

.title_link {
text-decoration:none;}

.book_macro_portrait .book_metadata_wrapper .author {
    word-break: keep-all;
    text-overflow: ellipsis;
    display: block;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    word-wrap: break-word;
    word-break: break-all;
    white-space: normal;
    max-height: 3.1em;
    overflow: hidden;
}

.StarRate_IconBox {
	position: relative;
	margin-top: -1px;
	margin-right: 1px;
	vertical-align: -11%;
	font-size: 0;
	overflow: hidden;
}

.Rating-Star {
	width: 11px;
	height: 11px;
}

.Rating-Member {
	color: #999;
	font-size: 11px;
	line-height: 1em;
	vertical-align: -35%;
}

.book_metadata_wrapper .author a, .book_metadata_wrapper .author span {
    font-size: 12px;
    color: #666;
    font-weight: 400;
    line-height: 1.2em;
    word-break: break-all;
}

.book_macro_portrait .book_metadata_wrapper .book_button, .book_macro_portrait .book_metadata_wrapper .book_metadata {
    margin-top: 3px;
}





	</style>
</head>
<body>
	<div id="list_menu">
		<ul class="main_category_wrapper">
			<li class="main_category_list">
				<a class="" href="">소설</a>
				<ul class="sub_category_wrapper">
					<li class="sub_category_list">
						<a class="" href="">소설 전체</a>
					</li>
					<li class="sub_category_list">
						<a class="" href="">일반</a>
					</li>
					<li class="sub_category_list">
						<a class="" href="">SF</a>
					</li>
					<li class="sub_category_list">
						<a class="" href="">추리</a>
					</li>
					<li class="sub_category_list">
						<a class="" href="">판타지 무협</a>
					</li>
					<li class="sub_category_list">
						<a class="" href="">로맨스</a>
					</li>
				</ul>
			
			</li>
			<li class="main_category list"><a class="" href="">자기 계발</a></li>
			<li class="main_category list"><a class="" href="">건강/다이어트</a></li>
			<li class="main_category list"><a class="" href="">외국어</a></li>
			<li class="main_category list"><a class="" href="">컴퓨터/IT</a></li>
			<li class="main_category list"><a class="" href="">경영/경제</a></li>
		</ul>
	</div>
	
	<div id="content_page">
		<div id="selected_category">
			선택한 카테고리
		</div>
		<div id="book_popular_list">
			<div id="book_popular_title">
				<h3>신간|베스트 셀러|전체</h3>
			</div>
			
				<c:forEach var="article" items="${booklist}">
				<div class="book_macro_110 book_macro_column_5 book_macro_portrait">
					<div class="book_thumbnail_wrapper">
					<div class="book_thumbnail">
						<div class="thumnail_image">
						<img
						src="<%=request.getContextPath()%>/view/images/carousel/${article.isbn}.jpg"
						class="book-list-thumbnail">
						</div>
					</div>
					</div>
					<div class="book_metadata_wrapper">
					<h3 class="meta_title">
					
					<a class="title_link" href="${pageContext.request.contextPath}/book/book_content?isbn=${article.isbn}">
						
						<span class="title_text js_highlight_helper">
							${article.book_subject }
						</span></a>
						</h3>
					
						<p class="book_metadata author">
						<a>${article.book_writer }</a></p>
					
					
					
				</div>
				</div>
				</c:forEach>
				
				
				<c:if test="${startPage > bottomLine}">

					<a href="book_list?pageNum=${startPage - bottomLine}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="book_list?pageNum=${i}">[${i}]</a>
				</c:forEach>



				<c:if test="${endPage < pageCount}">
					<a href="book_list?pageNum=${startPage + bottomLine}">[다음]</a>
				</c:if>
				
		</div>
	</div>
</body>
</html>