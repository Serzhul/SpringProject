<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
	
<Style>
#page_cart {
    position: relative;
    width: 952px;
    margin: 30px auto 100px auto;
}

#page_cart .article_title {
    font-size: 24px;
    font-weight: 700;
    color: #000;
    line-height: 1em;
    margin-bottom: 14px;
}
#page_cart .cart_wrapper {
    position: relative;
}

#page_cart .cart_tab_wrapper {
    width: 620px;
    display: table;
    table-layout: fixed;
    box-sizing: border-box;
    border: 1px solid #d1d5d9;
    border-bottom: none;
}

#page_cart .checkout_form {
    width: 620px;
}

#page_cart .cart_summary_wrapper {
    position: absolute;
    width: 290px;
    top: 0;
    right: 0;
    cursor: default;
}

#page_cart .cart_summary_wrapper .summary_box_wrapper .summary_box {
    border: 1px solid #87b4e9;
}

#page_cart .cart_summary_wrapper .summary_box_wrapper .buy_button {
    width: 100%;
    margin-top: 10px;
    font-size: 16px;
}

.blue_button {
    -webkit-appearance: none;
    border: none;
    display: inline-block;
    text-align: center;
    font-size: 16px;
    padding: 1em;
    font-weight: 700;
    letter-spacing: -.03em;
    box-sizing: border-box;
    border-radius: 4px;
    -webkit-transition: background .3s;
    transition: background .3s;
    color: #fff;
    background: #1f8ce6;
    border: 1px solid #1f8ce6;
    box-shadow: 0 2px 4px 0 rgba(31,140,230,.3);
}

#page_cart .checkout_form .cart_list_wrapper .cart_list_box {
    position: relative;
    border: 1px solid #d1d5d9;
    border-top: none;
}

#page_cart .checkout_form .cart_list_wrapper .module_list_handler {
    padding: 15px 20px;
}

.module_list_handler {
    clear: both;
    display: table;
    padding: 15px 0;
    width: 100%;
    box-sizing: border-box;
}

.module_list_handler .total_checkbox {
    display: table-cell;
    vertical-align: middle;
    font-size: 13px;
    font-weight: 700;
    color: #636c73;
}

.module_list_handler .total_checkbox input {
    margin-right: 7px;
}

.module_list_handler .buttons_wrapper {
    display: table-cell;
    vertical-align: middle;
    text-align: right;
}

[class*=" rui_button_group_"], [class^=rui_button_group_] {
    display: inline-table;
    white-space: nowrap;
    list-style: none;
    margin: 0;
    padding: 0;
}

.rui_button_group_5>.rui_button_item:first-child {
    padding-left: 0;
}

.rui_button_group_5>.rui_button_item {
    padding: 0 2px;
}

.rui_button_item {
    display: table-cell;
    vertical-align: middle;
    margin: 0;
    padding: 0;
}

#page_cart .checkout_form .cart_list_wrapper .bookmacro_wrapper {
    padding: 0 20px 0 20px;
}

#page_cart .checkout_form .cart_list_wrapper .bookmacro_wrapper .book_macro_landscape:first-child {
    border-top: 1px solid #e6e8eb;
}

.book_macro_landscape {
    display: table;
    width: 100%;
    border-bottom: 1px solid #dfdfdf;
}

.book_macro_landscape .book_thumbnail_wrapper.has_checkbox {
    padding: 20px 0 20px 28px;
}

.book_macro_60.book_macro_landscape .book_thumbnail_wrapper {
    padding: 15px 0 15px 8px;
}

.book_macro_landscape .book_thumbnail_wrapper {
    padding-right: 0;
}

.book_macro_landscape .book_metadata_wrapper, .book_macro_landscape .book_thumbnail_wrapper {
    display: table-cell;
    vertical-align: top;
    padding: 20px 15px;
}

.book_macro_60 .book_thumbnail_wrapper {
    width: 60px;
}

