<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.DataInputStream"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Result</title>
</head>
<body>

	<h1>Here is the search result:</h1>
	<a href="<c:url value='/product/add'/>">Add Product</a>
	<table border="1">
		<c:forEach items="${plist}" var="plist">
			<tr>
				<td>Product ID</td>
				<td>Product Name</td>
				<td>Product Price</td>
				<td>Product Description</td>
				<td>DATE</td>
			</tr>
			<tr>
				<td>${plist.pid}</td>
				<td>${plist.pname}</td>
				<td>${plist.price}</td>
				<td>${plist.pdesc}</td>
				<td>${plist.pdate}</td>
				<td><a href="<c:url value='/product/${plist.pid}/edit'/>">Edit</a></td>
				<td><a href="<c:url value='/product/${plist.pid}/delete'/>">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
	<h2>All the Categories:</h2>
<%-- 	<a href="<c:url value='/product/add'/>">All the Category</a> --%>
		<div>
			<table class="category">
				<c:forEach var="category" items="${categories}">
					<tr>
						<td><a href="<c:url value='/product/${category.cid}'/>"><c:out value="${category.cname }"></c:out></a></td>
					</tr>
				</c:forEach>
			</table>
			<a href="<c:url value='/category/categoryAdding'/>">Add Category</a>
		</div>
	<a href="<c:url value='/category/showcategory'/>">All Categories</a>
</body>
</html>