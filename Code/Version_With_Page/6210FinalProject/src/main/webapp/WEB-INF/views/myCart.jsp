<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<center>
		<fieldset style="width: 400px">
			<h1>My Cart</h1>
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
				<a href="<c:url value="/"/>"><button type="button"
			class="btn btn-info">Continue Buy</button></a>
				<a href="<c:url value="/cart/checkout"/>"><button type="button"
			class="btn btn-info">Check Out</button></a>
			</div>
		</fieldset>
	</center>
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

	        case 191: // ? for logout
	        	window.location.href = "<c:url value='/logout'/>";
	        	break;

	        case 192: //` for home
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