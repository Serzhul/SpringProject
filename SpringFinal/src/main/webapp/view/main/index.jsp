<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>SpringBooks</title>
<meta name="description"
	content="A free and modern UI toolkit for web makers based on the popular Bootstrap 4 framework.">
<meta name="viewport" content="width=device-width, initial-scale=1">
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

<style>
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

.rank-list-thumbnail {
	display: block;
	box-sizing: border-box;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: linear-gradient(to right, rgba(0, 0, 0, .2) 0,
		rgba(0, 0, 0, 0) 5%, rgba(0, 0, 0, 0) 95%, rgba(0, 0, 0, .2) 100%);
	border: solid 1px rgba(0, 0, 0, .1);
	content: '';
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

.rank-menu {
	font-size: 19px;
	font-weight: normal;
	line-height: 26px;
	color: #000000;
	word-break: keep-all;
}

.slick-list {
	margin: 0;
}
</style>

<script>
$(document).ready(function(){

	  $('.book-items').slick({
		  infinite: true,
		  slidesToShow: 3,
		  slidesToScroll: 1,
		  centerMode:true,
		  variableWidth: true
		  
		});
	  
	  $('.review-items').slick({
		  infinite: true,
		  slidesToShow: 3,
		  slidesToScroll: 1,
		  centerMode:true
		  
		});
	  	
	  var totalSlide = 6;
	  
	  var currentSlide = $('.book-items').slick('slickCurrentSlide');
	 
	  $('.slidenumber').text(currentSlide+1 + '/' + totalSlide);
	  
$('.slick-prev').on('click', function() {
		 
	 	var currentSlide = $('.book-items').slick('slickCurrentSlide');
		$('.slidenumber').text(currentSlide+1 + '/' + totalSlide);
		 
		});
	  

$('.slick-next').on('click', function() {
		  
		  var currentSlide = $('.book-items').slick('slickCurrentSlide');
		  $('.slidenumber').text(currentSlide+1 + '/' + totalSlide);  

	    });
	    
	});

function startTime() {
	  var today = new Date();
	  var h = today.getHours();
	  var m = today.getMinutes();
	  var s = today.getSeconds();
	  m = checkTime(m);
	  s = checkTime(s);
	  document.getElementById('txt').innerHTML =
	 "<i class='material-icons'>access_time</i>" + "&nbsp;&nbsp;"+ h + "시 " + m + "분";
	  var t = setTimeout(startTime, 500);
	}
	function checkTime(i) {
	  if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
	  return i;
	}
	
	
	function search(ele) {
	    if(event.key === 'Enter') {
	    	location.href="searchresult?keyword="+ele.value;  
	    }
	}
	
	function join() {
		location.href="<%=request.getContextPath()%>/member/join";
	}
	
	function login() {
		location.href="<%=request.getContextPath()%>/member/login";
	}
	
	function library() {
		location.href="<%=request.getContextPath()%>/member/my_library";
	}
	
	function logout() {
		location.href="<%=request.getContextPath()%>/member/logout";
	}

	</script>

</head>
<body onload="startTime()">
	<div class="bg-success">
		<nav
			class="navbar navbar-expand-lg navbar-dark bg-success navbar-margin-bottom">
		<img
			src="<%=request.getContextPath()%>/view/images/demo/shards-logo.svg"
			alt="Example Navbar 1" class="mr-2 left-margin" height="30"> <a
			class="navbar-brand logoname" href="#">SpringBooks</a>


			<c:if test="${empty member}">

		<div class="ml-auto right-margin">
			<button type="button" class="btn btn-success join-button " onclick="join()">회원가입</button>
			<span>&nbsp;&nbsp;</span>
			<button type="button" class="btn btn-success login-button " onclick="login()">로그인</button>
		</div>
			</c:if>
			
			<c:if test="${!empty member}">

		<div class="ml-auto right-margin">
		
			<button type="button" class="btn btn-success join-button " onclick="library()">내 서재</button>
			
			<button type="button" class="btn btn-success login-button " onclick="logout()">로그아웃</button>
		</div>
			</c:if>
		
		<input class="form-control search-bar" type="text"
			placeholder="제목,저자,출판사 검색" aria-label="Search"
			onkeydown="search(this)"> </nav>

		<nav class="navbar navbar-expand-lg navbar-dark bg-success">
		<div class="navbar-collapse mr-auto left-margin"
			id="navbarNavDropdown-3">
			<ul class="navbar-nav mr-auto nav-subbar">

				<li class="nav-item active"><a class="nav-link nav-link-margin"
					href="#"> <i class="material-icons nav-subbar-icon"
						style="margin: 0; padding: 0">home_work</i> <span
						class="submenu-name"> &nbsp; 홈 </span> <span
						class="navbar-underline"></span>

				</a></li>

				<li class=""><a class="nav-link nav-link-margin" href="#">
						<i class="material-icons nav-subbar-icon"
						style="margin: 0; padding: 0">alarm</i> <span class="submenu-name">
							&nbsp; 알림 </span>
				</a></li>

				<li class=""><a class="nav-link nav-link-margin" href="#">
						<i class="material-icons nav-subbar-icon"
						style="margin: 0; padding: 0">shopping_cart</i> <span
						class="submenu-name">&nbsp;마이카트 </span>
				</a></li>

				<li class=""><a class="nav-link nav-link-margin" href="#">
						<i class="material-icons nav-subbar-icon"
						style="margin: 0; padding: 0">assignment_ind</i> <span
						class="submenu-name">&nbsp;마이페이지 </span>
				</a></li>

			</ul>

		</div>
		</nav>
	</div>
	<nav class="navbar navbar-expand-lg navbar-dark mb-2" style="padding:0">
	<div class="navbar-collapse mr-auto left-margin"
		id="navbarNavDropdown-3">
		<ul class="navbar-nav mr-auto nav-subbar">

			<li class="nav-item"><a class="nav-link" href="#"> <span
					class="home-subbar "> <i
						class="material-icons nav-subbar-icon"
						style="margin-left: 26px; font-size: 26px">menu</i></span>
			</a></li>

			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/book/book_list?book_m_category=소설"> <span
					class="home-subbar subbar-margin subbar-active">&nbsp; 소설 </span>
			</a></li>


			<li class=""><a class="nav-link" href="${pageContext.request.contextPath}/book/book_list?book_m_category=자기개발"
				style="margin-right: 15px"> <span
					class="home-subbar subbar-margin"> &nbsp; 자기 개발 </span>
			</a></li>
			<li class=""><a class="nav-link" href="${pageContext.request.contextPath}/book/book_list?book_m_category=건강/다이어트"
				style="margin-right: 15px"> <span
					class="home-subbar subbar-margin">&nbsp; 건강/다이어트 </span>
			</a></li>

			<li class=""><a class="nav-link" href="${pageContext.request.contextPath}/book/book_list?book_m_category=외국어"
				style="margin-right: 15px"> <span
					class="home-subbar subbar-margin">&nbsp; 외국어 </span>
			</a></li>

			<li class=""><a class="nav-link" href="${pageContext.request.contextPath}/book/book_list?book_m_category=컴퓨터/IT"
				style="margin-right: 15px"> <span
					class="home-subbar subbar-margin"> &nbsp; 컴퓨터/IT </span>
			</a></li>
			<li class=""><a class="nav-link" href="${pageContext.request.contextPath}/book/book_list?book_m_category=경영/경제"
				style="margin-right: 15px"> <span
					class="home-subbar subbar-margin">&nbsp; 경영/경제 </span>
			</a></li>

		</ul>
		<hr class="home-subbar-border" />
	</div>
	</nav>


	<div class="book-items">

		<div class="carousel-container">
			<img class="carousel-images"
				src="<%=request.getContextPath()%>/view/images/carousel/carousel1.jpg">
		</div>
		<div class="carousel-container">
			<img class="carousel-images"
				src="<%=request.getContextPath()%>/view/images/carousel/carousel1.jpg">
		</div>
		<div class="carousel-container">
			<img class="carousel-images"
				src="<%=request.getContextPath()%>/view/images/carousel/carousel1.jpg">
		</div>
		<div class="carousel-container">
			<img class="carousel-images"
				src="<%=request.getContextPath()%>/view/images/carousel/carousel1.jpg">
		</div>
		<div class="carousel-container">
			<img class="carousel-images"
				src="<%=request.getContextPath()%>/view/images/carousel/carousel1.jpg">
		</div>
		<div class="carousel-container">
			<img class="carousel-images"
				src="<%=request.getContextPath()%>/view/images/carousel/carousel1.jpg">
		</div>


	</div>

	<span class="slidenumber"></span>

	<div>
		<br>
		<br>
		<br>
		<br>
	</div>


	<div class="review-items">
		<c:set var="i" value="0" scope="page" />
		<c:forEach var="br" items="${bestreview}">
			<%--   <c:forEach var="i" begin="0" end="${fn:length(content)-1}"> --%>
			<div class="carousel-container review-carousel">
				<div class="row">
					<div class="card review-margin">
						<img class="card-img-top"
							src="<%=request.getContextPath()%>/view/images/carousel/${br.isbn}.jpg"
							alt="Card image cap" style="width: 100%; height: 300px">
						<div class="card-body">
							<h6 class="card-title">${br.book_subject}</h6>
							<p class="card-text">

								<c:if test="${fn:length(content.get(i))<=30}">
                  ${content.get(i)}
                 	 </c:if>
								<c:if test="${fn:length(content.get(i))>30}">
                  ${fn:substring(content.get(i), 0, 30)}...
                 	 </c:if>
							</p>
							<a href="#" class="btn btn-primary">자세히 보기</a>
						</div>
					</div>

				</div>
			</div>
			<c:set var="i" value="${i+1}" scope="page" />
		</c:forEach>
		<%-- </c:forEach> --%>
	</div>

	<br>
	<br>

	<div id="txt" class="timer"></div>
	<span class="rank-menu"> &nbsp; 베스트 셀러</span>
	<span><a href="<%=request.getContextPath()%>/main/bestseller" />
		클릭!</span>
	<div class="rank-list">
		<ul class="rank-list-ul">
			<c:forEach var="bs" items="${bestseller}">
				<li class="rank-list-li">
					<div class="rank-list-item">
						<div class="rank-list-image">
							<img
								src="<%=request.getContextPath()%>/view/images/carousel/${bs.isbn}.jpg"
								class="rank-list-thumbnail">
						</div>
					</div>
					<div class="book-meta-box">
						<a href=# class="book-meta-box-rank"> ${bs.rk} </a>
						<div class="book-meta-box-books">
							<h2 class="book-meta-box-title" style="display: inline">${bs.book_subject}
							</h2>
							<span class="book-meta-box-author"> ${bs.book_writer } </span>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>

	</div>


</body>
</html>