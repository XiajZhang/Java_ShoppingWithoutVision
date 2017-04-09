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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"/>
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
<div class="wrapper">		
  	<h2>Here is the search result:</h2>
  <a href="<c:url value='/address/add'/>">
  <button type="button" class="btn btn-info">Add Address</button></a>
	<div class="table-responsive">
	    <c:if test="${!empty addresslist}"> 
		<table class="table table-striped table-bordered">
    <thead>
      <tr>
        <td>Address ID</td>
				<td>Address</td>
				<td>State</td>
				<td>Country</td>
				<td>Zip Code</td>
				<td>Receiver</td>
				<td>Edit</td>
				<td>Delete</td>
      </tr>
    </thead>

    <tbody>
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
            </tbody>

       </table>
     </c:if>
</div>
</div>
</body>
</html>