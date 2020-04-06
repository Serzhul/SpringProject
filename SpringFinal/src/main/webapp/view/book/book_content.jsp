<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="model.MemberDataBean"%>
<% 
MemberDataBean m = new MemberDataBean();
m = (MemberDataBean)session.getAttribute("member"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>책 정보</title>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

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

#ridi_books {
	cursor: default;
	min-width: 320px;
}

#ridi_books div#books_contents {
	width: 100%;
	position: relative;
	overflow-x: hidden;
	overflow-y: hidden;
	min-height: 500px;
}

#page_detail {
	width: 1016px;
	margin: 0 auto 60px auto;
	border-top: none;
}

#page_detail .detail_wrap {
	display: table;
	width: 1016px;
}

#page_detail .detail_wrap .detail_body_wrap {
	width: 793px;
	background: #fff;
	display: table-cell;
	vertical-align: top;
}

#page_detail .detail_wrap .detail_body_wrap .detail_body {
	width: 793px;
	padding-bottom: 95px;
}

#page_detail .detail_wrap .detail_body_wrap .detail_body .detail_header
	{
	padding: 40px 29px;
}

#page_detail .detail_wrap .detail_body_wrap .detail_body .detail_header .header_info_wrap
	{
	width: 500px;
	float: right;
}

#page_detail .detail_wrap .detail_body_wrap .detail_body .detail_header .header_info_wrap .info_category_wrap
	{
	font-size: 12px;
	color: #333;
}

#page_detail .detail_wrap .detail_body_wrap .detail_body .detail_header .header_info_wrap .info_title_wrap
	{
	font-size: 30px;
	line-height: 1.3em;
	color: #333;
	font-weight: 700;
	word-break: keep-all;
	word-wrap: break-word;
	margin-top: 12px;
}

#page_detail .detail_wrap .detail_body_wrap .detail_body .detail_header .header_info_wrap .info_metadata_wrap
	{
	margin: 20px 0;
}

#page_detail .detail_wrap .detail_body_wrap .detail_body .detail_header .header_info_wrap .info_price_wrap
	{
	margin: 15px 0;
}

#page_detail .detail_wrap .detail_body_wrap .detail_body .detail_header .header_thumbnail_wrap
	{
	width: 220px;
	float: left;
}

#page_detail .detail_scalable_thumbnail .book_thumbnail_wrapper,
	#page_detail .detail_scalable_thumbnail .thumbnail_wrapper {
	cursor: pointer;
	cursor: zoom-in;
}

#page_detail .detail_wrap .detail_body_wrap .detail_body .detail_header .header_info_wrap
	{
	width: 500px;
	float: right;
}

.book_macro_200 .book_thumbnail_wrapper {
	width: 200px;
}

.book_thumbnail_wrapper .book_thumbnail {
	display: inline-block;
	position: relative;
	height: auto;
}

.book_thumbnail_wrapper .book_thumbnail .thumbnail_image {
	display: block;
	width: 100%;
	height: 100%;
	position: relative;
	background: #d9d9d9;
}

.book_thumbnail_wrapper .book_thumbnail .border {
	box-sizing: border-box;
	opacity: .1;
	display: block;
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	z-index: 3;
	border: 1px solid #000;
}

.book_macro_200 .book_thumbnail_wrapper .book_thumbnail .thumbnail_image .thumbnail
	{
	width: 200px;
	max-height: 433px;
}

#page_detail .detail_wrap .detail_body_wrap .detail_body .detail_header .Header_Metadata_Block
	{
	display: -ms-grid;
	display: grid;
	-ms-grid-columns: 260px auto;
	grid-template-columns: 260px auto;
	margin-top: 40px;
	padding: 20px 26px 13px;
	border: solid 4px #f2f4f5;
}

#page_detail .detail_wrap .detail_body_wrap .detail_body .detail_header .header_info_wrap .info_buttons_wrap
	{
	overflow: auto;
	margin-top: 15px;
}

