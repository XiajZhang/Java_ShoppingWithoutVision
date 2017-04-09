<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New Address</title>
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
<div class="container">
  <h2>Add New Address</h2>
 <form:form method="post" action="/coe/address/addAddress" commandName="address" class="form-horizontal">
	<div class="form-group">
      <label class="control-label col-sm-2" for="address">Address:</label>
	   <div class="col-sm-10">
	   <form:input type="text" class="form-control" id="address" path="address" placeholder="new address"/>
		 </div>
        </div>
        	<div class="form-group">
      <label class="control-label col-sm-2" for="state">State:</label>
	   <div class="col-sm-10">
	   	   <form:input type="text" class="form-control" id="state" path="state" placeholder="new state"/>
		 </div>
        </div>
        	<div class="form-group">
      <label class="control-label col-sm-2" for="country">Country:</label>
	   <div class="col-sm-10">
	   	   <form:input type="text" class="form-control" id="country" path="country" placeholder="new country"/>
		 </div>
        </div>
        	<div class="form-group">
      <label class="control-label col-sm-2" for="zip code">Zip Code:</label>
	   <div class="col-sm-10">
	   	   <form:input type="text" class="form-control" id="zipCode" path="zipCode" placeholder="zip code"/>
		 </div>
        </div>
        	<div class="form-group">
      <label class="control-label col-sm-2" for="receiver">Receiver:</label>
	   <div class="col-sm-10">
	   	   <form:input type="text" class="form-control" id="receiver" path="receiver" placeholder="new receiver"/>
		 </div>
        </div>
         <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-info">Submit</button> 
      </div>
    </div>
   </form:form>
</div>

</body>
</html>