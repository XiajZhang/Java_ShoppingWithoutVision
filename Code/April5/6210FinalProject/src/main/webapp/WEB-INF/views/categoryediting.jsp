<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Editing Category</title>
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet" />
</head>
<body>
	<div class="categoryedit">
		<h2>Edit Category</h2>
		<div class="content">
			<form:form method="post" action="/coe/category/categoryupdated"
				commandName="category">
				<h3>Edit</h3>
				<div>
					<form:label path="cname">Input New Category Name:</form:label>
					<form:input type="text" name="cname" path="cname" />
					<form:input type="hidden" name="cid" path="cid" />

				</div>
				<div class="button">
					<input type="submit" value="Submit Change" class="categoryedit" />
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>