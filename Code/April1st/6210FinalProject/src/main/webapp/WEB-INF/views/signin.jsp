<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
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
		<h2>
			Username and Password: <span>admin</span>
		</h2>
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
			<!-- 			<form method="post" action="/coe/register">
				<input type="submit" value="register" class="button"> </input>
			</form> -->
			<div class="clear"></div>

		</div>
		<div class="clear"></div>
	</div>

</body>
</html>

