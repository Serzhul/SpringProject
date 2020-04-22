<%--
  Created by IntelliJ IDEA.
  User: gil
  Date: 2020-04-16
  Time: 오후 2:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>headless</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/admin/bootstrap3/css/bootstrap.css">
    <style>

        .grid-container {/*그리드 구간이 필요할때마다 컬럼과 로우를 추가한다(tr,td하듯이)*/
            display: grid;
            grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr;
            grid-template-rows: 1fr;
        }
        /*쓰려는 용도에 맞추어 css를 적용*/
        .grid-top {
            padding: 40px;
            text-align: center;
            grid-column: 1/11;
        }
        .grid-side {
            padding: 5px;
            text-align: left;
            border: 1px solid black;
            background-color: lawngreen;
            grid-column: 1/3;
            grid-row: 2/6;
        }
        .grid-item {
            padding: 40px;
            text-align: center;
            border: 1px solid black;
            background-color: lightgreen;
            grid-column:3 / 11;
        }
        .jumbotron{
            background-color: green;
            margin-bottom: 0px;
            background-image: url('../images/955519.png');
            height: 25em
        }
    </style>
</head>
<body>
<div class="grid-container">
    <div class="grid-top jumbotron" >
    </div>
    <div class="grid-side">
        <label style="color: white"><h1>관리메뉴</h1></label>
        <ul>
            <h3 style="color: white"><li><label><a href="${pageContext.request.contextPath}/admin/registered_book_list?page_num=1" style="color: white">상품 현황</a></label></li></h3>
            <h3 style="color: white"><li><label><a href="${pageContext.request.contextPath}/board/list?board_category=공지&page_num=1" style="color: white">공지사항관리</a></label></li></h3>
            <h3 style="color: white"><li><label><a href="${pageContext.request.contextPath}/board/list?board_category=문의&page_num=1" style="color: white">문의사항관리</a></label></li></h3>
            <h3 style="color: white"><li><label><a href="${pageContext.request.contextPath}/graph/saleGraph" style="color: white">판매현황보기</a></label></li></h3>
            <h3 style="color: white"><li><label><a href="${pageContext.request.contextPath}/admin/register_book" style="color: white">상품등록하기</a></label></li></h3>
            <h3 style="color: white"><li><label><a href="${pageContext.request.contextPath}/member/logout" style="color: white">로그아웃</a></label></li></h3>
        </ul>
    </div>
<%--    ${sessionScope.member.id}--%>
    <div class="grid-item" style="text-align: center">
        <form action="registered_notice" method="post" enctype="multipart/form-data">
            <div style="text-align: left">
                <input type="hidden" name="id" value="${sessionScope.member.id}">
                <input type="hidden" name="board_category" value="공지">

                <label>제목</label><br>
                <input class="form-control" type="text" name="board_subject"><br><br>

            </div>
            <div style="text-align: center; margin-top: 50px">
                <h3 style="text-align: left;"><label >공지글 입력</label></h3>
                <textarea name="board_content" style="width: 90%; height: 10em; resize: none;"></textarea>
            </div>
            <div style="text-align: center; margin-top: 30px;">
                <input type="submit" value="보내기">
            </div>
        </form>
    </div>
</div>
</body>
</html>