.ridi-icon, [class*=" icon-"], [class^=icon-] {
	font-family: ridi-icon;
	speak: none;
	font-weight: 400;
	font-style: normal;
	text-decoration: inherit;
	text-transform: none;
	line-height: 1;
	text-rendering: auto;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

#page_detail .detail_wrap .detail_body_wrap .detail_body .detail_header .header_info_wrap .info_buttons_wrap .info_buttons .btn_cart,
	#page_detail .detail_wrap .detail_body_wrap .detail_body .detail_header .header_info_wrap .info_buttons_wrap .info_buttons .btn_gift,
	#page_detail .detail_wrap .detail_body_wrap .detail_body .detail_header .header_info_wrap .info_buttons_wrap .info_buttons .btn_present,
	#page_detail .detail_wrap .detail_body_wrap .detail_body .detail_header .header_info_wrap .info_buttons_wrap .info_buttons .btn_wish
	{
	width: 48px;
	font-size: 21px;
	text-align: center;
}

#page_detail .detail_wrap .detail_body_wrap .detail_body .detail_header .header_info_wrap .info_buttons_wrap .info_buttons a,
	#page_detail .detail_wrap .detail_body_wrap .detail_body .detail_header .header_info_wrap .info_buttons_wrap .info_buttons button
	{
	float: left;
	height: 48px;
	line-height: 46px;
	padding: 0;
	cursor: pointer;
}

.rui_button_white_50 {
	font-family: ridi-roboto, Helvetica Neue, Apple SD Gothic Neo, "나눔고딕",
		Nanum Gothic, "돋움", arial, Dotum, Tahoma, Geneva, sans-serif;
	letter-spacing: -.03em;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	margin: 0;
	padding: 0;
	-webkit-appearance: none;
	-webkit-tap-highlight-color: transparent;
	appearance: none;
	border: 0;
	box-shadow: none;
	outline: 0;
	text-decoration: none;
	box-sizing: border-box;
	border-radius: 4px;
	font-weight: 700;
	display: inline-block;
	text-align: center;
	cursor: pointer;
	line-height: 1em;
	vertical-align: baseline;
	-webkit-transition: background .2s, color .2s;
	transition: background .2s, color .2s;
	color: #808991;
	background: #fff;
	border: 1px solid #d1d5d9;
	box-shadow: 0 1px 1px 0 rgba(209, 213, 217, .3);
	font-size: 16px;
	padding: 16px 34px;
}

#page_detail .detail_wrap .detail_body_wrap .detail_body .detail_header .header_info_wrap .info_buttons_wrap .info_buttons
	{
	float: right;
}

ol, ul {
	list-style: none;
}

.rui_button_group_6>.rui_button_item:first-child {
	padding-left: 0;
}

.rui_button_group_6>.rui_button_item {
	padding: 0 2px 0 3px;
}

.rui_button_item {
	display: table-cell;
	vertical-align: middle;
	margin: 0;
	padding: 0;
}

li {
	line-height: initial;
}

#page_detail .detail_wrap .detail_body_wrap .detail_body .detail_header .header_info_wrap .info_buttons_wrap .info_buttons .btn_all_buy,
	#page_detail .detail_wrap .detail_body_wrap .detail_body .detail_header .header_info_wrap .info_buttons_wrap .info_buttons .btn_all_rent,
	#page_detail .detail_wrap .detail_body_wrap .detail_body .detail_header .header_info_wrap .info_buttons_wrap .info_buttons .btn_buy
	{
	padding: 0 16px;
	min-width: 112px;
	font-size: 15px;
}

#page_detail .detail_wrap .detail_body_wrap .detail_body .detail_header .header_info_wrap .info_buttons_wrap .info_buttons a,
	#page_detail .detail_wrap .detail_body_wrap .detail_body .detail_header .header_info_wrap .info_buttons_wrap .info_buttons button
	{
	float: left;
	height: 48px;
	line-height: 46px;
	padding: 0;
	cursor: pointer;
}

.rui_button_blue_50 {
	font-family: ridi-roboto, Helvetica Neue, Apple SD Gothic Neo, "나눔고딕",
		Nanum Gothic, "돋움", arial, Dotum, Tahoma, Geneva, sans-serif;
	letter-spacing: -.03em;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	margin: 0;
	padding: 0;
	-webkit-appearance: none;
	-webkit-tap-highlight-color: transparent;
	appearance: none;
	border: 0;
	box-shadow: none;
	outline: 0;
	text-decoration: none;
	box-sizing: border-box;
	border-radius: 4px;
	font-weight: 700;
	display: inline-block;
	text-align: center;
	cursor: pointer;
	line-height: 1em;
	vertical-align: baseline;
	-webkit-transition: background .2s, color .2s;
	transition: background .2s, color .2s;
	color: #fff;
	background: #1f8ce6;
	border: 1px solid #0077d9;
	box-shadow: 0 1px 1px 0 rgba(31, 140, 230, .3);
	font-size: 16px;
	padding: 16px 34px;
}

#page_detail .rsg_title01 {
	margin-bottom: 15px;
	padding: 10px 0 8px 0;
	border-bottom: 2px solid #7d8e9e;
}

