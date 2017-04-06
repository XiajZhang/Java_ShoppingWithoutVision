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
		<h1>Welcome to Shopping without Vision</h1>
		<h2>hello! ${user.username}!</h2>
		<center>
			<form:form commandName="user" action="/coe/userInfo/update"
				method="post" enctype="multipart/form-data">
				<fieldset style="width: 200px">
					<legend>User Fields</legend>
					<form:input type="hidden" path="uid" name="uid" />
					<form:input type="hidden" path="password" name="password" />
					<form:input type="hidden" path="authority" name="authority" />
					<form:input type="hidden" path="photoBytes" name="photoBytes" />
					<form:input type="hidden" path="photoContentType"
						name="photoContentType" />
					<form:input type="hidden" path="photoFilename" name="photoFilename" />
					<div class="form-group">
						<p>
							<img src="<c:url value='userInfo/${user.uid}/photo'/>"
								height="150" width="150" class="img-circle" />
							<form:input type="file" name="photoChange" path="photoChange" />
						</p>
					</div>
					<div class="form-group">
						<p>
							<form:label for="username" path="username" cssErrorClass="error">User Name:</form:label>
							<br />
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
					<div class="form-group"></div>
					<div class="form-group">
						<p>
							<input type="submit" class="btn btn-info" value="Submit Change" />
						</p>
					</div>
				</fieldset>
			</form:form>
		</center>

		<a href="<c:url value='/'/>">Home</a> <a
			href="<c:url value='/logout'/>">Log Out</a>
	</div>
</body>
</html>