<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Category</title>
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
</head>
<body>
<audio autoplay>
		<source src="<c:url value="/resources/audio/viewproduct.m4a" />"
			type="audio/mp3" style="display: none" hidden="true">
	</audio>
	<div class="container" align="center">
		<div class="container-fluid bg-2 text-center">
			<h1>Welcome to Shopping without Vision</h1>
			<h6>&nbsp;</h6>
		</div>
		<h6>&nbsp;</h6>
		<fieldset style="width: 600px">
			<table class="table table-striped table-bordered">
				<tbody>
					<tr>
						<td>Product Name</td>
						<td>${product.pname}</td>
					</tr>
					<tr>
						<td>Product Price</td>
						<td>${product.price}</td>
					</tr>
					<tr>
						<td>Product Description</td>
						<td>${product.pdesc}</td>
					</tr>
				</tbody>
			</table>
			<sec:authorize access="hasAuthority('customer')">
				<form action="<c:url value='/cart/${product.pid}/addCart'/>"
					method="post">
					<label>Please input a number:</label> <input type="number"
						name="quantity" min="1" /> <input type="submit"
						value="Add to Cart" class="btn btn-primary" />
				</form>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">

						<thead>
							<tr>
								<td>Review Number</td>
								<td>Product Satisfaction Level</td>
								<td>Service Satisfaction Level</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${commentlist}" var="commentlist">
								<tr>
									<td>${commentlist.comid}</td>
									<td>${commentlist.pLevel}</td>
									<td>${commentlist.sLevel}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<form action="<c:url value='/product/${product.pid}/addComment'/>"
					method="post">
					<input type="submit" value="Write Review" class="btn btn-primary" />
				</form>
			</sec:authorize>
		</fieldset>
	</div>
</body>
</html>