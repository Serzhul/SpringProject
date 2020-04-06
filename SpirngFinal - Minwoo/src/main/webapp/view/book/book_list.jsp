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
			<div id="book_columns">
			<table border="1" >
					<tr>
						<td>isbn</td>
						<td>book_m_category</td>
						<td>book_s_category</td>
						<td>book_subject</td>
						<td>book_writer</td>
						<td>book_pday</td>
						<td width="300px">book_summary</td>
						<td>book_price</td>
					</tr>
				<c:forEach var="article" items="${booklist}">
					<tr>
						<td>${article.isbn }</td>
						<td>${article.book_m_category }</td>
						<td>${article.book_s_category }</td>
						<td>
						<a href="${pageContext.request.contextPath}/book/book_content?isbn=${article.isbn}">
						${article.book_subject }
						</a>
						</td>
						<td>${article.book_writer }</td>
						<td>${article.book_pday }</td>
						<td width="300px">${article.book_summary }</td>
						<td>${article.book_price }</td>
					</tr>
				
				</c:forEach>
				</table>
				
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
	</div>
</body>
</html>