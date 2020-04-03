<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>책 정보</title>

</head>
<style>
* {
	margin: 0;
	padding: 0;
}

.star {
	display: inline-block;
	width: 30px;
	height: 60px;
	cursor: pointer;
}

.star_left {
	background: url(http://gahyun.wooga.kr/main/img/testImg/star.png)
		no-repeat 0 0;
	background-size: 60px;
	margin-right: -3px;
}

.star_right {
	background: url(http://gahyun.wooga.kr/main/img/testImg/star.png)
		no-repeat -30px 0;
	background-size: 60px;
	margin-left: -3px;
}

.star.on {
	background-image:
		url(http://gahyun.wooga.kr/main/img/testImg/star_on.png);
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.js"></script>

<body>
	<input type="hidden" id="book_isbn" name="book_isbn"
		value="${book_content_article.isbn}" />
		<%-- <button id="wish" name="wish" review_id="${reviewList.id }" review_isbn="${reviewList.isbn}">찜하기</button>
		<button id="mycart" name="mycart" review_id="${reviewList.id }" review_isbn="${reviewList.isbn}">장바구니</button> --%>
	<div id="book_content">
		<div id="detail_header">
			<table border="1">
				<tr>
					<td rowspan="5"><img class="images"
						src="<%=request.getContextPath()%>/view/images/carousel/${book_content_article.isbn}.jpg">

					</td>
				</tr>
				<tr>
					<td>${book_content_article.book_m_category }->${book_content_article.book_s_category }</td>
				</tr>
				<tr>
					<td><h2>${book_content_article.book_subject }</h2></td>
				</tr>
				<tr>
					<td>저자 : ${book_content_article.book_writer }</td>
				</tr>
				<tr>
					<td>가격 : ${book_content_article.book_price }</td>
				</tr>
			</table>

			<div id="meta_data">
				출간 일 : ${book_content_article.book_pday } 듣기 기능 : ox<br /> 파일 이름 :
				${book_content_article.book_filename }<br /> 파일 크기 :
				${book_content_article.book_filesize }
			</div>
		</div>

		<div id="summary">
			<h3>요약</h3>
			${book_content_article.book_summary }
		</div>

		<div id="review">
			<table border="1">
				<tr>
					<td>별점</td>
					<td>리뷰 쓰기</td>

				</tr>
				<tr>
					<td>
						<div class="star-box">
							<span class="star star_left"></span>
							<span class="star star_right"></span>
							<span class="star star_left"></span>
							<span class="star star_right"></span>
							<span class="star star_left"></span>
							<span class="star star_right"></span>
							<span class="star star_left"></span>
							<span class="star star_right"></span>
							<span class="star star_left"></span>
							<span class="star star_right"></span>
						</div>
					</td>
					<td><textarea id="review_content" name="review_content"
							rows="20" cols="20"></textarea></td>

				</tr>

			</table>
			<button id="review_submit" name="review_submit">리뷰 등록</button>


			<table border="1">
				<tr>
					<td>별점</td>
					<td>아이디</td>
					<td>책번호</td>
					<td>좋아요</td>
					<td>리뷰 내용~~~~~~~~~~~~~~~</td>					
				</tr>
				<c:forEach var="reviewList" items="${reviewList}">
					<tr>
						<td>별점${reviewList.rating }
							<c:forEach var="rating"
							begin="1" end="${ reviewList.rating }">★
							</c:forEach>
						</td>
						<td>아이디${reviewList.id }</td>
						<td>책번호${reviewList.isbn }</td>
						<td>좋아요 수 
							<fmt:formatNumber value="${reviewList.like_cnt }" type="number" maxFractionDigits="0"/>
						</td>
						<td>본 내용${reviewList.content }
						<button id="review_like" name="review_like" review_id="${reviewList.id }" review_isbn="${reviewList.isbn}">좋아요</button>
						</td>
						<td><button id="review_delete" name="review_delete" review_id="${reviewList.id }" review_isbn="${reviewList.isbn}">리뷰 삭제</button></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript">
	var x;
	$(".star").on('click', function() {
		var idx = $(this).index();
		$(".star").removeClass("on");
		for (var i = 0; i <= idx; i++) {
			$(".star").eq(i).addClass("on");
			console.log(i);
			x = i + 1;
			console.log(x);
		}
	});
	
	$(document).ready(function() {
		$("#review_submit").click(function() {
				//리뷰가 빈칸일때 에러
				if ($("#review_content").val() == "") {
					alert("내용을 입력하세요.");
					$("#review_content").focus();
					return false;
				}
				var review_content = $("#review_content").val().replace("\n", "<br>"); //개행처리
				var star = x;
				//값 셋팅
				var objParams = {
						//review_writer : "test",//리뷰어의 값 받아야함
						review_rating : star,
						review_book_isbn : $("#book_isbn").val(),
						review_content : review_content
				};
				$.ajax({
					url : "review/save",
					dataType : "json",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					type : "post",
					async : false, //동기: false, 비동기: ture
					data : objParams
				});
				$("#review_writer").val("");
				$("#review_content").val("");
			
				location.reload();
			});
	});
	
	//댓글 삭제
    $(document).on("click","button[name='review_delete']", function(){
    	var review_isbn = $(this).attr("review_isbn");
    	var review_id= $(this).attr("review_id");
    	console.log(review_isbn);
    	console.log(review_id);
      
        //값 셋팅
        var objParams = {
        		review_isbn        : review_isbn,
        		review_id        : review_id
        };
        
        //ajax 호출
        $.ajax({
            url            :    "review/del",
            dataType    :    "json",
            contentType :    "application/x-www-form-urlencoded; charset=UTF-8",
            type         :    "post",
            async        :     false, //동기: false, 비동기: ture
            data        :    objParams
            
        });
        location.reload();
        
    });
	
  	//좋아요
    $(document).on("click","button[name='review_like']", function(){
    	var review_isbn = $(this).attr("review_isbn");
    	var review_id= $(this).attr("review_id");
    	console.log(review_isbn);
    	console.log(review_id);
      
        //값 셋팅
        var objParams = {
        		review_isbn        : review_isbn,
        		review_id        : review_id
        };
        
        //ajax 호출
        $.ajax({
            url            :    "review/review_like",
            dataType    :    "json",
            contentType :    "application/x-www-form-urlencoded; charset=UTF-8",
            type         :    "post",
            async        :     false, //동기: false, 비동기: ture
            data        :    objParams
            
        });
        location.reload();
        
    });
</script>

</html>