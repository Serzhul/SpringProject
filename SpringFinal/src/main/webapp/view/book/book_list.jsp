<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>

<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/view/css/bootstrap.min.css" rel="stylesheet">

<link href="<%=request.getContextPath()%>/view/css/animate.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/view/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	
	<script src="<%=request.getContextPath()%>/view/js/bootstrap.min.js"></script>

    <script src="<%=request.getContextPath()%>/view/js/bootstrap-dropdownhover.min.js"></script>

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
		#content_page { position: absolute; top: 20px; left: 300px; }
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



	</style>
</head>
<body>
<div class="area">

</div>


<div class="dropdown">

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
</div>

<%-- <nav class="main-menu">
            <ul>
                <li>
                    <a href="${pageContext.request.contextPath}/book/book_list?book_m_category=소설">
                        <i class="fa fa-home fa-2x"></i>
                        <span class="nav-text">
                            소설
                        </span>
                    </a>
                  
                </li>
                <li class="has-subnav">
                    <a href="${pageContext.request.contextPath}/book/book_list?book_m_category=자기개발">
                        <i class="fa fa-laptop fa-2x"></i>
                        <span class="nav-text">
                            자기개발
                        </span>
                    </a>
                    
                </li>
                <li class="has-subnav">
                    <a href="${pageContext.request.contextPath}/book/book_list?book_m_category=건강/다이어트">
                       <i class="fa fa-list fa-2x"></i>
                        <span class="nav-text">
                            건강/다이어트
                        </span>
                    </a>
                    
                </li>
                <li class="has-subnav">
                    <a href="${pageContext.request.contextPath}/book/book_list?book_m_category=외국어">
                       <i class="fa fa-folder-open fa-2x"></i>
                        <span class="nav-text">
                            외국어
                        </span>
                    </a>
                   
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/book/book_list?book_m_category=컴퓨터/IT">
                        <i class="fa fa-bar-chart-o fa-2x"></i>
                        <span class="nav-text">
                            컴퓨터/IT
                        </span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/book/book_list?book_m_category=경영/경제">
                        <i class="fa fa-font fa-2x"></i>
                        <span class="nav-text">
                           경영/경제
                        </span>
                    </a>
                </li>

            </ul>

            <ul class="logout">
                <li>
                   <a href="#">
                         <i class="fa fa-power-off fa-2x"></i>
                        <span class="nav-text">
                            Logout
                        </span>
                    </a>
                </li>  
            </ul>
        </nav> --%>


	<%-- <div id="list_menu">
		<ul class="main_category_wrapper">
			<li class="main_category_list">
				<a class="" href=>소설</a>
				<ul class="sub_category_wrapper">
					<li class="sub_category_list">
						<a class="" href="">소설 전체</a>
					</li>
					<li class="sub_category_list">
						<a class="" href="">일반</a>
					</li>
					<li class="sub_category_list">
						<a class="" href="">SF</a>
					</li>
					<li class="sub_category_list">
						<a class="" href="">추리</a>
					</li>
					<li class="sub_category_list">
						<a class="" href="">판타지 무협</a>
					</li>
					<li class="sub_category_list">
						<a class="" href="">로맨스</a>
					</li>
				</ul>
			
			</li>
			<li class="main_category list"><a class="" href="${pageContext.request.contextPath}/book/book_list?book_m_category=자기개발">자기 개발</a></li>
			<li class="main_category list"><a class="" href="${pageContext.request.contextPath}/book/book_list?book_m_category=건강/다이어트">건강/다이어트</a></li>
			<li class="main_category list"><a class="" href="${pageContext.request.contextPath}/book/book_list?book_m_category=외국어">외국어</a></li>
			<li class="main_category list"><a class="" href="${pageContext.request.contextPath}/book/book_list?book_m_category=컴퓨터/IT">컴퓨터/IT</a></li>
			<li class="main_category list"><a class="" href="${pageContext.request.contextPath}/book/book_list?book_m_category=경영/경제">경영/경제</a></li>
		</ul>
	</div> --%>
	
	<div id="content_page">
		<div id="selected_category">
			선택한 카테고리
		</div>
		<div id="book_popular_list">
			<div id="book_popular_title">
				<h3>신간|베스트 셀러|전체</h3>
			</div>
			
				<c:forEach var="article" items="${booklist}">
				<div class="book_macro_110 book_macro_column_5 book_macro_portrait">
					<div class="book_thumbnail_wrapper">
					<div class="book_thumbnail">
						<div class="thumnail_image">
						<img
						src="<%=request.getContextPath()%>/view/images/carousel/${article.isbn}.jpg"
						class="book-list-thumbnail">
						</div>
					</div>
					</div>
					<div class="book_metadata_wrapper">
					<h3 class="meta_title">
					
					<a class="title_link" href="${pageContext.request.contextPath}/book/book_content?isbn=${article.isbn}">
						
						<span class="title_text js_highlight_helper">
							${article.book_subject }
						</span></a>
						</h3>
					
						<p class="book_metadata author">
						<a>${article.book_writer }</a></p>

					
				</div>
				</div>
				</c:forEach>

				<c:if test="${startPage > bottomLine}">

					<a href="book_list?pageNum=${startPage - bottomLine}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="book_list?pageNum=${i}">[${i}]</a>
				</c:forEach>


				<c:if test="${endPage < pageCount}">
					<a href="book_list?pageNum=${startPage + bottomLine}">[다음]</a>
				</c:if>
				
		</div>
	</div>



</body>
</html>