<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>management center</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!-- 引入 Bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" />
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 包含 bootstrap 样式表 -->
<link rel="stylesheet"
	href="https://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<h1>Welcome to Shopping without Vision</h1>
		<h2>Hello! ${currentUser.username} !</h2>
		<a href="<c:url value='/userInfo'/>">User Info</a> <a
			href="<c:url value='/address'/>">My Address</a>
			
		<div class="content">
			<form method="post" action="<c:url value="/search"/>" target="_parent">
				<div id="form_wrapper" class="form_wrapper">
					<h3>Search!</h3>
					<div>
						<input id="input" type="text" name="desc" />
					</div>

					<div class="bottom">
						<input type="submit" name="button" value="Search" id="Search"
							class="button" /> 
						<input type="submit" name="button" value="ClearSearch" id="ClearSearch"
							class="button" />
					</div>
				</div>
			</form>
			<div class="clear"></div>
		</div>

		<h1>Here is the search result:</h1>
		<sec:authorize access="hasAuthority('admin')">
			<a href="<c:url value='/product/add'/>">Add Product</a>
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
	<!-- Page start -->
	<div align="center">
		<font size="2">total: ${page.totalPageCount} </font> <font size="2">
			${page.pageNow} page</font> <a href="myProductPage?pageNow=1">FirstPage</a>
		<c:choose>
			<c:when test="${page.pageNow - 1 > 0}">
				<a href="<c:url value='home/myProductPage?pageNow=${page.pageNow - 1}'/>">PreviousPage</a>
			</c:when>
			<c:when test="${page.pageNow - 1 <= 0}">
				<a href="<c:url value='home/myProductPage?pageNow=1'/>">PreviousPage</a>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${page.totalPageCount==0}">
				<a href="<c:url value='home/myProductPage?pageNow=${page.pageNow}'/>">NextPage</a>
			</c:when>
			<c:when test="${page.pageNow + 1 < page.totalPageCount}">
				<a href="<c:url value='home/myProductPage?pageNow=${page.pageNow + 1}'/>">NextPage</a>
			</c:when>
			<c:when test="${page.pageNow + 1 >= page.totalPageCount}">
				<a href="<c:url value='home/myProductPage?pageNow=${page.totalPageCount}'/>">NextPage</a>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${page.totalPageCount==0}">
				<a href="<c:url value='home/myProductPage?pageNow=${page.pageNow}'/>">LastPage</a>
			</c:when>
			<c:otherwise>
				<a href="<c:url value='home/myProductPage?pageNow=${page.totalPageCount}'/>">LastPage</a>
			</c:otherwise>
		</c:choose>
	</div>
	<!-- Page End -->
	<script>
		$(document).keydown(function(e) {
			switch (e.which) {
			case 52: // $ for checkout
				window.location.href = "<c:url value="/cart/checkout"/>";
				break;
				
			case 51: // # for orders
/* 				<a href="<c:url value='/order'/>">My Orders</a> */
				window.location.href = "<c:url value='/order'/>";
				break;
				
			case 40: // down
	        	$('#Search').click();
	        break;

	        case 38: // up
	        	$('#ClearSearch').click();
	        break;

	        case 191: // ? for logout
	        	window.location.href = "<c:url value='/logout'/>";
	        	break;

	        case 53: //% for cart
	        	window.location.href = "<c:url value='/cart'/>";
	        	break;
	        
			case 39: // right
				break;

			case 40: // down
				break;

			default:
				return;
			}
			e.preventDefault();
		});
	</script>
</body>
</html>