.book_thumbnail_wrapper .book_thumbnail {
    display: inline-block;
    position: relative;
    height: auto;
}

.book_macro_landscape .table_cell_wrapper {
    display: table-cell;
    vertical-align: middle;
    padding: 10px 0 15px 0;
}

.book_macro_landscape .table_cell_wrapper .table_wrapper {
    display: table;
    width: 100%;
}

.book_macro_landscape .table_cell_wrapper .table_wrapper .book_metadata_wrapper {
    padding: 0 8px 15px 15px;
}

.book_macro_landscape.book_macro_metadata_portrait .book_metadata_wrapper .book_metadata {
    display: block;
    margin-top: 3px;
}

.book_macro_landscape .book_metadata_wrapper .book_metadata.meta_sub_title, .book_macro_landscape .book_metadata_wrapper .book_metadata.meta_title {
    margin-bottom: 7px;
}

.book_macro_landscape.book_macro_metadata_portrait .book_metadata_wrapper .book_metadata.author, .book_macro_landscape.book_macro_metadata_portrait .book_metadata_wrapper .book_metadata.book_count, .book_macro_landscape.book_macro_metadata_portrait .book_metadata_wrapper .book_metadata.genre, .book_macro_landscape.book_macro_metadata_portrait .book_metadata_wrapper .book_metadata.publisher, .book_macro_landscape.book_macro_metadata_portrait .book_metadata_wrapper .book_metadata.translator {
    height: auto;
    padding: 0;
    margin-left: 0;
}

.book_macro_landscape.book_macro_metadata_portrait .book_metadata_wrapper .book_metadata {
    display: block;
    margin-top: 3px;
}

.book_metadata_wrapper .author {
    font-size: 12px;
    color: #666;
    font-weight: 400;
    line-height: 1.2em;
    word-break: break-all;
    line-height: 1.5em;
}

.book_macro_landscape.book_macro_metadata_portrait .book_metadata_wrapper .book_metadata.author a, .book_macro_landscape.book_macro_metadata_portrait .book_metadata_wrapper .book_metadata.book_count a, .book_macro_landscape.book_macro_metadata_portrait .book_metadata_wrapper .book_metadata.genre a, .book_macro_landscape.book_macro_metadata_portrait .book_metadata_wrapper .book_metadata.publisher a, .book_macro_landscape.book_macro_metadata_portrait .book_metadata_wrapper .book_metadata.translator a {
    display: inline;
    margin-top: 0;
}

.book_macro_landscape .table_cell_wrapper .table_wrapper .book_price_wrapper {
    display: table-cell;
    vertical-align: middle;
}

.book_macro_landscape .table_cell_wrapper .cart_wish_buttons_wrapper {
    padding: 0 0 0 15px;
}

.rui_button_group_5>.rui_button_item:first-child {
    padding-left: 0;
}

.rui_button_item {
    display: table-cell;
    vertical-align: middle;
    margin: 0;
    padding: 0;
}

.rui_button_white_30 {
    font-family: ridi-roboto,Helvetica Neue,Apple SD Gothic Neo,"나눔고딕",Nanum Gothic,"돋움",arial,Dotum,Tahoma,Geneva,sans-serif;
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
    -webkit-transition: background .2s,color .2s;
    transition: background .2s,color .2s;
    color: #808991;
    background: #fff;
    border: 1px solid #d1d5d9;
    box-shadow: 0 1px 1px 0 rgba(209,213,217,.3);
    font-size: 12px;
    padding: 8px 18px;
}

.book_thumbnail_wrapper .book_thumbnail .thumbnail_image {
    display: block;
    width: 100%;
    height: 100%;
    position: relative;
    background: #d9d9d9;
}

.book_macro_60 .book_thumbnail_wrapper .book_thumbnail .thumbnail_image .thumbnail {
    width: 60px;
    max-height: 87px;
}

