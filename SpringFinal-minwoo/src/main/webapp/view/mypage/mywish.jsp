<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>

<style>
#ridi_books div#books_contents {
    width: 100%;
    position: relative;
    overflow-x: hidden;
    overflow-y: hidden;
    min-height: 500px;
}

#ridi_books div#books_contents {
    width: 100%;
    position: relative;
    overflow-x: hidden;
    overflow-y: hidden;
    min-height: 500px;
}

#ridi_books div#books_contents div#contents_wrap {
    display: flex;
    width: 900px;
    margin: 0 auto;
    position: relative;
    clear: both;
    margin-top: 33px;
    width: 953px;
    padding: 0 24px;
}

#ridi_books div#books_contents div#contents_wrap #ridi_left_menu {
    display: table-cell;
    vertical-align: top;
    padding-bottom: 320px;
    width: 235px;
    flex-shrink: 0;
}

#ridi_left_menu, #ridi_left_menu a, #ridi_left_menu b, #ridi_left_menu h1, #ridi_left_menu h3, #ridi_left_menu h4 {
    color: #666;
    font-size: 12px;
    line-height: 1em;
    font-family: ridi-roboto,Helvetica Neue,Apple SD Gothic Neo,arial,'나눔고딕',Nanum Gothic,'돋움',Dotum,Tahoma,Geneva,sans-serif;
    font-weight: 400;
    letter-spacing: -.03em;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

#ridi_left_menu, #ridi_left_menu a, #ridi_left_menu b, #ridi_left_menu div, #ridi_left_menu h1, #ridi_left_menu h3, #ridi_left_menu h4, #ridi_left_menu li, #ridi_left_menu span, #ridi_left_menu ul {
    margin: 0;
    padding: 0;
}

#ridi_left_menu .menu_title {
    font-size: 24px;
    font-weight: 700;
    color: #212529;
}

#ridi_left_menu.myridi_left_menu .menu_wrapper {
    margin-top: 9px;
}

#ridi_left_menu .menu_wrapper {
    width: 130px;
    margin-top: 16px;
}

#ridi_left_menu.myridi_left_menu .menu_wrapper .menu_section {
    padding: 17px 0 19px 0;
    border-bottom: 2px solid #f2f2f2;
}

#ridi_left_menu.myridi_left_menu .menu_wrapper .menu_section .section_title.myridi_home_link.active, #ridi_left_menu.myridi_left_menu .menu_wrapper .menu_section .section_title.myridi_home_link.active .myridi_left_icon {
    color: #1f8ce6;
}

#ridi_left_menu.myridi_left_menu .menu_wrapper .menu_section .section_title .myridi_left_icon {
    padding-right: 7px;
    vertical-align: -5%;
    font-size: 16px;
    color: #738096;
}

#ridi_left_menu.myridi_left_menu .menu_wrapper .menu_section {
    padding: 17px 0 19px 0;
    border-bottom: 2px solid #f2f2f2;
}

#ridi_left_menu.myridi_left_menu .menu_wrapper .menu_section .section_title {
    font-size: 15px;
    color: #40474d;
    font-weight: 700;
}

#ridi_left_menu.myridi_left_menu .menu_wrapper .menu_section .section_title .myridi_left_icon {
    padding-right: 7px;
    vertical-align: -5%;
    font-size: 16px;
    color: #738096;
}

#ridi_left_menu.myridi_left_menu .menu_wrapper .menu_section .section_list {
    border-top: none;
    padding: 1px 0 0 22px;
}

#ridi_left_menu.myridi_left_menu .menu_wrapper .menu_section .section_list .section_list_element .section_link {
    padding: 14px 0 0 0;
    font-weight: 700;
    font-size: 15px;
    -webkit-transition: color .2s;
    transition: color .2s;
}

#ridi_left_menu .menu_wrapper ul li a {
    display: block;
    padding: 7px 0;
    color: #808991;
    font-size: 13px;
}

#ridi_left_menu a, #ridi_left_menu a:link, #ridi_left_menu a:visited {
    color: #666;
    line-height: 1em;
    text-decoration: none;
    -webkit-tap-highlight-color: transparent;
}

