<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
	
	<section id="page_myridi">
		<article class="myridi_header">
			<div class="account_info_wrapper">
				<div class="info_id_email">
					<h3 class="info_id museo_sans">
					${member.id}
					</h3>
					<p class="info_email museo_sans">
					${member.email}
					</p>
				<a href="<%=request.getContextPath()%>/member/logout" class="btn_logout">로그아웃</a>
				</div>
			
			</div>
		
		
		</article>
	
	</section>
		
	</div>
</div>
</body>
</html>