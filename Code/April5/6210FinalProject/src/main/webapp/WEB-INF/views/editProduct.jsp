<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form method="POST" action="/coe/product/updated"
		commandName="product">
		<form:input type="hidden" name="pid" path="pid" />
		<form:input path="category.cid" name="categoryId" type="hidden"/>
					Product name: <form:input type="text" name="pname" path="pname" /> 
					Price: <form:input type="text" name="price" path="price" /> 
					Pdesc: <form:input type="text" name="pdesc" path="pdesc" />
					is_hot: <form:input type="text" name="is_hot" path="is_hot" />
					date: <form:input type="DATE" name="pdate" path="pdate" />
		<input type="submit" value="update" class="button">
	</form:form>
</body>
</html>