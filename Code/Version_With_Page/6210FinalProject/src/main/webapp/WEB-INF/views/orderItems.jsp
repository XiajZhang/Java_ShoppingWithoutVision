<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>management center</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<link href="<c:url value="/resources/css/style.css" />"
		rel="stylesheet" />
	<!-- 引入 Bootstrap -->
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<link rel="stylesheet"
			href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"/>
			<script
				src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
			<script
				src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
			<!-- 包含 bootstrap 样式表 -->
			<link rel="stylesheet"
				href="https://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css"/>
</head>
<body>
	<div class="wrapper">
		<h1>Welcome to Shopping without Vision Admin Page</h1>
		<center>
			<div class="table-responsive">
				<c:if test="${!empty orderItems}">
			<table class="table table-striped table-bordered">
						<tr>
							<td>Order ID</td>
							<td>Subtotal</td>
							<td>pid</td>
							<td>quantity</td>
						</tr>

						<c:forEach var="orderItem" items="${orderItems}"
							varStatus="status">
							<tr>

								<td><c:out value="${orderItem.order.oid}"></c:out></td>

								<td><c:out value="${orderItem.subtotal}"></c:out></td>

								<td><c:out value="${orderItem.product.pid}"></c:out></td>

								<td><c:out value="${orderItem.counts}"></c:out></td>

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
			</div>
			<a href="<c:url value="/"/>"><button type="button"
			class="btn btn-info">Back to home</button></a>
		</center>

	</div>
</body>
</html>