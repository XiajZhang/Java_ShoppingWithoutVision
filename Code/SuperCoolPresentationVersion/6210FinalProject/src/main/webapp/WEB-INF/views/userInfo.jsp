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
<!-- 引入 Bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" />
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 包含 bootstrap 样式表 -->
<link rel="stylesheet"
	href="https://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css" />
</head>
<body>
	<div class="container-fluid bg-2 text-center">
		<h1>Welcome to ${user.username}'s Home!</h1>

			<h6>&nbsp;</h6>
			<div class="pull-right">
				<a href="<c:url value='/'/>">Home</a> 
				&nbsp;<a href="<c:url value='/logout'/>">Log Out</a>
			</div>
	</div>

	<div class="container">
	
		<form:form commandName="user" action="/coe/userInfo/update" method="post">
			<form:input type="hidden" path="uid" name="uid" />
			<form:input type="hidden" path="password" name="password" />
			<form:input type="hidden" path="authority" name="authority" />
			<form:input type="hidden" path="photoBytes" name="photoBytes" />
			<form:input type="hidden" path="photoContentType"
				name="photoContentType" />
			<form:input type="hidden" path="photoFilename" name="photoFilename" />

			<div class="row">
				<p>&nbsp;</p>
					<div class="form-group">
						<p>
							<form:label for="username" path="username" cssErrorClass="error">User Name:</form:label>
							<br/>
							<form:input class="form-control"
								placeholder="Please enter your name." path="username" />
							<form:errors path="username" />
						</p>
					</div>
					<div class="form-group">
						<p>
							<form:label for="email" path="email" cssErrorClass="error">Email:</form:label>
							<br />
							<form:input class="form-control"
								placeholder="Please enter an oftenly used email." path="email" />
							<form:errors path="email" />
						</p>
					</div>
					<div class="form-group">
						<p>
							<form:label for="phone" path="phone" cssErrorClass="error">Phone:</form:label>
							<br />
							<form:input class="form-control"
								placeholder="Please enter your phone." path="phone" />
							<form:errors path="phone" />
						</p>
					</div>
				</div>
				<div class="form-group text-center">
					<input type="submit" class="btn btn-info" value="Submit" />
				</div>
		</form:form>
	</div>
</body>
</html>