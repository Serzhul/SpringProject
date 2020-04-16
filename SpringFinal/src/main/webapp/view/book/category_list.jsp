<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>카테고리 리스트</title>

<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/view/css/shards.min.css?v=3.0.0">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/view/css/shards-demo.min.css?v=3.0.0">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/view/carousel/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/view/carousel/slick/slick-theme.css" />
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/view/carousel/slick/slick.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

<style>


		.main_category_wrapper{
			width: 200px;
			height: 600px;
			border: 2px solid #e91bf5;
		}
		.box-container div{
			padding: 10px;
			border: 1px solid green;
			background-color: #e3ffe0;
		}
		#list_menu { position: absolute; top: 20px; left: 30px; }
		#content_page { position: absolute; top: 160px; left: 300px; }
		#box3 { position: absolute; top: 20px; right: 30px; }
		#box4 { position: fixed; top: 20px; right: 30px; }
		
		.module_category_section {
    margin-top: 30px;
}

.book_macro_column_5 {
    width: 20%;
    float: left;
    margin-top: 20px;
}

.book_macro_portrait {
    text-align: center;
}

.book_macro_portrait .book_thumbnail_wrapper {
    position: relative;
    text-align: left;
    display: block;
    margin: 0 auto;
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
    box-sizing: border-box;
}
.book_metadata_wrapper {
    cursor: default;
}

.book_macro_portrait .book_metadata_wrapper {
    text-align: left;
    display: block;
    margin: 8px auto 0 auto;
}

.book_thumbnail_wrapper .book_thumbnail .thumbnail_image {
    display: block;
    width: 100%;
    height: 100%;
    position: relative;
    background: #d9d9d9;
}

.book_thumbnail_wrapper .book_thumbnail {
    display: inline-block;
    position: relative;
    height: auto;
}

.book_macro_110 .book_macro_portrait .book_thumbnail_wrapper {
    height: 167px;
}

.book_macro_110 .book_thumbnail_wrapper {
    width: 180px;
}

.thumnail_image {
width: 100px;
    height: 140px;
}

.book-list-thumbnail {
    display: block;
    box-sizing: border-box;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(to right, rgba(0, 0, 0, .2) 0, rgba(0, 0, 0, 0) 5%, rgba(0, 0, 0, 0) 95%, rgba(0, 0, 0, .2) 100%);
    border: solid 1px rgba(0, 0, 0, .1);
    content: '';
}

.book_macro_110.book_macro_portrait .book_metadata_wrapper {
    width: 170px;
}

.book_macro_portrait .book_metadata_wrapper {
    text-align: left;
    display: block;
    margin: 8px auto 0 auto;
}