.book_thumbnail_wrapper .book_thumbnail .thumbnail_image .thumbnail {
    width: 100%;
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
    background: url(../images/bg_dummy_forIE.png) repeat left top;
    box-sizing: border-box;
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

#page_cart .cart_summary_wrapper .summary_box_wrapper .summary_box .total_price_wrapper {
    padding: 20px;
    background: #ebf6ff;
}

#page_cart .cart_summary_wrapper {
    position: absolute;
    width: 290px;
    top: 0;
    right: 0;
    cursor: default;
}

#page_cart .cart_summary_wrapper .summary_box_wrapper .summary_box .count_wrapper {
    padding: 20px 20px 0 20px;
    color: #5382b9;
    font-size: 12px;
    font-weight: 700;
}

#page_cart .cart_summary_wrapper .summary_box_wrapper .summary_box .count_wrapper .icon-check_2 {
    display: inline-block;
    vertical-align: -10%;
    color: #87b4e9;
    font-size: 16px;
}

#page_cart .cart_summary_wrapper .summary_box_wrapper .summary_box .discount_price_info li .table_wrapper {
    display: table;
    width: 100%;
}

.book_thumbnail_wrapper .book_thumbnail {
    display: inline-block;
    position: relative;
    height: auto;
}

#page_cart .checkout_form .cart_list_wrapper .cart_list_box {
    position: relative;
    border: 1px solid #d1d5d9;
    border-top: none;
}

#ridi_books div#books_contents {
    width: 100%;
    position: relative;
    overflow-x: hidden;
    overflow-y: hidden;
    min-height: 500px;
}

#page_cart .cart_tab_wrapper .cart_tab.selected {
    background: #fff;
    border-bottom: none;
}

#page_cart .cart_tab_wrapper .cart_tab:first-child {
    border-left: none;
}


#page_cart .cart_tab_wrapper .cart_tab {
    display: table-cell;
    background: #f2f4f5;
    border-bottom: 1px solid #e6e8eb;
    box-sizing: border-box;
    border-left: 1px solid #e6e8eb;
}

#page_cart .checkout_form .cart_list_wrapper .bookmacro_wrapper .book_metadata_wrapper .meta_title .title_link .title_text {
    font-size: 16px;
}

/* .rui_checkbox_label:before {
    content: '';
    background: #fff;
    display: block;
    width: 18px;
    height: 18px;
    box-sizing: border-box;
    position: absolute;
    left: 0;
    top: 50%;
    margin-top: -9px;
    border-radius: 2px;
    border: 1px solid #d1d5d9;
    -webkit-transition: background .2s,border-color .2s;
    transition: background .2s,border-color .2s;
}

.rui_checkbox_label:after {
    content: '';
    display: inline-block;
    text-indent: -444px;
    font-size: 0;
    overflow: hidden;
    background: url(data:image/svg+xml,%3Csvg%20viewBox%3D%220%200%2048%2048%22%20xmlns%3D%22ht….2%201.8%204%201.8%202%200%203.2-.7%204-1.8l25-38.9.3-.6z%22/%3E%3C/svg%3E) center center no-repeat;
    background-size: 100% 100%;
    width: 10px;
    height: 10px;
    position: absolute;
    left: 4px;
    top: 50%;
    margin-top: -5px;
} */

.book_thumbnail_wrapper .book_thumbnail .thumbnail_checkbox {
    display: block;
    position: absolute;
    left: -22px;
    top: 10px;
}

.book_price_wrapper ul .coupon_price strong {
    color: #1f8ce6;
}

.book_price_wrapper {
    cursor: default;
    text-align: right;
}

#page_cart .cart_summary_wrapper .summary_box_wrapper .summary_box .info_title, #page_cart .cart_summary_wrapper .summary_box_wrapper .summary_box .total_text {
    font-weight: 700;
    font-size: 13px;
    color: #738096;
}

.info_value {
    display: table-cell;
    vertical-align: middle;
    text-align: right;
    font-weight: 700;
    font-size: 13px;
    color: #40474d;
}