#page_detail .rsg_title01 .title_text {
	display: inline-block;
	font-size: 20px;
	color: #59667a;
	font-weight: 700;
	letter-spacing: -.03em;
}

#page_detail .detail_box_module {
	padding: 0 29px 70px 29px;
}

#review_info_section .review_input_right .review_input_wrapper .star_rate_wrapper
	{
	position: relative;
	padding-bottom: 18px;
}

#review_info_section .review_input_right .review_input_wrapper .review_textarea_wrapper textarea
	{
	border: 2px solid #d1d5d9;
	border-radius: 5px;
	box-sizing: border-box;
	width: 100%;
	height: 112px;
	font-weight: 700;
	font-size: 13px;
	letter-spacing: -.03em;
	padding: 12px 15px;
	line-height: 1.5em;
	color: #a7b1bb;
	-webkit-appearance: none;
	resize: vertical;
}

button, img, input, select, textarea {
	vertical-align: middle;
	outline: 0;
}

#review_info_section .review_input_right {
	vertical-align: top;
}

.rui_button_blue_30 {
	font-family: ridi-roboto, Helvetica Neue, Apple SD Gothic Neo, "나눔고딕",
		Nanum Gothic, "돋움", arial, Dotum, Tahoma, Geneva, sans-serif;
	letter-spacing: -.03em;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	margin: 0;
	padding: 0;
	-webkit-appearance: none;
	-webkit-tap-highlight-color: transparent;
	appearance: none;
	border: 0;
	box-shadow: none;
	outline: 0;
	text-decoration: none;
	box-sizing: border-box;
	border-radius: 4px;
	font-weight: 700;
	display: inline-block;
	text-align: center;
	cursor: pointer;
	line-height: 1em;
	vertical-align: baseline;
	-webkit-transition: background .2s, color .2s;
	transition: background .2s, color .2s;
	color: #fff;
	background: #1f8ce6;
	border: 1px solid #0077d9;
	box-shadow: 0 1px 1px 0 rgba(31, 140, 230, .3);
	font-size: 12px;
	padding: 8px 18px;
}

#review_info_section .review_input_right .review_input_wrapper .write_review_bottom .buttons_wrapper
	{
	padding: 10px 0;
	height: 30px;
}

.write_review_bottom .buttons_wrapper .write_button_wrapper {
	float: right;
}

#review_list_section {
	margin-top: 25px;
}

#page_detail .detail_wrap .detail_body_wrap .detail_body .detail_review .review_list_wrapper.active
	{
	height: auto;
	opacity: 1;
}

