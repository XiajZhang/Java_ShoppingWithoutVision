<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>management center</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"/>
</head>
<body>
	<div class="wrapper">
		<h1>Welcome to Shopping without Vision Admin Page</h1>
		<h2>
			hello! ${currentUser.username} !
		</h2>
		<a href="<c:url value='/listAll'/>">All Users</a>
		<a href="<c:url value='/userInfo'/>">User Info</a>
		<a href="<c:url value='/logout'/>">Log Out</a>
		</div>
</body>
</html>

