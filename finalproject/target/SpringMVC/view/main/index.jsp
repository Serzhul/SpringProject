<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>


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
	
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/view/css/header.css">
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/view/carousel/slick/slick.min.js"></script>
	
	

<style>

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
	<%-- <div class="bg-success">
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
	</div> --%>
	
	<nav class="navbar navbar-expand-lg navbar-dark mb-2" style="padding:0">
	<div class="navbar-collapse mr-auto left-margin"
		id="navbarNavDropdown-3">
		<ul class="navbar-nav mr-auto nav-subbar">

			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/book/book_category"> <span
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