.book_metadata_wrapper {
    cursor: default;
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

.title_link {
text-decoration:none;}

.book_macro_portrait .book_metadata_wrapper .author {
    word-break: keep-all;
    text-overflow: ellipsis;
    display: block;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    word-wrap: break-word;
    word-break: break-all;
    white-space: normal;
    max-height: 3.1em;
    overflow: hidden;
}

.StarRate_IconBox {
	position: relative;
	margin-top: -1px;
	margin-right: 1px;
	vertical-align: -11%;
	font-size: 0;
	overflow: hidden;
}

.Rating-Star {
	width: 11px;
	height: 11px;
}

.Rating-Member {
	color: #999;
	font-size: 11px;
	line-height: 1em;
	vertical-align: -35%;
}

.book_metadata_wrapper .author a, .book_metadata_wrapper .author span {
    font-size: 12px;
    color: #666;
    font-weight: 400;
    line-height: 1.2em;
    word-break: break-all;
}

.book_macro_portrait .book_metadata_wrapper .book_button, .book_macro_portrait .book_metadata_wrapper .book_metadata {
    margin-top: 3px;
}

@import url(//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css);
}
@import url(https://fonts.googleapis.com/css?family=Titillium+Web:300);
.fa-2x {
font-size: 2em;
}
.fa {
position: relative;
display: table-cell;
width: 60px;
height: 36px;
text-align: center;
vertical-align: middle;
font-size:20px;
}


.main-menu:hover,nav.main-menu.expanded {
width:250px;
overflow:visible;
}

.main-menu {
background:white;
border-right:1px solid #e5e5e5;
position:absolute;
top:0;
bottom:0;
height:100%;
left:0;
width:60px;
overflow:hidden;
-webkit-transition:width .05s linear;
transition:width .05s linear;
-webkit-transform:translateZ(0) scale(1,1);
z-index:1000;
}

.main-menu>ul {
margin:7px 0;
}

.main-menu li {
position:relative;
display:block;
width:250px;
}

.main-menu li>a {
position:relative;
display:table;
border-collapse:collapse;
border-spacing:0;
color:#999;
 font-family: arial;
font-size: 14px;
text-decoration:none;
-webkit-transform:translateZ(0) scale(1,1);
-webkit-transition:all .1s linear;
transition:all .1s linear;
  
}

.main-menu .nav-icon {
position:relative;
display:table-cell;
width:60px;
height:36px;
text-align:center;
vertical-align:middle;
font-size:18px;
}

.main-menu .nav-text {
position:relative;
display:table-cell;
vertical-align:middle;
width:190px;
  font-family: 'Titillium Web', sans-serif;
}

.main-menu>ul.logout {
position:absolute;
left:0;
bottom:0;
}

.no-touch .scrollable.hover {
overflow-y:hidden;
}

.no-touch .scrollable.hover:hover {
overflow-y:auto;
overflow:visible;
}

a:hover,a:focus {
text-decoration:none;
}

nav {
-webkit-user-select:none;
-moz-user-select:none;
-ms-user-select:none;
-o-user-select:none;
user-select:none;
}

nav ul,nav li {
outline:0;
margin:0;
padding:0;
}
.main-menu li:hover>a,nav.main-menu li.active>a,.dropdown-menu>li>a:hover,.dropdown-menu>li>a:focus,.dropdown-menu>.active>a,.dropdown-menu>.active>a:hover,.dropdown-menu>.active>a:focus,.no-touch .dashboard-page nav.dashboard-menu ul li:hover a,.dashboard-page nav.dashboard-menu ul li.active a {
color:#fff;
background-color:#00b894;
cursor: pointer;
text-decoration: none;
}

.area {
float: left;
background: #e2e2e2;
width: 100%;
height: 100%;
}

@font-face {
  font-family: 'Titillium Web';
  font-style: normal;
  font-weight: 300;
  src: local('Titillium WebLight'), local('TitilliumWeb-Light'), url(http://themes.googleusercontent.com/static/fonts/titilliumweb/v2/anMUvcNT0H1YN4FII8wpr24bNCNEoFTpS2BTjF6FB5E.woff) format('woff');
}

#ridi_books div#books_contents {
    width: 100%;
    position: relative;
    overflow-x: hidden;
    overflow-y: hidden;
    min-height: 500px;
}

#page_all_menu .all_menu_wrapper {
    width: 953px;
    margin: 30px auto;
    border-radius: 3px;
    border: 1px solid #e6e8eb;
}

#page_all_menu .all_menu_wrapper .menu_column {
    width: 158px;
    padding-top: 15px;
    min-height: 600px;
}

#page_all_menu .menu_column.menu_general {
    border-left: none;
}

#page_all_menu .menu_column {
    float: left;
    display: block;
    border-left: 1px solid #c4d1de;
    width: 160px;
    padding-top: 57px;
    min-height: 578px;
    position: relative;
}

#page_all_menu .menu_column.menu_general .column_box .general_menu_wrapper {
    position: relative;
}

#page_all_menu .menu_column.menu_general .column_box .general_menu_wrapper.active .general_menu_title, #page_all_menu .menu_column.menu_general .column_box .general_menu_wrapper.pc_hover:hover .general_menu_title {
    background: #17c671;
    color: #fff;
}

#page_all_menu .menu_column.menu_general .column_box .general_menu_wrapper .general_menu_title {
    display: block;
    padding: 10px 15px 10px 20px;
    font-weight: 700;
    color: #000;
    font-size: 14px;
    position: relative;
    background: 0 0;
    -webkit-transition: all .1s;
    transition: all .1s;
}

