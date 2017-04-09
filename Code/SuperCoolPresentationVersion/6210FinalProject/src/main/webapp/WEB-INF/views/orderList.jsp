<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>management center</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
		<source src="<c:url value="/resources/audio/orderlist.m4a" />"
			type="audio/mp3" style="display: none" hidden="true">
	</audio>
	<div class="container bg-2 text-center">
		<h1>Welcome to Shopping without Vision</h1>
		<h6>&nbsp;</h6>
	</div>
	<h6>&nbsp;</h6>
	<center>
		<div class="container table-responsive">
			<c:if test="${!empty orders}">
				<table class="table table-striped table-bordered">
					<tr>
						<td>Order ID</td>
						<td>Total</td>
						<td>Address</td>
						<td>Time</td>
					</tr>

					<c:forEach var="order" items="${orders}" varStatus="status">
						<tr>

							<td><a href="<c:url value='/order/${order.oid}/viewItems'/>"><c:out
										value="${order.oid}"></c:out></a></td>

							<td><c:out value="${order.total}"></c:out></td>

							<td><c:out value="${order.address.addressid}"></c:out></td>

							<td><c:out value="${order.ordertime}"></c:out></td>

							<%-- <td>
							<c:if test="${!empty order.orderItems }">
								<c:forEach var="orderItem" items="${order.orderItems }">
									<div><c:out value="${orderItem.product.pname}"></c:out>&nbsp;<c:out value="${orderItem.count}"></c:out></div>
								</c:forEach>
							</c:if>
						</td> --%>
						</tr>
					</c:forEach>
				</table>
			</c:if>

			<a href="<c:url value="/"/>"><button type="button"
					class="btn btn-info">Back to home</button></a>
		</div>

	</center>

	</div>
	<script>
		$(document).keydown(function(e) {
			switch (e.which) {
			case 52: // $ for checkout
				window.location.href = "<c:url value="/cart/checkout"/>";
				break;

			case 38: // up for home
				/* 				<a href="<c:url value='/order'/>">My Orders</a> */
				window.location.href = "<c:url value='/home'/>";
				break;

			case 53: // % for cart
				window.location.href = "<c:url value='/cart'/>";
				break;

			case 191: // ? for logout
				window.location.href = "<c:url value='/logout'/>";
				break;

			/* 			case 40: // down
			 $('#Search').click();
			 break; */

			/* 			case 38: // up
			 $('#ClearSearch').click();
			 break; */

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