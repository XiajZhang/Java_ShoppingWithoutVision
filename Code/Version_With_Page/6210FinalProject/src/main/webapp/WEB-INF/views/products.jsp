<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.DataInputStream"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.io.PrintWriter"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<title>Search Result</title>
</head>
<body>
	<div class="wrapper">
		<h1>All categories:</h1>
		<a href="<c:url value='/category/showcategory'/>"><button
				type="button" class="btn btn-primary">All Categories</button></a> <a
			href="<c:url value='/category/categoryAdding'/>"><button
				type="button" class="btn btn-success">Add Category</button></a>

		<div class="table-responsive">
			<table class="table table-striped table-bordered">
				<c:forEach var="category" items="${categories}">
					<thead>
						<tr>
							<td><a href="<c:url value='/product/${category.cid}'/>"><c:out
										value="${category.cname }"></c:out><span class="badge"></span></a></td>
						</tr>
					</thead>
				</c:forEach>
			</table>
		</div>

		<h2>Here is the search result:</h2>
		<sec:authorize access="hasAuthority('admin')">
			<a href="<c:url value='/product/add'/>"><button type="button"
					class="btn btn-info">Add Product</button></a>
		</sec:authorize>
		<div class="table-responsive">
			<table class="table table-striped table-bordered">

				<thead>
					<tr>
						<td>Product ID</td>
						<td>Product Name</td>
						<td>Product Price</td>
						<td>Product Description</td>
						<td>Date</td>
						<td></td>
						<td></td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${plist}" var="plist">
						<tr>
							<td>${plist.pid}</td>
							<td><a
								href="<c:url value='/product/${plist.pid}/viewProduct'/>">${plist.pname}</a></td>
							<td>${plist.price}</td>
							<td>${plist.pdesc}</td>
							<td>${plist.pdate}</td>
							<sec:authorize access="hasAuthority('admin')">
								<td><a href="<c:url value='/product/${plist.pid}/edit'/>">Edit</a></td>
								<td><a href="<c:url value='/product/${plist.pid}/delete'/>">Delete</a></td>
							</sec:authorize>
						</tr>

					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>