#page_all_menu .menu_column.menu_general .column_box .general_menu_wrapper.active .general_menu_title .icon-arrow_9_right, #page_all_menu .menu_column.menu_general .column_box .general_menu_wrapper.pc_hover:hover .general_menu_title .icon-arrow_9_right {
    color: #fff;
}

#page_all_menu .menu_column.menu_general .column_box .general_menu_wrapper .general_menu_title .icon-arrow_9_right {
    display: block;
    position: absolute;
    right: 14px;
    top: 50%;
    margin-top: -.5em;
    color: #17c671;
}

#page_all_menu .all_menu_wrapper .menu_column.menu_general .column_box .general_menu_wrapper .sub_category_wrapper {
    z-index: 500;
}

#page_all_menu .menu_column.menu_general .column_box .general_menu_wrapper.active .sub_category_wrapper, #page_all_menu .menu_column.menu_general .column_box .general_menu_wrapper.pc_hover:hover .sub_category_wrapper {
    display: block;
}
#page_all_menu .menu_column.menu_general .column_box .general_menu_wrapper .sub_category_wrapper {
    display: none;
    position: absolute;
    right: -160px;
    top: 0;
    z-index: 10000;
    width: 160px;
    padding: 3px 0;
}

#page_all_menu .menu_column.menu_general .column_box .general_menu_wrapper .sub_category_wrapper .sub_category_list .sub_category_link {
    display: block;
    padding: 7px 18px;
    margin-top: 2px;
    font-size: 12px;
    -webkit-transition: all .1s;
    transition: all .1s;
    
}

#page_all_menu .menu_column.menu_general .column_box .general_menu_wrapper .sub_category_wrapper .sub_category_list .sub_category_link:hover {
    color: #17c671;
    font-weight: 700;
    cursor: pointer;
}

#page_all_menu .menu_column.menu_general_sub {
    background: #c6f5de;
}

#page_all_menu .menu_column {
    float: left;
    display: block;
    border-left: 1px solid #c4d1de;
    width: 160px;
    padding-top: 57px;
    min-height: 578px;
    position: relative;
}

ul{
   list-style:none;
   }
a {text-decoration: none;
}

.search-bar {
	position: absolute;
	margin-left: 260px;
	width: 30%;
}

.join-button {
	font-weight: bold;
	border-color: white;
	height: 35px;
	width: 95px;
	font-size: 0.75rem;
	border-radius: 3px;
	padding: 0;
}

.join-button:hover {
	border-color: white;
	opacity: 0.7;
}

.login-button {
	margin: 0;
	font-weight: bold;
	background-color: white;
	color: #17c671;
	height: 35px;
	font-size: 13px;
	border-radius: 3px;
	border: 0;
}

.login-button:hover {
	background-color: white;
	color: #17c671;
	opacity: 0.7;
}

.navbar-margin-bottom {
	margin-bottom: 0;
}

.left-margin {
	margin-left: 60px
}

.right-margin {
	margin-right: 100px
}

.nav-subbar {
	font-weight: bold;
}

@media ( min-width : 576px) {
	.nav-subbar-icon {
		padding-right: 0.625rem;
		padding-left: 0.625rem;
	}
}

@media ( min-width : 768px) {
	.navbar-expand-md .navbar-nav .nav-link {
		padding-right: 0.625rem;
		padding-left: 0.625rem;
	}
}

@media ( min-width : 992px) {
	.navbar-expand-lg .navbar-nav .nav-link {
		padding-right: 0.625rem;
		padding-left: 0.625rem;
	}
}

@media ( min-width : 1200px) {
	.navbar-expand-xl .navbar-nav .nav-link {
		padding-right: 0.625rem;
		padding-left: 0.625rem;
	}
}

@media ( max-width : 999px) {
	.join-button .login-button {
		padding: 0 3px;
	}
}

@media ( max-width : 999px) {
	.join-button {
		width: 50px;
		height: 26px;
		font-size: 0.5rem;
	}
}

@media ( max-width : 999px) {
	.login-button {
		width: 45px;
		height: 26px;
		font-size: 0.5rem;
		padding: 2px;
		border: 0;
	}
}

