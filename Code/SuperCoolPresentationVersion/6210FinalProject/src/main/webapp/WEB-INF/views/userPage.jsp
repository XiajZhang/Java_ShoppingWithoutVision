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
		src="<c:url value="/resources/audio/userPage.m4a" />" type="audio/mp3"
		style="display:none" hidden="true"></audio>
	<div class="blank"></div>
	<div class="container-fluid bg-2 text-center">

		<h1>Welcome to Shopping without Vision</h1>

		<img src="<c:url value="/resources/image/1.jpg" />" class="img-circle"
			alt="Cinque Terre" width="304" height="304">
		<p>&nbsp;</p>

	</div>
	<script>
		$(document).keydown(function(e) {
			switch (e.which) {
			case 82: // R for registry
				window.location.href = "<c:url value="/register"/>";
				break;

			case 76: // L for Login
				window.location.href = "<c:url value="/home"/>";
				break;

			case 39: // right
				break;

			case 40: // down
				break;

			default:
				return;
			}
			e.preventDefault();
		});
	</script>

</body>
</html>

