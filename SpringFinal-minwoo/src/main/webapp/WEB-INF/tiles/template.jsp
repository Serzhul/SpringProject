<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>SpringBooks</title>
<meta name="description"
	content="A free and modern UI toolkit for web makers based on the popular Bootstrap 4 framework.">
<meta name="viewport" content="width=device-width, initial-scale=1">



</head>
<body>
    
    <div id="header"><tiles:insertAttribute name="header" /></div>
<%--     <div id="left"><tiles:insertAttribute name="left" /></div> --%>
    <div id="main"><tiles:insertAttribute name="body" /></div>    

 

</body>
</html>