@media ( max-width : 999px) {
	.search-bar {
		width: 100%;
		position: static;
		margin: 0;
	}
}

@media ( max-width : 999px) {
	.logoname {
		justify-content: flex-start;
		margin-left: 0;
	}
}

@media ( max-width : 999px) {
	.navbar {
		justify-content: flex-start;
		padding-right: 3px;
		padding-left: 3px;
		padding-bottom: 0px;
	}
}

@media ( max-width : 999px) {
	.right-margin {
		margin: 0;
	}
}

@media ( max-width : 999px) {
	.submenu-name {
		display: none;
	}
}

@media ( max-width : 999px) {
	i.material-icons {
		font-size: 26px;
	}
}

@media ( max-width : 999px) {
	i.home-subbar {
		font-size: 20px;
		padding: 0;
	}
}

@media ( max-width : 999px) {
	.home-subbar {
		padding: 0;
	}
}

@media ( max-width : 999px) {
	.navbar-nav {
		flex-direction: row;
		width: 100%
	}
}

@media ( max-width : 999px) {
	li {
		display: inline-block;
		width: 50%;
	}
}

@media ( max-width : 999px) {
	a.nav-link {
		text-align: center;
	}
}

.nav-link-margin {
	margin-right: 30px;
}

.subbar-margin {
	margin-left: 26px;
	margin-right: 15px
}

@media ( max-width : 999px) {
	.subbar-margin {
		margin: 0;
		font-size: 10px;
	}
}

.carousel-images {
	background-image: url( "images/carousel/carousel1.jpg" );
	width: 97.5%;
	height: 100%;
	border-radius: 5px;
}

.carousel-container {
	opacity: 0.7;
}

.slick-center {
	opacity: 1;
}

.slick-slide {
	height: 234px;
	width: 360px;
}

.slick-list {
	margin: 0 -27px;
}

.slidenumber {
	position: absolute;
	width: 54px;
	height: 24px;
	background-color: rgba(0, 0, 0, 0.4);
	right: 372px;
	bottom: 132px;
	display: flex;
	-webkit-box-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	align-items: center;
	border-radius: 12px;
	border-width: 1px;
	border-style: solid;
	border-color: rgba(255, 255, 255, 0.2);
	color: white;
	font-weight: bold;
	font-size: 1
}

.home-subbar {
	color: #40474D;
	font-size: 15px;
	padding: 0;
}

.home-subbar-icon {
	font-size: 50px;
}

.home-subbar-border {
	position: absolute;
	width: 100vw;
	border: 0 none;
	left: 0;
	top: 3;
	height: 1px;
	background-color: #E6E8EB;
}

.navbar-underline {
	display: block;
	background: transparent;
	height: 3px;
	width: 0;
	background-color: white;
	width: 100%;
	position: relative;
	top: 1px
}

.review-carousel {
	height: 120%;
	margin-bottom: 20px;
}

.review-margin {
	margin-left: 20px;
	margin-right: 30px;
}

.subbar-active {
	color: #00b894;
}

.timer {
	border-radius: 14px;
	width: 98px;
	height: 30px;
	background-image: linear-gradient(90deg, rgba(200, 254, 189, 1) 0%,
		rgba(57, 223, 196, 1) 100%);
	font-size: 13px;
	color: white;
	font-weight: bold;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-align-items: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-pack: start;
	-webkit-justify-content: start;
	-ms-flex-pack: start;
	justify-content: start;
	padding: 9px;
	margin-bottom: 16px;
	-webkit-transition: opacity 0.3s;
	transition: opacity 0.3s;
}

.rank-list-ul {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-flex-direction: column;
	-ms-flex-direction: column;
	flex-direction: column;
	-webkit-flex-wrap: wrap;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	height: 100%;
	padding-left: 16px;
	padding-right: 16px;
	overflow: -moz-scrollbars-none;
	-ms-overflow-style: none;
	-webkit-overflow-scrolling: touch;
	-webkit-scrollbar-width: none;
	-moz-scrollbar-width: none;
	-ms-scrollbar-width: none;
	scrollbar-width: none;
	overflow-x: auto;
}

