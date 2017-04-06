<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.DataInputStream"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Result</title>
</head>
<body>

	<h1>Here is the search result:</h1>
	<a href="<c:url value='/address/add'/>">Add Address</a>

	<c:if test="${!empty addresslist}">
		<table border="1">
			<tr>
				<td>Address ID</td>
				<td>Address</td>
				<td>State</td>
				<td>Country</td>
				<td>Zip Code</td>
				<td>Receiver</td>
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
				</tr>
			</c:forEach>
		</table>
		</c:if>
</body>
</html>