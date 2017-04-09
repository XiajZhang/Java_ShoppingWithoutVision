<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.DataInputStream"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
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
	<audio autoplay> <source
		src="<c:url value="/resources/audio/address.m4a" />" type="audio/mp3"
		style="display:none" hidden="true"></audio>
	<div class="container bg-2 text-center">
			 <h1>Welcome to Shopping without Vision</h1> 
			<h6>&nbsp;</h6>
	       </div>
	       <h6>&nbsp;</h6>
	      	<div class="container">
		<h1>Select a shipping address:</h1>
		<a href="<c:url value='/address/add'/>"><button type="button"
				class="btn btn-info">New Address</button></a>
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
	<script>
		$(document).keydown(function(e) {
			switch (e.which) {
			case 53: // % for cart
				window.location.href = "<c:url value='/cart'/>";
				break;

			case 51: // # for orders
				window.location.href = "<c:url value='/order'/>";
				break;

			case 191: // ? for logout
				window.location.href = "<c:url value='/logout'/>";
				break;

			case 38: //up for home
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