.rank-list-li {
	-webkit-flex: none;
	-ms-flex: none;
	flex: none;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-align-items: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	box-sizing: content-box;
	padding-right: 14px;
	height: 94px;
	width: 308px;
}

.book-meta-box {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-align-items: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	border-bottom: 1px #e6e8eb solid;
	height: 100%;
	width: 100%;
}

.book-meta-box-rank {
	height: 22px;
	font-size: 18px;
	font-weight: 700;
	text-align: center;
	color: #000000;
	margin-right: 21px;
}

.book-meta-box-title {
	font-size: 15px;
	font-weight: 700;
	line-height: 1.33em;
	color: #000000;
	max-height: 2.7em;
	margin-bottom: 4.5px;
	overflow: hidden;
	text-overflow: ellipsis;
	display: block;
	display: -webkit-box;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
	word-wrap: break-word;
	white-space: normal;
	word-break: keep-all;
}

.book-meta-box-author {
	height: 19px;
	font-size: 14px;
	line-height: 1.36;
	color: #808991;
	margin-bottom: 2px;
	overflow: hidden;
	text-overflow: ellipsis;
	display: block;
	display: -webkit-box;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
	word-wrap: break-word;
	white-space: normal;
	word-break: keep-all;
	margin-bottom: 0;
	margin-bottom: 0;
}

.book-meta-box-author {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-flex-direction: column;
	-ms-flex-direction: column;
	flex-direction: column;
	-webkit-transition: opacity 0.2s ease-in-out;
	transition: opacity 0.2s ease-in-out;
	width: 100%;
}

.rank-list-image {
	position: relative;
	line-height: 0;
	max-height: inherit;
	width: 48px;
	height: 72px;
}

.rank-list {
	position: relative;
	height: 282px;
}

.rank-list-item {
	-webkit-flex: none;
	-ms-flex: none;
	flex: none;
	margin-right: 24px;
	height: 100%;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-flex-direction: column;
	-ms-flex-direction: column;
	flex-direction: column;
	-webkit-box-pack: center;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center;
	position: relative;
}

.indigo {
	background-color: #303538;
}

.footer-text {
	color: white;
	text-decoration: none;
	font-weight: 400;
	font-size: 13px;
}

.footer-text:hover {
	color: grey;
	text-decoration: none;
}

.footer-text:vistied {
	text-decoration: none;
}

a {
color:#5a6169;
}



	</style>
</head>
<body>