#page_cart .cart_summary_wrapper .summary_box_wrapper .summary_box .discount_price_info li .table_wrapper .info_value {
    display: table-cell;
    vertical-align: middle;
    text-align: right;
    font-weight: 700;
    font-size: 13px;
    color: #40474d;
}

#page_cart .cart_summary_wrapper .summary_box_wrapper .summary_box .discount_price_info {
    margin-bottom: 20px;
}

#page_cart .cart_summary_wrapper .summary_box_wrapper .summary_box .discount_price_info li .table_wrapper .info_title {
    display: table-cell;
    vertical-align: middle;
    text-align: left;
}

#page_cart .cart_summary_wrapper .summary_box_wrapper .summary_box .discount_price_info li {
    padding: 15px 20px 0 20px;
}

ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}

#page_cart .cart_summary_wrapper .summary_box_wrapper .summary_box .discount_price_info {
    margin-bottom: 20px;
}

#page_cart .cart_summary_wrapper .summary_box_wrapper .summary_box .total_price_wrapper .table_wrapper .total_price {
    display: table-cell;
    vertical-align: middle;
    text-align: right;
    font-size: 20px;
    font-weight: 700;
    color: #1f8ce6;
}

p {
    margin: 0;
    padding: 0;
}

#page_cart .cart_summary_wrapper .summary_box_wrapper .summary_box .total_price_wrapper .table_wrapper .total_text {
    display: table-cell;
    vertical-align: middle;
    text-align: left;
}

#page_cart .cart_summary_wrapper .summary_box_wrapper .summary_box .total_price_wrapper .table_wrapper .total_price {
    display: table-cell;
    vertical-align: middle;
    text-align: right;
    font-size: 20px;
    font-weight: 700;
    color: #1f8ce6;
}

#page_cart .cart_summary_wrapper .summary_box_wrapper .summary_box .total_price_wrapper .table_wrapper {
    display: table;
    width: 100%;
}
</Style>
</head>
<body id="ridi">

<div id="books_contents">

<section id="page_cart">
	<h2 class="article_title">
	카트
	</h2>
		<div class="cart_wrapper js_cart_wrapper">
			<div class="checkout_form">
			
			
			<article class="cart_summary_wrapper">
			<div class="summary_box_wrapper js_summary_box_wrapper">
				<div class="summary_box">
				<p class="count_wrapper">
				<span class="icon-check_2">
				
				</span>
				<span class="checked_book_count js_checked_book_count">
				
				</span>권을 선택하셨습니다.
				
				</p>
				
				<ul class="discount_price_info">
					<li>
						<span class="table_wrapper">
							<span class="info_title">
							총 상품 금액
							</span>
							<span class="info_value">
								<span class="original_price js_original_price museo_sans">
								10000
								</span>
								원
							</span>
						</span>
					</li>
				</ul>
				
			<p class="total_price_wrapper">
				<span class="table_wrapper">
					<span class="total_text">
					합계
					</span>
					<span class="total_price">
						<span class="js_price_wrapper">
							<span class="price_num js_price museo_sans">
							 10,000
							</span>원

						</span>
					
					</span>
				
				</span>
			</p>
		</div>
	<div class="buy_button_wrapper">
		<button class="blue_button buy_button">
		선택 구매하기
		</button>

	</div>
</div>

