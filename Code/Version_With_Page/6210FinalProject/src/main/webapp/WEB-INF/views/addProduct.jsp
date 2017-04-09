<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Add Product</title>
</head>
<body>
	<div class="container">

		<h1>Please add new product:</h1>
		<form:form method="POST" commandName="product"
			action="/coe/product/adding" class="form-horizontal">

			<div class="form-group">
				<label class="control-label col-sm-2" for="pname">Name:</label>
				<div class="col-sm-10">
					<form:input type="text" class="form-control" id="pname"
						name="pname" path="pname" />
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="price">Price:</label>
				<div class="col-sm-10">
					<form:input type="text" class="form-control" id="price"
						name="price" path="price" />
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pdesc">Description:</label>
				<div class="col-sm-10">
					<form:input type="text" class="form-control" id="pdesc"
						name="pdesc" path="pdesc" />
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="is_hot">Is hot? :</label>
				<div class="col-sm-10">
					<form:input type="text" class="form-control" id="is_hot"
						name="is_hot" path="is_hot" />
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pdate">Date:</label>
				<div class="col-sm-10">
					<form:input type="date" class="form-control" id="pdate"
						name="pdate" path="pdate" />
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pdate">Category:</label>
				<form:select path="category.cid" name="categoryId">
					<form:option value="NONE" label="--- Select ---" />
					<c:if test="${!empty categories}">
						<c:forEach var="category" items="${categories}">
							<form:option value="${category.cid}" label="${category.cname}" />
						</c:forEach>
					</c:if>
				</form:select>
			</div>
			<center>
				<input type="submit" value="Confirm" class="btn btn-primary" />
			</center>
		</form:form>
	</div>
</body>
</html>