<div id="base_contents_wrapper">

	<div class="books_contents">

	<div id="page_all_menu">
		<div class="all_menu_wrapper">
			<div class="menu_column menu_general">
				<div class="column_box">
					<div class="list_wrap list_normal">
						<div class="pc_hover js_general_menu_wrapper general_menu_wrapper general_category_0 active">
							<h3>
								<a class="js_general_menu_title general_menu_title" href="${pageContext.request.contextPath}/book/book_list?book_m_category=소설">
								소설
								</a>
								<span class="icon-arrow_9_right"></span>
								<span class="icon-arrow_1_left"></span>
							</h3>
							
						<ul class="sub_category_wrapper">
							<li class="sub_category_list">
							<a class="sub_category_link" href="${pageContext.request.contextPath}/book/book_list?book_m_category=소설">
							소설 전체
							</a>
							
							</li>
							
							<li class="sub_category_list">
							<a class="sub_category_link">
							일반
							</a>
							
							</li>
							
							<li class="sub_category_list">
							<a class="sub_category_link">
							SF
							</a>
							
							</li>
							
							<li class="sub_category_list">
							<a class="sub_category_link">
							추리
							</a>
							
							</li>
							
							<li class="sub_category_list">
							<a class="sub_category_link">
							판타지/무협
							</a>
							
							</li>
							
							<li class="sub_category_list">
							<a class="sub_category_link">
							로맨스
							</a>
							
							</li>
						
						</ul>
							
						</div>
						
						<div class="pc_hover js_general_menu_wrapper general_menu_wrapper general_category_0">
							<h3>
								<a class="js_general_menu_title general_menu_title" href="${pageContext.request.contextPath}/book/book_list?book_m_category=자기개발">
								자기 개발
								</a>
								<span class="icon-arrow_9_right"></span>
								<span class="icon-arrow_1_left"></span>
							</h3>
							
						<ul class="sub_category_wrapper">
							<li class="sub_category_list">
							<a class="sub_category_link" href="${pageContext.request.contextPath}/book/book_list?book_m_category=자기개발">
							자기개발 전체
							</a>
							
							</li>
							
							<li class="sub_category_list">
							<a class="sub_category_link">
							성공/삶의 자세
							</a>
							
							</li>
							
							<li class="sub_category_list">
							<a class="sub_category_link">
							취업/창업
							</a>
							
							</li>
							
							<li class="sub_category_list">
							<a class="sub_category_link">
							설득/화술/협상
							</a>
							
							</li>
						
						</ul>
							
						</div>
						
						<div class="pc_hover js_general_menu_wrapper general_menu_wrapper general_category_0">
							<h3>
								<a class="js_general_menu_title general_menu_title" href="${pageContext.request.contextPath}/book/book_list?book_m_category=건강/다이어트">
								건강/다이어트
								</a>
								<span class="icon-arrow_9_right"></span>
								<span class="icon-arrow_1_left"></span>
							</h3>
							
						<ul class="sub_category_wrapper">
							<li class="sub_category_list">
							<a class="sub_category_link" href="${pageContext.request.contextPath}/book/book_list?book_m_category=건강/다이어트">
							건강/다이어트 전체
							</a>
							
							</li>
							
							<li class="sub_category_list">
							<a class="sub_category_link">
							스마일/뷰티
							</a>
							
							</li>
							
							<li class="sub_category_list">
							<a class="sub_category_link">
							건강/다이어트
							</a>
							
							</li>
							
							<li class="sub_category_list">
							<a class="sub_category_link">
							운동/스포츠
							</a>
							
							</li>
						
						</ul>
							
						</div>
						
						<div class="pc_hover js_general_menu_wrapper general_menu_wrapper general_category_0">
							<h3>
								<a class="js_general_menu_title general_menu_title" href="${pageContext.request.contextPath}/book/book_list?book_m_category=외국어">
								외국어
								</a>
								<span class="icon-arrow_9_right"></span>
								<span class="icon-arrow_1_left"></span>
							</h3>
							
						<ul class="sub_category_wrapper">
							<li class="sub_category_list">
							<a class="sub_category_link" href="${pageContext.request.contextPath}/book/book_list?book_m_category=외국어">
							외국어 전체
							</a>
							
							</li>
							
							<li class="sub_category_list">
							<a class="sub_category_link">
							비즈니스 영어
							</a>
							
							</li>
							
							<li class="sub_category_list">
							<a class="sub_category_link">
							일반 영어
							</a>
							
							</li>
							
							<li class="sub_category_list">
							<a class="sub_category_link">
							제2 외국어
							</a>
							
							</li>
						
						</ul>
							
						</div>
						
						<div class="pc_hover js_general_menu_wrapper general_menu_wrapper general_category_0">
							<h3>
								<a class="js_general_menu_title general_menu_title" href="${pageContext.request.contextPath}/book/book_list?book_m_category=컴퓨터/IT">
								컴퓨터/IT
								</a>
								<span class="icon-arrow_9_right"></span>
								<span class="icon-arrow_1_left"></span>
							</h3>
							
						<ul class="sub_category_wrapper">
							<li class="sub_category_list">
							<a class="sub_category_link" href="${pageContext.request.contextPath}/book/book_list?book_m_category=컴퓨터/IT">
							컴퓨터/IT 전체
							</a>
							
							</li>
							
							<li class="sub_category_list">
							<a class="sub_category_link">
							IT비즈니스
							</a>
							
							</li>
							
							<li class="sub_category_list">
							<a class="sub_category_link">
							IT자격증
							</a>
							
							</li>
							
							<li class="sub_category_list">
							<a class="sub_category_link">
							개발/프로그래밍
							</a>
							
							</li>
							
							<li class="sub_category_list">
							<a class="sub_category_link">
							IT해외원서
							</a>
							
							</li>
						
						</ul>
							
						</div>
						
						<div class="pc_hover js_general_menu_wrapper general_menu_wrapper general_category_0">
							<h3>
								<a class="js_general_menu_title general_menu_title" href="${pageContext.request.contextPath}/book/book_list?book_m_category=경영/경제">
								경영/경제
								</a>
								<span class="icon-arrow_9_right"></span>
								<span class="icon-arrow_1_left"></span>
							</h3>
							
						<ul class="sub_category_wrapper">
							<li class="sub_category_list">
							<a class="sub_category_link" href="${pageContext.request.contextPath}/book/book_list?book_m_category=경영/경제">
							경영/경제 전체
							</a>
							
							</li>
							
							<li class="sub_category_list">
							<a class="sub_category_link">
							경영 일반
							</a>
							
							</li>
							
							<li class="sub_category_list">
							<a class="sub_category_link">
							경제 일반
							</a>
							
							</li>
							
							<li class="sub_category_list">
							<a class="sub_category_link">
							마케팅/세일즈
							</a>
							
							</li>
							
							<li class="sub_category_list">
							<a class="sub_category_link">
							CEO/리더십
							</a>
							
							</li>
						
						</ul>
							
						</div>



