<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Category</title>
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"/>
</head>
<body>
	<div class="category">
		<h2>Show Current Category</h2>
		<div class="content">
			<form method="get" action="/coe/showcategory">
				<div>
					<table class="category">
						<tr>
							<td>CategoryId</td>
							<td>Category Name</td>
						</tr>
						<c:forEach var="category" items="${categories}">
							<tr>
								<td><c:out value="${category.cid }"></c:out></td>
								<td><c:out value="${category.cname }"></c:out></td>
								<td><a
									href="<c:url value='/category/${category.cid}/editing'/>">Edit</a></td>
								<td><a
									href="<c:url value='/category/${category.cid}/delete'/>">Delete</a></td>
							</tr>
						</c:forEach>
					</table>
					<a href="<c:url value='/category/categoryAdding'/>"> Add Category</a> 
					<a href="<c:url value='/product'/>">All Products</a>
				</div>
			</form>
		</div>
	</div>


</body>
</html>