<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.DataInputStream"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<title>Search Result</title>
</head>
<body>
	<center>
		<h1>Select a shipping address:</h1>
		<a href="<c:url value='/address/add'/>"><button type="button"
				class="btn btn-info">New Address</button></a>
		<div class="container">
			<c:if test="${!empty addresslist}">
				<table class="table table-striped table-bordered">
					<tr>
						<td>Address ID</td>
						<td>Address</td>
						<td>State</td>
						<td>Country</td>
						<td>Zip Code</td>
						<td>Receiver</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<c:forEach items="${addresslist}" var="address">
						<tr>
							<td>${address.addressid}</td>
							<td>${address.address}</td>
							<td>${address.state}</td>
							<td>${address.country}</td>
							<td>${address.zipCode}</td>
							<td>${address.receiver}</td>
							<td><a
								href="<c:url value='/address/${address.addressid}/edit'/>">Edit</a></td>
							<td><a
								href="<c:url value='/address/${address.addressid}/delete'/>">Delete</a></td>
							<td><a
								href="<c:url value='/order/${address.addressid}/create'/>">Select</a></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</div>
	</center>
	<script>
		$(document).keydown(function(e) {
			switch (e.which) {
			case 53: // % for cart
				window.location.href = "<c:url value="/cart/checkout"/>";
				break;

			case 51: // # for orders
			/* 				<a href="<c:url value='/order'/>">My Orders</a> */

				window.location.href = "<c:url value='/order'/>";
				break;

			case 191: // ? for logout
				window.location.href = "<c:url value='/logout'/>";
				break;

			case 192: //` for home
				window.location.href = "<c:url value='/home'/>";
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