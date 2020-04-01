<%--
  Created by IntelliJ IDEA.
  User: gil
  Date: 2020-03-30
  Time: 오후 2:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>headless</title>
    <link rel="stylesheet" href="Shards-3.0.0/css/shards-demo.css">
    <link rel="stylesheet" href="Shards-3.0.0/css/shards-demo.css.map">
    <link rel="stylesheet" href="Shards-3.0.0/css/shards-demo.min.css">
    <link rel="stylesheet" href="Shards-3.0.0/css/shards-demo.min.css.map">
    <link rel="stylesheet" href="Shards-3.0.0/css/shards-extras.css">
    <link rel="stylesheet" href="Shards-3.0.0/css/shards-extras.css.map">
    <link rel="stylesheet" href="Shards-3.0.0/css/shards-extras.min.css">
    <link rel="stylesheet" href="Shards-3.0.0/css/shards-extras.min.css.map">
    <link rel="stylesheet" href="Shards-3.0.0/css/shards.css">
    <link rel="stylesheet" href="Shards-3.0.0/css/shards.css.map">
    <link rel="stylesheet" href="Shards-3.0.0/css/shards.min.css">
    <link rel="stylesheet" href="Shards-3.0.0/css/shards.min.css.map">
    <script src="Shards-3.0.0/jquery-3.4.1.min.js"></script>
    <script src="Shards-3.0.0/js/demo.js"></script>
    <script src="Shards-3.0.0/js/demo.min.js"></script>
    <script src="Shards-3.0.0/js/shards.js"></script>
    <script src="Shards-3.0.0/js/shards.min.js"></script>
    <style>
        .grid-container {/*그리드 구간이 필요할때마다 컬럼과 로우를 추가한다(tr,td하듯이)*/
            display: grid;
            grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr;/**/
            grid-template-rows: 1fr;
            padding: 10px;
        }
        /*쓰려는 용도에 맞추어 css를 적용*/
        .grid-top {
            padding: 40px;
            text-align: center;
            background-color: aqua;
            grid-column: 1/11;
        }
        .grid-side {
            padding: 5px;
            text-align: left;
            border: 1px solid black;
            background-color: chartreuse;
            grid-column: 1/2;
            grid-row: 2/6;
        }
        .grid-item {
            padding: 40px;
            text-align: center;
            border: 1px solid black;
            background-color: azure;
            grid-column: 2 / 5;
        }
        .grid-item2 {
            padding: 40px;
            text-align: center;
            border: 1px solid black;
            background-color: azure;
            grid-column: 5 / 8;
        }
        .grid-item3 {
            padding: 40px;
            text-align: center;
            border: 1px solid black;
            background-color: azure;
            grid-column: 8 / 11;
        }

    </style>

</head>

<body>
<div class="grid-container">
    <div class="grid-top"><a href="#"> 쌍용북스</a></div>
    <div class="grid-side">
        <h6>관리자홈</h6>
        <ul>
            <li><a href="#">리뷰관리</a></li>
            <li><a href="#">공지사항관리</a></li>
            <li><a href="#">문의사항관리</a></li>
            <li><a href="#">매출현황보기</a></li>
            <li><a href="#">상품등록하기</a></li>
        </ul>
    </div>
    <c:forEach items="${reviewList}" var="reviewList" varStatus="i">
        <c:forEach items="${reviewListBooksubject}" var="reviewListBooksubject" varStatus="5">
        <c:if test="${i.index%3 == 0}">
    <div class="grid-item">
        <div style="margin: 5%;">
            <img src="${pageContext.request.contextPath}/imgs/${reviewList.isbn}.jpg"
                 style="width:15em"/>
            <table style="margin: auto">
                <tr>
                    <td style="width:270px;">${reviewListBooksubject.book_subject}</td>
                </tr>
                <tr>
                    <td style="width:270px;">${reviewList.content}</td>
                </tr>
            </table>
        </div>
    </div>
        </c:if>
        <c:if test="${i.index%3==1}">
    <div class="grid-item2">
        <div style="margin: 5%;">
            <img src="${pageContext.request.contextPath}/imgs/${reviewList.isbn}.jpg"
                 style="width:15em"/>
            <table style="margin: auto">
                <tr>
                    <td style="width:270px;">${reviewListBooksubject.book_subject}</td>
                </tr>
                <tr>
                    <td style="width:270px;">${reviewList.content}</td>
                </tr>
            </table>
        </div>
    </div>
        </c:if>
        <c:if test="${i.index%3==2}">
    <div class="grid-item3">
        <div style="margin: 5%;">
            <img src="${pageContext.request.contextPath}/imgs/${reviewList.isbn}.jpg"
                 style="width:15em"/>
            <table style="margin: auto">
                <tr>
                    <td style="width:270px;">${reviewListBooksubject.book_subject}</td>
                </tr>
                <tr>
                    <td style="width:270px;">${reviewList.content}</td>
                </tr>
            </table>
        </div>
    </div>
    </c:if>
        </c:forEach>
</c:forEach>
</div>
</body>
</html>