<div class="area">

</div>


<%-- <div class="dropdown">

  <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" data-hover="dropdown">
   카테고리 <span class="caret"></span>
  </button>
  
  <ul class="dropdown-menu">

    <li class="dropdown">
      <a href="${pageContext.request.contextPath}/book/book_list?book_m_category=소설">소설</a>
      <ul class="dropdown-menu">
        <li><a href="#">일반</a></li>
        <li><a href="#">SF</a></li>
        <li><a href="#">추리</a></li>
        <li><a href="#">판타지/무협</a></li>
        <li><a href="#">로맨스</a></li>
       </ul>
    </li>
    <li class="dropdown">
      <a href="${pageContext.request.contextPath}/book/book_list?book_m_category=자기개발">자기개발</a>
      <ul class="dropdown-menu">
        <li><a href="#">성공/삶의 자세</a></li>
        <li><a href="#">취업/창업</a></li>
        <li><a href="#">설득/화술/협상</a></li>
       </ul>
    </li>
    
    <li class="dropdown">
      <a href="${pageContext.request.contextPath}/book/book_list?book_m_category=건강/다이어트">건강/다이어트</a>
      <ul class="dropdown-menu">
        <li><a href="#">스마일/뷰티</a></li>
        <li><a href="#">건강/다이어트</a></li>
        <li><a href="#">운동/스포츠</a></li>
       </ul>
    </li>
    
    <li class="dropdown">
      <a href="${pageContext.request.contextPath}/book/book_list?book_m_category=외국어">외국어</a>
      <ul class="dropdown-menu">
        <li><a href="#">비즈니스 영어</a></li>
        <li><a href="#">일반 영어</a></li>
        <li><a href="#">제2 외국어</a></li>
       </ul>
    </li>
    
    <li class="dropdown">
      <a href="${pageContext.request.contextPath}/book/book_list?book_m_category=컴퓨터/IT">컴퓨터/IT</a>
      <ul class="dropdown-menu">
        <li><a href="#">IT비즈니스</a></li>
        <li><a href="#">IT자격증</a></li>
        <li><a href="#">개발/프로그래밍</a></li>
        <li><a href="#">IT해외원서</a></li>
       </ul>
    </li>
    
    <li class="dropdown">
      <a href="${pageContext.request.contextPath}/book/book_list?book_m_category=경영/경제">경영/경제</a>
      <ul class="dropdown-menu">
        <li><a href="#">경영 일반</a></li>
        <li><a href="#">경제 일반</a></li>
        <li><a href="#">마케팅/세일즈</a></li>
        <li><a href="#">CEO/리더십</a></li>
       </ul>
    </li>
    
    
    
  </ul>
</div> --%>	

					</div>
				</div>
			</div>
			
			<div class="menu_column menu_general_sub">
				<div class="column_box">
				
				</div>
			</div>
			
		</div>

	</div>
	</div>
</div>

<script>

$(".pc_hover").hover(
		  function () {
		    $(".pc_hover").removeClass("active");
		  }
		);


</script>
</body>
</html>