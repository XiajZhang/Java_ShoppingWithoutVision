<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
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
	<audio autoplay> <source
		src="<c:url value="/resources/audio/register.m4a" />" type="audio/mp3"
		style="display:none" hidden="true"></audio>
	<div class="container-fluid bg-2 text-center">
		<p class="ex1">
			<img src="<c:url value="/resources/image/1.jpg" />"
				class="img-circle" alt="Cinque Terre" width="304" height="304">
		</p>
	</div>

	<div class="container">
		<form method="post" action="/coe/registering">
			<div class="row">
				<div class="ex2">
					<div class="col-sm-5">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input id="username"
								type="text" class="form-control" name="username"
								placeholder="username">
						</div>
					</div>
					<div class="col-sm-5">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> <input id="password"
								type="password" class="form-control" name="password"
								placeholder="password">
						</div>
					</div>
					<div class="col-sm-2">
						<div class="input-group">
							<button type="submit" class="btn btn-default">Register</button>
						</div>
					</div>
				</div>
			</div>

		</form>
	</div>
</body>
</html>

