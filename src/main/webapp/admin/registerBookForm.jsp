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
            grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr;
            grid-template-rows: 1fr;
            margin: 0 300px 0 300px;
        }
        /*쓰려는 용도에 맞추어 css를 적용*/
        .grid-top {
            padding: 40px;
            text-align: center;
            background-color: chartreuse;
            grid-column: 1/11;
        }
        .grid-side {
            padding: 5px;
            text-align: left;
            border: 1px solid black;
            background-color: greenyellow;
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

    </style>

</head>

<body>

<div class="grid-container">
    <div class="grid-top">
        <a href="#">쌍용북스</a>
    </div>
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
    <div class="grid-item" style="text-align: center">
        <form action="registerBook" method="post" enctype="multipart/form-data">
            <div style="text-align: left">
                <label style="margin-left: 100px;">책제목 :</label><br>
                <input type="text" name="book_subject" style="margin-left: 100px;"><br><br>
                <label style="margin-left: 100px;">ISBN :</label><br>
                <input type="text" name="isbn" style="margin-left: 100px;"><br><br>
                <label style="margin-left: 100px;">저자 :</label><br>
                <input type="text" name="book_writer" style="margin-left: 100px;"><br><br>
                <label style="margin-left: 100px;">출판일 :</label><br>
                <input type="date" name="book_pday" style="margin-left: 100px;"><br><br>
                <label style="margin-left: 100px;">가격 :</label><br>
                <input type="text" name="book_price" style="margin-left: 100px;"><br><br>
                <label style="margin-left: 100px;">전자책 파일 업로드 :</label><br>
                <input multiple="multiple" type="file" name="upload_file" style="margin-left: 100px;"><br>
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
            <div style="text-align: center; margin-top: 50px">
                <h6>간략한 설명 입력</h6>
                <textarea name="book_summary" style="width: 60em; height: 10em; resize: none;"></textarea>
            </div>
            <div style="text-align: center; margin-top: 30px;">
                <input type="submit" value="보내기">
            </div>
        </form>
    </div>
</div>
</body>
</html>