#review_list_section .review_list_wrapper .review_list:first-child {
	border-top: 0;
}

#review_list_section .review_list_wrapper .review_list {
	padding-top: 14px;
	display: table;
	width: 100%;
	border-top: 1px solid #d1d5d9;
	border-bottom: 0;
}

#review_list_section .review_list_wrapper .review_list .list_left {
	display: table-cell;
	width: 115px;
	vertical-align: top;
	padding-top: 3px;
}

#review_list_section .review_list_wrapper .review_list .list_left .left_contents .star_rate
	{
	display: block;
	margin-bottom: 10px;
}

#review_list_section .review_list_wrapper .review_list .list_left .left_contents .reviewer_id
	{
	font-size: 12px;
	font-weight: 700;
	color: #212529;
}

#review_list_section .review_list_wrapper .review_list .list_right .review_status .review_recommend_count
	{
	text-align: right;
	white-space: nowrap;
}

#review_list_section .review_list_wrapper .review_list .list_right .review_content
	{
	padding-bottom: 10px;
	font-size: 13px;
	color: #212529;
	line-height: 1.7em;
	word-break: break-all;
}

#page_detail .detail_wrap .detail_body_wrap .detail_body .detail_review .review_list_wrapper
	{
	height: 0;
	overflow: hidden;
	opacity: 0;
	-webkit-transition: height .7s ease-in-out, opacity .7s ease-in-out;
	transition: height .7s ease-in-out, opacity .7s ease-in-out;
	-webkit-backface-visibility: hidden;
	backface-visibility: hidden;
	-webkit-transform: translateZ(0);
	-moz-transform: translateZ(0);
	-ms-transform: translateZ(0);
	-o-transform: translateZ(0);
	transform: translateZ(0);
}

#review_list_section .review_list_wrapper .review_list {
	padding-top: 14px;
	display: table;
	width: 100%;
	border-top: 1px solid #d1d5d9;
	border-bottom: 0;
}

#review_list_section .review_list_wrapper .review_list .list_left {
	display: table-cell;
	width: 115px;
	vertical-align: top;
	padding-top: 3px;
}

#review_list_section .review_list_wrapper .review_list .list_right {
	display: table-cell;
	vertical-align: top;
	padding-right: 1px;
}

#review_list_section .review_list_wrapper .review_list .list_right .review_status .review_recommend_count
	{
	text-align: right;
	white-space: nowrap;
}

#review_list_section .review_list_wrapper .review_list .list_right .review_status .review_recommend_count .comment_toggle_button
	{
	margin-right: 3px;
}

#review_list_section .review_list_wrapper .review_list .list_right .review_status .review_recommend_count .comment_toggle_button,
	#review_list_section .review_list_wrapper .review_list .list_right .review_status .review_recommend_count .like_button
	{
	position: relative;
	padding: 6px 10px;
}

.rui_button_white_25 {
	font-family: ridi-roboto, Helvetica Neue, Apple SD Gothic Neo, "나눔고딕",
		Nanum Gothic, "돋움", arial, Dotum, Tahoma, Geneva, sans-serif;
	letter-spacing: -.03em;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	margin: 0;
	padding: 0;
	-webkit-appearance: none;
	-webkit-tap-highlight-color: transparent;
	appearance: none;
	border: 0;
	box-shadow: none;
	outline: 0;
	text-decoration: none;
	box-sizing: border-box;
	border-radius: 4px;
	font-weight: 700;
	display: inline-block;
	text-align: center;
	cursor: pointer;
	line-height: 1em;
	vertical-align: baseline;
	-webkit-transition: background .2s, color .2s;
	transition: background .2s, color .2s;
	color: #808991;
	background: #fff;
	border: 1px solid #d1d5d9;
	box-shadow: 0 1px 1px 0 rgba(209, 213, 217, .3);
	font-size: 11px;
	padding: 6px 14px;
}

.nav-subbar-icon {
	font-size: 20px;
}

