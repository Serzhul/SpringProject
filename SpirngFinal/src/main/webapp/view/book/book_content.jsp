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
	<input type="hidden" id="book_isbn" name="book_isbn" value="${article.isbn}" />
	<div id="book_content">
		<div id="detail_header">
			<table border="1">
				<tr>
					<td rowspan="5"><img class="images"
						src="<%=request.getContextPath()%>/view/images/carousel/${article.isbn}.jpg">

					</td>
				</tr>
				<tr>
					<td>${article.book_m_category }->${article.book_s_category }</td>
				</tr>
				<tr>
					<td><h2>${article.book_subject }</h2></td>
				</tr>
				<tr>
					<td>저자 : ${article.book_writer }</td>
				</tr>
				<tr>
					<td>가격 : ${article.book_price }</td>
				</tr>
			</table>

			<div id="meta_data">
				출간 일 : ${article.book_pday } 듣기 기능 : ox<br /> 파일 이름 :
				${article.book_filename }<br /> 파일 크기 : ${article.book_filesize }
			</div>
		</div>

		<div id="summary">
			<h3>요약</h3>
			${article.book_summary }
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
							<span class="star star_left"></span> <span
								class="star star_right"></span> <span class="star star_left"></span>
							<span class="star star_right"></span> <span
								class="star star_left"></span> <span class="star star_right"></span>
							<span class="star star_left"></span> <span
								class="star star_right"></span> <span class="star star_left"></span>
							<span class="star star_right"></span>
						</div>
					</td>
					<td><textarea id="review_content" name="review_content" rows="20" cols="20"></textarea></td>

				</tr>

			</table>
			<button id="review_submit" name="review_submit">리뷰 등록</button>


			<table border="1">
				<tr>
					<td>별점</td>
					<td rowspan="2">본 내용~~~~~~~~~~~~~~~</td>
				</tr>
				<tr>
					<td>아이디</td>
				</tr>
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
			x=i+1;
			console.log(x);
		}
	});
	$(document).ready(function() {
		//리뷰가 빈칸일때 에러
		$("#review_submit").click(function() {
			if ($("#review_content").val() == "") {
				alert("내용을 입력하세요.");
				$("#review_content").focus();
				return false;
			}
			
			var review_content = $("#review_content").val().replace("\n", "<br>"); //개행처리
			var star=x;
			
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
				/* ,
				success : function(retVal) {
					if (retVal.code != "OK") {
						alert(retVal.message);
						return false;
					} else {
						reply_id = retVal.reply_id;
					}

				},
				error : function(request, status, error) {
					console.log("AJAX_ERROR");
				} */
			});
			
			$("#review_writer").val("");
	        $("#review_content").val("");
			
			
		});

		
	});
</script>

</html>