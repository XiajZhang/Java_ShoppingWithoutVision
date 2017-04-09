<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>management center</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"/>
<!-- 引入 Bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"/>
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 包含 bootstrap 样式表 -->
<link rel="stylesheet"
	href="https://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
</head>
<body>
<div class="wrapper">		
  	<h2>Welcome to Management Center:</h2>
	<div class="table-responsive">
		<c:if test="${!empty users}">
		<table class="table table-striped table-bordered">
            <thead>
                <tr>
                   <td>User Id</td>
					<td>User Name</td>
					<td>Email</td>
					<td>Phone</td>
					<td>Delete</td>
				</tr>
	         </thead>
              <tbody>
               <c:forEach var="user" items="${users}">
					<tr>
						<td><c:out value="${user.uid}"></c:out></td>
						<td><c:out value="${user.username}"></c:out></td>
						<td><c:out value="${user.email}"></c:out></td>
						<td><c:out value="${user.phone}"></c:out></td>					
						<td><a href="<c:url value='/userInfo/${user.uid}/delete'/>">Delete</a></td>
					</tr>
				</c:forEach>
			  </tbody>
       </table>
     </c:if>
</div>
<a href="<c:url value='/'/>">Home</a> <a href="<c:url value='/logout'/>">Log
Out</a>
</div>
</body>
</html>