<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>management center</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet" />
</head>
<body>
<div class="wrapper">
<h1>Welcome to Shopping without Vision Admin Page</h1>
<h2> hello! ${currentUser.username} ! </h2>
<center>
<div>
		<c:if test="${!empty users}">
			<table class="table table-hover text-center">
				<tr>
					<td>User Id</td>
					<td>User Name</td>
					<td>Email</td>
					<td>Phone</td>
				</tr>

				<c:forEach var="user" items="${users}">
					<tr>

						<td><c:out value="${user.uid}"></c:out></td>

						<td><c:out value="${user.username}"></c:out></td>

						<td><c:out value="${user.email}"></c:out></td>

						<td><c:out value="${user.phone}"></c:out></td>

					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
</center>

<a href="<c:url value='/'/>">Home</a> <a href="<c:url value='/logout'/>">Log
Out</a>
</div>
</body>
</html>