</article>
<article class="cart_list_wrapper js_cart_list_wrapper">
<div class="cart_list_box">
	<div class="module_list_handler js_list_handler_wrapper">
		<div class="total_checkbox">
			<input type="checkbox" id="checkbox_all_top" class="rui_checkbox_input js_checkbox_all" title="카트에 있는 책 전체 선택">
			<label for="checkbox_all_top">전체 선택</label>
		</div>
		<div class="buttons_wrapper">
			<ul class="rui_button_group_5">
				<li class="rui_button_item">
					<button type="button" class="handling_button rui_button_white_30 js_btn_selected_move_to_wishlist">
					선택 위시리스트로 이동
					</button>
				
				</li>
				<li class="rui_button_item">
					<button type="button" class="handling_button rui_button_white_30 js_btn_selected_del_cart">
					선택 삭제
					</button>
				
				</li>
			
			</ul>
		
		</div>
	</div>
	
	
	<div id="cart_wrap">
		<div class="bookmacro_wrapper">
				<c:if test="${!empty mycartList}">	
				<c:forEach var="article" items="${mycartList}">	
			<div class="book_macro_60 book_macro_landscape book_macro_metadata_portrait js_cart_book">
		
				
				<div class="book_thumbnail_wrapper has_checkbox">
						
							<div class="book_thumbnail">
								<div class="thumbnail_checkbox">
								<input type="checkbox" class="rui_checkbox_input">
									<label class="rui_checkbox_label">
								
									</label>
								</div>
						
								<div class="thumbnail_image">
						
								<img class="thumbnail lazyloaded"
								src="<%=request.getContextPath()%>/view/images/carousel/${article.isbn}.jpg">
								<span class="border"></span>
						
								</div>
							</div>
				</div>
							
							
							<div class="table_cell_wrapper">
								<div class="table_wrapper">
									<div class="book_metadata_wrapper">
										<h3 class="book_metadata meta_title">
											<a class="title_link ">
												<span class="title_text js_highlight_helper">
												${article.book_subject}
												</span>
											
											</a>
										
										
										</h3>
										<p class="book_metadata author">
										<a class="js_author_detail_link author_detail_link" href="#">
										</a>
										</p>
									
									</div>
									<div class="book_price_wrapper">
										<ul class="show_coupon_price">
											<li class="coupon_price">
											<strong>
												<span class="museo_sans">
												${article.book_price} 원
												</span>
											</strong>
										</li>
										</ul>
									</div>
								
								</div>
								
								<ul class="cart_wish_buttons_wrapper rui_button_group_5">
									<li class="rui_button_item">
									
									<button type="button" class="rui_button_white_30 rui_button_eink_black_line_30 book_button btn_move_to_wishlist js_btn_move_to_wishlist">
									위시리스트로 이동
									</button>
									</li>
									<li class="rui_button_item">
									
									<%-- <div>
			<button type="button" id="deleteCart" name="deleteCart"
			class="rui_button_white_50 btn_cart js_add_cart trackable" 
			mycart_isbn="${article.isbn}"mycart_id="${article.id}">
			삭제
			</button>
		</div> --%>
									<button type="button" class="rui_button_white_30 rui_button_eink_black_line_30 book_button btn_move_to_wishlist js_btn_move_to_wishlist">
									삭제
									</button>
									
								</ul>
							
							</div>
						
						
						
					</div>
					
					</c:forEach>
					</c:if>
				</div>
				
				
			
			</div>
				
		</div>
			
			
			
		
	</div>
	
</div>


</div>
	

	









<c:if test="${empty mycartList}">	
<div>없음</div>
</c:if>




</section>

</div>
</div>
</body>
<script type="text/javascript">

$(document).on("click","button[name='deleteCart']", function(){
	var result = confirm("장바구니에서 삭제 담으시겠습니까?");
	var isbn = $(this).attr("mycart_isbn");
	var id = $(this).attr("mycart_id");
	console.log(isbn);
	console.log(id);
	if(result){
		
		var objParams = {
			mycart_isbn       : isbn,
			mycart_id        : id
		};
				
		$.ajax({
			url            :    "deleteCart",
			dataType    :    "json",
			contentType :    "application/x-www-form-urlencoded; charset=UTF-8",
			type         :    "post",
			async        :     false, //동기: false, 비동기: ture
			data        :    objParams
		});
		location.reload(); 
	}else{
	    alert("취소하셨습니다");
	}    
});
</script>
</html>