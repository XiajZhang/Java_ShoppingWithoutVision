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
	<form:form method="POST" commandName="product"
		action="/coe/product/adding">
					Product name: <form:input type="text" name="pname" path="pname" /> 
					Price: <form:input type="text" name="price" path="price" /> 
					Pdesc: <form:input type="text" name="pdesc" path="pdesc" />
					is_hot: <form:input type="text" name="is_hot" path="is_hot" />
					data: <form:input type="DATE" name="pdate" path="pdate" />
					category: <form:select path="category.cid" name="categoryId">
			<form:option value="NONE" label="--- Select ---" />
			<c:if test="${!empty categories}">
				<c:forEach var="category" items="${categories}">
					<form:option value= "${category.cid}" label="${category.cname}" />
				</c:forEach>
			</c:if>
		</form:select>
		<input type="submit" value="add" class="button" />
	</form:form>
</body>
</html>