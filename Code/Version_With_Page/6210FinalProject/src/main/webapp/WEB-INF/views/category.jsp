<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Category</title>
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
		<div class="category">
			<h1>Show Current Category</h1>
			<div class="content">
				<form method="get" action="/coe/showcategory">
					<div class="table-responsive">
						<a href="<c:url value='/category/categoryAdding'/>"> <button
			type="button" class="btn btn-primary">Add Category</button></a> 
							
						<a href="<c:url value='/product'/>"><button
			type="button" class="btn btn-primary">All Products</button></a>
						<table class="table table-striped table-bordered">
							<tr>
								<td>CategoryId</td>
								<td>Category Name</td>
								<td></td>
								<td></td>
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

					</div>
				</form>
			</div>
		</div>
	</div>


</body>
</html>