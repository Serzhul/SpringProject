<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Shards Demo - A free and modern UI toolkit for web makers</title>
  <meta name="description" content="A free and modern UI toolkit for web makers based on the popular Bootstrap 4 framework.">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="css/shards.min.css?v=3.0.0">
  <link rel="stylesheet" href="css/shards-demo.min.css?v=3.0.0">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<style>
.search-bar {
position:fixed;
margin-left:260px;
width : 30%;
}
.join-button {
font-weight : bold;
border-color: white;
height : 35px;
width : 95px;
font-size: 0.75rem;
border-radius: 4px;
padding:0;
}
.join-button:hover {
border-color: white;
opacity: 0.7;
}
.login-button {
margin : 0;
font-weight : bold;
background-color : white;
color : #17c671;
height : 37px;
font-size: 13px;
}
.login-button:hover {
background-color : white;
color : #17c671;
opacity : 0.7;
}
.navbar-margin-bottom {
margin-bottom:0;}

.left-margin {
margin-left : 60px}

.right-margin {
margin-right : 100px}

.nav-subbar {
font-weight : bold;

}

@media (min-width: 576px) {
  .nav-subbar-icon {
    padding-right: 0.625rem;
    padding-left: 0.625rem;
  }
}

@media (min-width: 768px) {
  .navbar-expand-md .navbar-nav .nav-link {
    padding-right: 0.625rem;
    padding-left: 0.625rem;
  }
}

@media (min-width: 992px) {
  .navbar-expand-lg .navbar-nav .nav-link {
    padding-right: 0.625rem;
    padding-left: 0.625rem;
  }
}

@media (min-width: 1200px) {
  .navbar-expand-xl .navbar-nav .nav-link {
    padding-right: 0.625rem;
    padding-left: 0.625rem;
  }
}

@media (max-width: 999px) {
.join-button .login-button{
    padding: 0 3px;
}
}

@media (max-width: 999px) {
.search-bar{
   width:100%;
   position:static;
   margin:0;
}
}

@media (max-width: 999px) {
.logoname{
justify-content:flex-start;
   margin-left:0;
}
}

@media (max-width: 999px) {
.navbar{
justify-content:flex-start;
   padding-right:3px;
   padding-left:3px;
   padding-bottom:0px;
}
}

@media (max-width: 999px) {
.right-margin{
margin:0;
}
}

@media (max-width: 999px) {
.submenu-name{
display:none;
}
}

@media (max-width: 999px) {
i.material-icons{
font-size:40px;
margin-right:100%;
}
}
@media (max-width: 999px) {
.navbar-nav {
flex-direction:row;
width:100%}
}

@media (max-width: 999px) {
li {
display:inline-block;
width:50%;}
}






</style>
</head>
<body>
<div claass="bg-success">
<nav class="navbar navbar-expand-lg navbar-dark bg-success navbar-margin-bottom">
          <img src="images/demo/shards-logo.svg" alt="Example Navbar 1" class="mr-2 left-margin" height="30">
          <a class="navbar-brand logoname" href="#">SpringBooks</a>
          
          <div class="ml-auto right-margin">
          <button type="button" class="btn btn-success join-button ">회원가입</button>
          <span>&nbsp;&nbsp;</span>
          <button type="button" class="btn btn-success login-button ">로그인</button>
          </div>
          <input class="form-control search-bar" type="text" placeholder="제목,저자,출판사 검색" aria-label="Search">
</nav>
<nav class="navbar navbar-expand-lg navbar-dark bg-success mb-4">
          <div class="navbar-collapse mr-auto left-margin" id="navbarNavDropdown-3">
            <ul class="navbar-nav mr-auto nav-subbar">
              <li class="nav-item active">
              
                <a class="nav-link" href="#" style="margin-right : 30px"> 
                <i class="material-icons nav-subbar-icon">home_work</i> 
                <span class="submenu-name">&nbsp; 홈 </span>
                </a>
              </li>
              <li class="active">
                <a class="nav-link" href="#" style="margin-right : 30px"> 
                <i class="material-icons nav-subbar-icon">alarm</i> 
                <span class="submenu-name"> &nbsp; 알림 </span>
                </a>
              </li>
              <li class="active">
                <a class="nav-link" href="#" style="margin-right : 30px"> 
                <i class="material-icons nav-subbar-icon">shopping_cart</i> 
                <span class="submenu-name">&nbsp;마이 카트 </span>
                </a>
              </li>
              
              <li class=" active">
                <a class="nav-link" href="#"> 
                <i class="material-icons nav-subbar-icon">assignment_ind</i> 
                <span class="submenu-name">&nbsp;마이 페이지 </span>
                </a>
              </li>
              
              
<!--               <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="https://designrevision.com" id="navbarDropdownMenuLink-3" data-toggle="dropdown"
                  aria-haspopup="true" aria-expanded="false">
                  Services
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink-3">
                  <a class="dropdown-item" href="#">Design</a>
                  <a class="dropdown-item" href="#">Development</a>
                  <a class="dropdown-item" href="#">Marketing</a>
                </div>
              </li> -->
            </ul>

          </div>
</nav>
</div>



</body>
</html>