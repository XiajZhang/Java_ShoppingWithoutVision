<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>My Cart</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet" />
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
	<audio autoplay>
		<source src="<c:url value="/resources/audio/cart.m4a" />"
			type="audio/mp3" style="display: none" hidden="true">
	</audio>
	<div class="container bg-2 text-center">
		<h1>Welcome to Shopping without Vision</h1>
		<h6>&nbsp;</h6>
	</div>
	<h6>&nbsp;</h6>
	<div class="container text-center">
		<h1>My Cart</h1>
		<p></p>
		<!-- <fieldset style="width: 600px"> -->
		<div class="table-responsive">
			<table class="table table-striped">
				<tbody>
					<c:forEach items="${cartItems}" var="cart">
						<table class="table table-striped table-bordered">
							<tr>
								<td>Product Name</td>
								<td>Product Quantity</td>
								<td></td>
							</tr>
							<tr>
								<td>${cart.product.pid}</td>
								<td>${cart.quantity}</td>
								<td><a
									href="<c:url value='/cart/${cart.product.pid}/delete'/>">Delete</a></td>
							</tr>
						</table>
					</c:forEach>
				</tbody>
			</table>
			<a href="<c:url value="/home"/>"><button type="button"
					class="btn btn-info">Continue Buy</button></a> <a
				href="<c:url value="/cart/checkout"/>"><button type="button"
					class="btn btn-info">Check Out</button></a>
		</div>
		<!-- 	</fieldset> -->
	</div>
	<script>
		$(document).keydown(function(e) {
			switch (e.which) {
			case 52: // $ for checkout
				window.location.href = "<c:url value="/cart/checkout"/>";
				break;

			case 50: // @ for orders
			/* 				<a href="<c:url value='/order'/>">My Orders</a> */

				window.location.href = "<c:url value='/order'/>";
				break;

			case 191: // ? for logout
				window.location.href = "<c:url value='/logout'/>";
				break;

			case 38: //up for home
				window.location.href = "<c:url value='/home'/>";
				break;

			case 37: // left back to buy
				window.location.href = "<c:url value='/home'/>";
				break;

			case 39: // right to continue checkout
				window.location.href = "<c:url value="/cart/checkout"/>";
				break;

			default:
				return;
			}
			e.preventDefault();
		});
	</script>
</body>
</html>