#page_myridi {
    padding-bottom: 90px;
}

#page_myridi .myridi_header {
    max-width: 717px;
    border: 2px solid #636c73;
    width: 100%;
    cursor: default;
    table-layout: fixed;
    display: flex;
}

#page_myridi .myridi_header .account_info_wrapper {
    margin: 1px;
    flex-grow: 0;
    flex-shrink: 0;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    max-width: 150px;
    padding: 24px 20px 20px 20px;
    background: #ebf6ff;
    vertical-align: top;
}

#page_myridi .myridi_header .account_info_wrapper .info_id_email {
    min-height: 85px;
    padding-bottom: 20px;
}

#page_myridi .myridi_header .account_info_wrapper .info_id_email .info_id {
    font-size: 20px;
    font-weight: 700;
    color: #000;
    line-height: 1.2em;
    word-break: break-all;
}

#ridi_books h3 {
    letter-spacing: -.03em;
}

#page_myridi .myridi_header .account_info_wrapper .info_id_email .info_email {
    margin-top: 5px;
    font-size: 12px;
    font-weight: 500;
    color: #808991;
    line-height: 1.5em;
    word-break: break-all;
    letter-spacing: -.01em;
}

#page_myridi .myridi_header .account_info_wrapper .btn_logout {
    display: block;
    width: 64px;
    text-align: center;
    padding: 7px 0;
    border: 2px solid #d6deeb;
    border-radius: 3px;
    line-height: 1.2em;
    font-size: 13px;
    font-weight: 700;
    color: #636c73;
    background: #ebf6ff;
    -webkit-transition: background .2s,border-color .2s;
    transition: background .2s,border-color .2s;
}

ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}

#ridi_left_menu ul {
    list-style: none;
}

#ridi_left_menu .menu_wrapper ul {
    border-top: 2px solid #f2f2f2;
    padding: 13px 0 10px 0;
}

#ridi_left_menu.myridi_left_menu .menu_wrapper .menu_section .section_list {
    border-top: none;
    padding: 1px 0 0 22px;
}

#ridi_left_menu .menu_wrapper ul li a {
    display: block;
    padding: 7px 0;
    color: #808991;
    font-size: 13px;
}

#ridi_left_menu a, #ridi_left_menu a:link, #ridi_left_menu a:visited {
    color: #666;
    line-height: 1em;
    text-decoration: none;
    -webkit-tap-highlight-color: transparent;
}

#ridi_left_menu, #ridi_left_menu a, #ridi_left_menu b, #ridi_left_menu h1, #ridi_left_menu h3, #ridi_left_menu h4 {
    color: #666;
    font-size: 12px;
    line-height: 1em;
    font-family: ridi-roboto,Helvetica Neue,Apple SD Gothic Neo,arial,'나눔고딕',Nanum Gothic,'돋움',Dotum,Tahoma,Geneva,sans-serif;
    font-weight: 400;
    letter-spacing: -.03em;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

#ridi_left_menu.myridi_left_menu .menu_wrapper .menu_section .section_list .section_list_element .section_link {
    padding: 14px 0 0 0;
    font-weight: 700;
    font-size: 15px;
    -webkit-transition: color .2s;
    transition: color .2s;
}

#ridi_left_menu .menu_wrapper {
    width: 130px;
    margin-top: 16px;
}

#ridi_left_menu.myridi_left_menu .menu_wrapper {
    margin-top: 9px;
}

#ridi_books div#books_contents div#contents_wrap #ridi_left_menu {
    display: table-cell;
    vertical-align: top;
    padding-bottom: 320px;
    width: 235px;
    flex-shrink: 0;
}

#page_wish_list {
    width: 952px;
    margin: 0 auto 100px auto;
}

#page_wish_list {
    width: 952px;
    margin: 0 auto 100px auto;
}

#page_wish_list .article_title {
    font-size: 24px;
    font-weight: 700;
    color: #000;
}

#page_wish_list .article_title .wishlist_count {
    font-size: 22px;
    font-weight: 400;
    color: #7d8e9e;
    padding-left: 3px;
}

#page_wish_list #wishlist_result_wrap {
    position: relative;
}

#page_wish_list .wish_list_wrapper {
    display: block;
    width: 100%;
}

