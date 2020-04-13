<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	padding-bottom: 5px;
	text-align: center;
	font-size: 20px;
	color: #666;
}

.book-meta-box-title {
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
	display: block;
	margin-left: auto;
	margin-right: auto;
	width: 72px;
	height: 100px;
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

.bestseller_colum {
	width: 16.66666667%;
	float: left;
	margin-top: 20px;
	text-align: center;
}

.book-meta-box-wrapper {
	width: 150px;
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
</style>
<script>

var avgr = 1;

function rankStar(avgr) {
		
		var stars = "";
		
		for(var i=0; i<avgr; i++) {
			stars += "★";
		}
		
		return stars;
		
}


</script>



<span class="rank-menu"> &nbsp; 베스트 셀러</span>
<div class="rank-list">
	<c:forEach var="bs" items="${bestseller}">
		<div class="bestseller_colum">
			<div class="rank-list-item">
				<a href=# class="book-meta-box-rank"> ${bs.rk} </a>
				<div class="rank-list-image">
					<img
						src="<%=request.getContextPath()%>/view/images/carousel/${bs.isbn}.jpg"
						class="rank-list-thumbnail">
				</div>
			</div>

			<div class="book-meta-box-wrapper" id="avgr">
				<div class="book-meta-box-title">${bs.book_subject}</div>
				<span class="book-meta-box-author"> ${bs.book_writer} </span>
				<p>
					<span class="StarRate_IconBox"> 
						<c:forEach begin="1" end="${bs.avgr}">

							<img
								src="<%=request.getContextPath()%>/view/images/common/greenstar.png"
								class="Rating-Star">

						</c:forEach> 
					<span class="Rating-Member">&nbsp; ${bs.rm}명</span>
					</span>
					
				</p>
			</div>
		</div>
	</c:forEach>



</div>
</div>
</body>
</html>