.like_count {
	font-size: 16px;
	display: inline-block;
}

#review_list_section .review_list_wrapper .review_list .list_left .left_contents .review_date_and_report_wrapper .report_button,
	#review_list_section .review_list_wrapper .review_list .list_left .left_contents .review_date_and_report_wrapper .review_date
	{
	color: #808991;
	font-size: 12px;
	line-height: 16px;
}

#review_list_section .review_list_wrapper .review_list .list_left .left_contents .review_date_and_report_wrapper
	{
	display: block;
	margin-top: 7px;
	padding-bottom: 4px;
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.js"></script>

<body id="ridi_books">
	<div id="base_contents_wrapper">
		<div id="page_detail">
			<div class="detail_wrap">
				<div class="detail_body_wrap">
					<section class="detail_body">
						<input type="hidden" id="book_isbn" name="book_isbn"
							value="${book_content_article.isbn}" />
						<%-- <button id="wish" name="wish" review_id="${reviewList.id }" review_isbn="${reviewList.isbn}">찜하기</button>
		<button id="mycart" name="mycart" review_id="${reviewList.id }" review_isbn="${reviewList.isbn}">장바구니</button> --%>

						<article class="detail_header">


							<div class="header_info_wrap">
								<p class="info_category_wrap">

									${book_content_article.book_m_category }->${book_content_article.book_s_category }
								</p>
								<div class="info_title_wrap">
									${book_content_article.book_subject }</div>
								<div class="info_metadata_wrap">저자 :
									${book_content_article.book_writer }</div>
								<div class="info_price_wrap">가격 :
									${book_content_article.book_price }</div>



							</div>



							<div class="header_thumbnail_wrap">
								<div
									class="header_thumbnail book_macro_200 detail_scalable_thumbnail">
									<div class="book_thumbnail_wrapper">
										<div class="book_thumbnail">
											<div class="thumbnail_image">
												<img class="thumbnail"
													src="<%=request.getContextPath()%>/view/images/carousel/${book_content_article.isbn}.jpg">
												<span class="border"></span>
											</div>
										</div>
									</div>
								</div>
							</div>


							<div class="info_buttons_wrap">
								<ul class="info_buttons rui_button_group_6">
									<li class="rui_button_item">
										<button type="button"
											class="rui_button_white_50 btn_wish js_add_wishlist trackable">
											<i class="material-icons nav-subbar-icon">favorite</i>
										</button>
									</li>
									<li class="rui_button_item">
										<button type="button"
											class="rui_button_white_50 btn_cart js_add_cart trackable">
											<i class="material-icons nav-subbar-icon">add_shopping_cart</i>
										</button>
									</li>

									<li class="rui_button_item"><a
										class="rui_button_blue_50 btn_all_buy" href="#">구매하기</a></li>


								</ul>
							</div>

							<div class="Header_Metadata_Block">
								<div id="meta_data">
									출간 일 : ${book_content_article.book_pday } <br /> 듣기 기능 : ox <br />
								</div>
							</div>




							<div id="summary">
								<h3>요약</h3>
								${book_content_article.book_summary }
							</div>
						</article>

						<article id="detail_review"
							class="detail_box_module detail_review js_detail_review">
							<div class=rsg_title01">
								<h3 class="title_text">리뷰</h3>
							</div>
							<div id="review_info_section">
								<div class="review_input_right">
									<div
										class="review_input_wrapper js_review_input_wrapper rate_after">
										<div class="star_rate_wrapper js_star_rate_wrapper"></div>

										<div class="star-box">
											<span class="star star_left"></span> <span
												class="star star_right"></span> <span class="star star_left"></span>
											<span class="star star_right"></span> <span
												class="star star_left"></span> <span class="star star_right"></span>
											<span class="star star_left"></span> <span
												class="star star_right"></span> <span class="star star_left"></span>
											<span class="star star_right"></span>
										</div>

										<div
											class="review_textarea_wrapper js_review_textarea_wrapper">
											<textarea id="review_content" name="review_content"
												class="review_input_textarea js_review_input_textarea"
												placeholder="리뷰 작성 시 광고 및 욕설, 비속어나 타인을 비방하는 문구를 사용하시면 비공개될 수 있습니다."></textarea>
										</div>
									</div>
								</div>
								
								<c:if test="${reviewcheck eq 'no'}">
									<div class="write_review_bottom">
										<div class="buttons_wrapper">
											<div class="write_button_wrapper">
												<button id="review_submit" name="review_submit"
													class="rui_button_blue_30 js_review_write_btn write_button disabled">리뷰
													등록												
												</button>
											</div>
										</div>
									</div>
								
								</c:if>
								
							</div>
							<br /> <br />

							<div id="review_list_section">
								<div class="review_list_wrapper js_review_list_wrapper active">
									<ul>

										<c:forEach var="reviewList" items="${reviewList}">
											<li class="review_list">
												<div class="list_left js_review_info_wrapper">
													<div class="left_contents">
														<p>
															<span class="star_rate"> <c:forEach var="rating"
																	begin="1" end="${ reviewList.rating }">★
									</c:forEach>
															</span> <span class="reviewer_id"> ${reviewList.id } </span>
														</p>

														<ul class="review_date_and_report_wrapper">
															<li class="review_date">${reviewList.regdate}</li>
														</ul>
													</div>

												</div>

												<div class="list_right js_review_info_wrapepr">

													<p class="review_content js_review_content">
														<span> ${reviewList.content } </span>
													</p>

													<div class="review_status">
														<div
															class="review_recommend_count js_review_recommend_count">

															<c:if test="${reviewList.writercheck eq 'yes'}">
																<button id="review_like" name="review_like"
																	review_num="${reviewList.num}"
																	review_id="${reviewList.id }"
																	review_isbn="${reviewList.isbn}"
																	login_id="<%=m.getId()%>"
																	class="rui_button_white_25 like_button js_like_button">
																	<i class="material-icons nav-subbar-icon">thumb_up</i> <span
																		class="like_count"> <fmt:formatNumber
																			value="${reviewList.like_cnt }" type="number"
																			maxFractionDigits="0" />
																	</span>
																</button>
															</c:if>
															<c:if test="${reviewList.writercheck eq 'No'}">
																<button id="review_like_no" name="review_like_no"
																	class="rui_button_white_25 like_button js_like_button">
																	<i class="material-icons nav-subbar-icon">thumb_up</i> <span
																		class="like_count"> <fmt:formatNumber
																			value="${reviewList.like_cnt }" type="number"
																			maxFractionDigits="0" />
																	</span>
																</button>
															</c:if>
															
															
															<c:set var="mId" value="<%=m.getId()%>"/>
															<c:if test="${reviewList.id eq mId}">
																<button id="review_delete" name="review_delete"
																	review_id="${reviewList.id }"
																	review_isbn="${reviewList.isbn}"
																	class="rui_button_white_25 like_button js_like_button">

																	<i class="material-icons nav-subbar-icon">delete</i>삭제
															</button>
															</c:if>

														</div>
													</div>
												</div>
											</li>



										</c:forEach>
									</ul>
								</div>
							</div>
						</article>
				</div>
			</div>
		</div>
	</div>
	</section>
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
						review_writer : '<%= m.getId()%>',//리뷰어의 값 받아야함
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
    	var review_num = $(this).attr("review_num");
    	var review_isbn = $(this).attr("review_isbn");
    	var review_id= $(this).attr("review_id");
    	var login_id= $(this).attr("login_id");
    	console.log(review_isbn);
    	console.log(review_id);
    	console.log(login_id);
      
        //값 셋팅
        var objParams = {
        		review_num			: review_num,
        		review_isbn        : review_isbn,
        		review_id        : review_id,
        		login_id        : login_id
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