#page_wish_list .wish_list_wrapper .list_filter_wrapper {
    padding-top: 10px;
    cursor: default;
}

.rui_tab_2 {
    margin: 0;
    padding: 0;
    list-style: none;
    border-bottom: 2px solid #d1d5d9;
    cursor: default;
}

ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}

.rui_tab_2 .tab_list {
    font-family: ridi-roboto,Helvetica Neue,Apple SD Gothic Neo,"나눔고딕",Nanum Gothic,"돋움",arial,Dotum,Tahoma,Geneva,sans-serif;
    letter-spacing: -.03em;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    margin: 0;
    padding: 0;
    display: inline-block;
    margin-right: 13px;
}

li {
    line-height: initial;
}

.module_list_handler {
    clear: both;
    display: table;
    padding: 15px 0;
    width: 100%;
    box-sizing: border-box;
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

#page_wish_list .wish_list_wrapper .bookmacro_wrapper {
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
.book_macro_landscape .book_thumbnail_wrapper.has_checkbox .book_thumbnail .thumbnail_checkbox {
    left: -28px;
    top: 50%;
    margin-top: -9px;
}

.book_thumbnail_wrapper .book_thumbnail .thumbnail_checkbox {
    display: block;
    position: absolute;
    left: -22px;
    top: 10px;
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
fieldset, iframe, img {
    border: 0;
    -ms-interpolation-mode: bicubic;
}
button, img, input, select, textarea {
    vertical-align: middle;
    outline: 0;
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
.book_macro_60.book_macro_landscape .book_metadata_wrapper {
    padding: 15px 8px 15px 15px;
}
.book_macro_landscape .book_metadata_wrapper {
    position: relative;
}
.book_macro_landscape .book_metadata_wrapper, .book_macro_landscape .book_thumbnail_wrapper {
    display: table-cell;
    vertical-align: top;
    padding: 20px 15px;
}
.book_metadata_wrapper {
    cursor: default;
}
#ridi_books h3 {
    letter-spacing: -.03em;
}
.book_macro_landscape.book_macro_metadata_portrait .book_metadata_wrapper .book_metadata {
    display: block;
    margin-top: 3px;
}
.book_macro_landscape .book_metadata_wrapper .book_metadata.meta_sub_title, .book_macro_landscape .book_metadata_wrapper .book_metadata.meta_title {
    margin-bottom: 7px;
}
.book_macro_landscape .book_metadata_wrapper .book_metadata.hot_author_book_count, .book_macro_landscape .book_metadata_wrapper .book_metadata.hot_author_book_list, .book_macro_landscape .book_metadata_wrapper .book_metadata.hot_author_name, .book_macro_landscape .book_metadata_wrapper .book_metadata.meta_description, .book_macro_landscape .book_metadata_wrapper .book_metadata.meta_price_info, .book_macro_landscape .book_metadata_wrapper .book_metadata.meta_sub_title, .book_macro_landscape .book_metadata_wrapper .book_metadata.meta_title, .book_macro_landscape .book_metadata_wrapper .book_metadata.tags_wrap {
    display: block;
}
.book_macro_landscape .book_metadata_wrapper .book_metadata {
    display: inline-block;
}
.book_macro_60 .book_metadata_wrapper .meta_title {
    margin-top: .2em;
    font-size: 13px;
}
.book_macro_60 .book_metadata_wrapper .meta_title .title_link .title_tag, .book_macro_60 .book_metadata_wrapper .meta_title .title_link .title_text {
    font-size: 13px;
    color: #000;
    font-weight: 700;
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

.book_macro_landscape .table_cell_wrapper .table_wrapper .book_price_wrapper {
    display: table-cell;
    vertical-align: middle;
}

.book_price_wrapper {
    cursor: default;
    text-align: right;
}

.book_price_wrapper ul.wishlist_price_list .rental_price {
    margin-bottom: 9px;
}

.book_price_wrapper ul .buy_price, .book_price_wrapper ul .rental_price {
    font-size: 14px;
    white-space: nowrap;
    margin-top: 4px;
}

.book_price_wrapper ul .ebook_price {
    font-size: 14px;
    white-space: nowrap;
}

.book_price_wrapper ul .buy_price, .book_price_wrapper ul .rental_price {
    font-size: 14px;
    white-space: nowrap;
    margin-top: 4px;
}

.book_price_wrapper ul .buy_price .price_title, .book_price_wrapper ul .rental_price .price_title {
    font-size: 12px;
    margin-right: 5px;
    color: #aab1b7;
}

.book_price_wrapper ul .buy_price strong, .book_price_wrapper ul .rental_price strong {
    color: #1f8ce6;
}

.book_price_wrapper ul .ebook_price strong {
    color: #1f8ce6;
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

.rui_button_group_5>.rui_button_item {
    padding: 0 2px;
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

.rui_checkbox_label {
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
    cursor: pointer;
    display: inline-block;
    padding: 0 0 0 26px;
    position: relative;
    margin-right: 10px;
    color: #636c73;
    font-size: 13px;
    font-weight: 700;
    height: 18px;
    line-height: 18px;
    -webkit-transition: color .2s;
    transition: color .2s;
}

</style>


</head>
<body id="ridi_books">
<div id="books_contents">
   <div id="contents_wrap">
      <div id="ridi_left_menu" class="myridi_left_menu">
         <h3 class="menu_title"> 마이 페이지</h3>
         <nav class="menu_wrapper">
            <div class="menu_section">
            <a class="section_title myridi_home_link active">
            마이 페이지 홈
            </a>
            </div>
      <div class="menu_section">
         <h4 class="section_title">
         <span>
         아이콘
         </span>
         책
         </h4>
         <ul class="section_list">
            <li class="section_list_element">
               <a class="section_link" href="<%=request.getContextPath()%>/mypage/mylibrary">
               내 책장
               </a>
            
            </li>
            <li class="section_list_element">
               <a class="section_link" href="<%=request.getContextPath()%>/mypage/mycart">
               장바구니
               </a>
            
            </li>
            <li class="section_list_element">
               <a class="section_link" href="<%=request.getContextPath()%>/mypage/mywish">
               위시리스트
               </a>
            
            </li>
         
         </ul>
      
      
      </div>
   
      <div class="menu_section">
         <h4 class="section_title">
         <span>
         아이콘
         </span>
         개인
         </h4>
         <ul class="section_list">
            <li class="section_list_element">
               <a class="section_link" href="<%=request.getContextPath()%>/mypage/mylibrary">
               1:1 문의
               </a>
            
            </li>
            <li class="section_list_element">
               <a class="section_link" href="<%=request.getContextPath()%>/mypage/mycart">
               내 리뷰 관리
               </a>
            
            </li>
            <li class="section_list_element">
               <a class="section_link" href="<%=request.getContextPath()%>/mypage/mywish">
               정보 변경
               </a>
            
            </li>
         
         </ul>
      
      
      </div>
   

   <!-- <li>책/구매
      <ul>  
         <li><a href="#">이어보기</a></li>
      </ul>
   </li> -->
   
   </div>
   <section id="page_wish_list">
      <div id="formWishlist" class="js_wishlist_form">
         <h2 class="article_title">
         위시리스트
         </h2>
      <div id="wishlist_result_wrap" class="js_wishlist_result_wrap">
         <div class="result_body">
            <article class="wish_list_wrapper">
               <div class="list_filter_wrapper">
                  <ul class="rui_tab_2">
                  
                  </ul>
               </div>
               <div class="module_list_handler">
               <div class="total_checkbox">
                  <input type="checkbox" id="checkbox_all_top" class="rui_checkbox_input js_checkbox_all">
                  <label for="checkbox_all_top" class="rui_checkbox_label">
                  전체선택
                  </label>
               </div>
               <div class="buttons_wrapper">
                  <ul class="rui_button_group_5">
            <li class="rui_button_item">
              <button type="button" class="handling_button rui_button_white_30 rui_button_eink_black_line_30 js_btn_selected_move_to_cart">선택 카트로 이동</button>
            </li>
            <li class="rui_button_item">
              <button type="button" class="handling_button rui_button_white_30 rui_button_eink_black_line_30 btn_selected_delete js_btn_selected_delete">선택 삭제</button>
            </li>
          </ul>

         
         </div>
            
      </div>
      


      
      <c:if test="${!empty mywishList}">
      <c:forEach var="article" items="${mywishList}">      
      <div id="WishlistWrap" class="js_wishlist">
         <div class="bookmacro_wrapper">
            <div class="book_macro_60 book_macro_landscape book_macro_metadata_portrait">
               <div class="book_thumbnail_wrapper has_checkbox">
                  <div class="book_thumbnail">
                     <div class="thumbnail_checkbox">
                        <input type="checkbox" class="rui_checkbox_input">
                        
                        <label class="rui_checkbox_label">
                        
                        </label>
                     
                     </div>
                     <div class="thumbnail_image">
                        <img class="thumbnail ls-is-cached lazyloaded"
                        src = "<%=request.getContextPath()%>/view/images/carousel/${article.isbn}.jpg">
                        
                        <span class="border">
                        </span>
                     
                     </div>
                     <a class="thumbnail_btn" href="${pageContext.request.contextPath}/book/book_content?isbn=${article.isbn}">
                     
                     </a>

                  </div>
               
               </div>
               
               <div class="table_cell_wrapper">
                  <div class="table_wrapper">
                     <div class="book_metadata_wrapper">
                        <h3 class="book_metadata meta_title">
                           <a class="title_link" href="${pageContext.request.contextPath}/book/book_content?isbn=${article.isbn}">
                           
                           
                           <span class="title_text js_highlight_helper">
                           ${article.book_subject}
                           </span>
                           </a>
                        </h3>
                     </div>
                  <div class="book_price_wrapper">
                     <ul class="wishlist_price_list">
                        <li class="buy_price ebook_price">
                           <span class="price_title">구매</span>
                           <span class="discount_info">
                           <strong>
                              <span class="museo_sans">10,000원</span>
                           </strong>
                           </span>
                        </li>
                     </ul>

                  </div>   

               </div>
               <ul class="cart_wish_buttons_wrapper rui_button_group_5">
                  <li class="rui_button_item">
                     <button type="button" name="movetoCart" mywish_isbn="${article.isbn}" mywish_id="${article.id}"                     
                     class="rui_button_white_30 rui_button_eink_black_line_30 book_button btn_move_to_cart js_btn_move_to_cart">
                     카트로 이동
                     </button>
                  </li>
                  <li class="rui_button_item">
                     <button type="button" name="deleteWish" mywish_isbn="${article.isbn}" mywish_id="${article.id}" 
                     class="rui_button_white_30 rui_button_eink_black_line_30 book_button btn_delete js_btn_delete">삭제
                     </button>
                  </li>
               </ul>
               
            </div>
            
            </div>

         </div>
   </div>
   
               </c:forEach>
            </c:if>
            
            <c:if test="${empty mywishList}">
            위시리스트에 도서가 없습니다.
            </c:if>   
</section>
</body>
<script type="text/javascript">
$(document).on("click","button[name='deleteWish']", function(){
   var result = confirm("wishList에서 삭제하시겠습니까?");
   var isbn = $(this).attr("mywish_isbn");
   var id = $(this).attr("mywish_id");

   if(result){
      
      var objParams = {
         mywish_isbn       : isbn,
         mywish_id        : id
      };
            
      $.ajax({
         url            :    "deleteWish",
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


$(document).on("click", "button[name='movetoCart']", function() {
	var result = confirm("장바구니로 이동하시겠습니까?");
	var isbn = $(this).attr("mywish_isbn");
	var id = $(this).attr("mywish_id");
	if (result) {
		var objParams = {
				mywish_isbn : isbn,
				mywish_id : id
		};
		$.ajax({
			url : "movetoCart",
			dataType : "json",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			type : "post",
			async : false, //동기: false, 비동기: ture
			data : objParams,
			success: function (response) {
				if(response==true){
					alert("장바구니로 이동했습니다");
				}else{
					alert("장바구니에 이미 있는 상품입니다");
				}				
			},
			error: function (e) {
				alert("통신실패" + e)
			}
		});
		location.reload();
	} else {
		alert("취소하셨습니다");
	}
});

</script>
</html>