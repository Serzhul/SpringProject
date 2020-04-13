<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
		location.href="<%=request.getContextPath()%>/mypage/mylibrary";
	}
	
	
	function logout() {
		location.href="<%=request.getContextPath()%>
	/member/logout";
	}
</script>

</head>
</head>
<body>
<div class="bg-success">
		<nav
			class="navbar navbar-expand-lg navbar-dark bg-success navbar-margin-bottom">
		<img
			src="<%=request.getContextPath()%>/view/images/demo/shards-logo.svg"
			alt="Example Navbar 1" class="mr-2 left-margin" height="30"> <a
			class="navbar-brand logoname" href="<%=request.getContextPath()%>/main/index">SpringBooks</a>


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
					href="${pageContext.request.contextPath}/main/index"> <i class="material-icons nav-subbar-icon"
						style="margin: 0; padding: 0">home_work</i> <span
						class="submenu-name"> &nbsp; 홈 </span> <span
						class="navbar-underline"></span>

				</a></li>

				<li class=""><a class="nav-link nav-link-margin" href="#">
						<i class="material-icons nav-subbar-icon"
						style="margin: 0; padding: 0">alarm</i> <span class="submenu-name">
							&nbsp; 알림 </span>
				</a></li>
				
				<c:if test="${!empty member}">
				<li class=""><a class="nav-link nav-link-margin"
				href="${pageContext.request.contextPath}/mypage/mycart">
						<i class="material-icons nav-subbar-icon"
						style="margin: 0; padding: 0">shopping_cart</i> <span
						class="submenu-name">&nbsp;마이카트 </span>
				</a></li>
				</c:if>

				<c:if test="${!empty member}">
				<li class=""><a class="nav-link nav-link-margin"
				href="${pageContext.request.contextPath}/mypage/mymain">
						<i class="material-icons nav-subbar-icon"
						style="margin: 0; padding: 0">assignment_ind</i> <span
						class="submenu-name">&nbsp;마이페이지 </span>
				</a></li>
				</c:if>

			</ul>

		</div>
		</nav>
	</div>
</body>
</html>