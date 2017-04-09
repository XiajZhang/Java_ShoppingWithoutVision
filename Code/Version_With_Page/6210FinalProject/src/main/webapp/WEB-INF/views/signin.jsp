<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>management center</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet" />
<!-- 引入 Bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
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
		<h1>Welcome to Shopping without Vision Admin Page</h1>
		<p></p>
		<p></p>
		<div class="content">
			<form method="post" action="/coe/Login" target="_parent">
			
			
				<div id="form_wrapper" class="form_wrapper">
					<h3>Login</h3>
					<div>
						<label>Username:</label> <input type="text" name="username" /> <span
							class="error">This is an error</span>
					</div>
					<div>
						<label>Password:</label> <input type="password" name="password" />
						<span class="error">This is an error</span>
					</div>
					<div class="bottom">
						<input type="submit" value="Login" class="button" /> <input
							type="hidden" name="act" value="signin" /> <a
							href="<c:url value="/register"/>">No account? Register</a>
					</div>
				</div>
			</form>
			<div class="clear"></div>

		</div>
		<div class="clear"></div>
	</div>

</body>
</html>

