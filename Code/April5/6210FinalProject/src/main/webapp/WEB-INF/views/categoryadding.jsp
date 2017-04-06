<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Add Category</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet" />
</head>
<body>
	<h2>Add Category</h2>
	<div class="content">
		<form method="post" action="/coe/category/categorycreated">
			<h3>Adding</h3>
			<div>
				<label>Category Name:</label><input type="text" name="cname" />
			</div>
			<input type="submit" value="Add" class="categoryadding" />
		</form>
	</div>
</body>
</html>