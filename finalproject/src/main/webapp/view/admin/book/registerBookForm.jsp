<%--
  Created by IntelliJ IDEA.
  User: gil
  Date: 2020-03-22
  Time: 오후 7:22
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
    <div class="grid-item" style="text-align: center">
        <form action="register_book" method="post" enctype="multipart/form-data">
            <div class="form-group" style="text-align: left">
                <label>책제목 </label><br>
                <input class="form-control" type="text" name="book_subject"><br><br>
                <label>ISBN </label><br>
                <input class="form-control" type="text" name="isbn"><br><br>
                <label>저자 </label><br>
                <input class="form-control" type="text" name="book_writer"><br><br>
                <label>출판일 </label><br>
                <input class="form-control" type="date" name="book_pday"><br><br>
                <label>가격 </label><br>
                <input class="form-control" type="text" name="book_price"><br><br>
                <label>전자책 사진</label><br>
                <input multiple="multiple" type="file" name="upload_image"><br>
                <label>전자책 파일</label><br>
                <input multiple="multiple" type="file" name="upload_file"><br>
            </div>
            <div style="margin-top: 30px;">
                <input type="radio" name="book_m_category" value="소설">소설
                <input type="radio" name="book_m_category" value="자기개발">자기개발
                <input type="radio" name="book_m_category" value="건강/다이어트">건강/다이어트
                <input type="radio" name="book_m_category" value="외국어">외국어
                <input type="radio" name="book_m_category" value="컴퓨터/IT">컴퓨터/IT
                <input type="radio" name="book_m_category" value="경영/경제">경영/경제
            </div>
            <div style="margin-top: 30px;">
                <input type="radio" name="book_s_category" value="일반">일반
                <input type="radio" name="book_s_category" value="SF">SF
                <input type="radio" name="book_s_category" value="추리">추리
                <input type="radio" name="book_s_category" value="판타지/무협">판타지/무협
                <input type="radio" name="book_s_category" value="로맨스">로맨스
                <input type="radio" name="book_s_category" value="성공/삶의자세">성공/삶의 자세
                <input type="radio" name="book_s_category" value="취업/창업">취업/창업
                <input type="radio" name="book_s_category" value="설득/화술/협상">설득/화술/협상
                <input type="radio" name="book_s_category" value="스마일/뷰티">스마일/뷰티
                <input type="radio" name="book_s_category" value="건강/다이어트">건강/다이어트
                <input type="radio" name="book_s_category" value="운동/스포츠">운동/스포츠

                <br>

                <input type="radio" name="book_s_category" value="비즈니스 영어">비즈니스 영어
                <input type="radio" name="book_s_category" value="일반 영어">일반 영어
                <input type="radio" name="book_s_category" value="제2 외국어">제2 외국어
                <input type="radio" name="book_s_category" value="IT비즈니스">IT비즈니스
                <input type="radio" name="book_s_category" value="IT자격증">IT자격정
                <input type="radio" name="book_s_category" value="개발/프로그래밍">개발/프로그래밍
                <input type="radio" name="book_s_category" value="IT해외원서">IT해외원서
                <input type="radio" name="book_s_category" value="경영 일반">경영 일반
                <input type="radio" name="book_s_category" value="경제 일반">경제 일반
                <input type="radio" name="book_s_category" value="마케팅/세일즈">마케팅/세일즈
                <input type="radio" name="book_s_category" value="CEO/리더쉽">CEO/리더쉽
            </div>
            <div style=" text-align: left; margin-top: 50px">
                <label>간략한 설명 입력</label>
                <textarea class="form-control" name="book_summary" style="width: 90%; height: 10em; resize: none; margin: auto"></textarea>
            </div>
            <div style="text-align: center; margin-top: 30px;">
                <button type="submit" class="btn btn-default">보내기</button>
            </div>
        </form>
    </div>
</div>
</body>