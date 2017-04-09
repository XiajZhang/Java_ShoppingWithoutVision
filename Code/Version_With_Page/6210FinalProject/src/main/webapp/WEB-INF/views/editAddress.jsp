<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Address</title>
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
 <form:form method="POST" action="/coe/address/updated" commandName="address" class="form-horizontal">
		<form:input type="hidden" name="addressid" path="addressid" />
		<form:input path="user.uid" name="uid" type="hidden"/>
	<div class="form-group">
      <label class="control-label col-sm-2" for="address">Input new address:</label>
	   <div class="col-sm-10">
	   <form:input type="text" class="form-control" id="address" path="address" />
		 </div>
        </div>
        	<div class="form-group">
      <label class="control-label col-sm-2" for="state">Input new state:</label>
	   <div class="col-sm-10">
	   	   <form:input type="text" class="form-control" id="state" path="state" />
		 </div>
        </div>
        	<div class="form-group">
      <label class="control-label col-sm-2" for="country">Input new country:</label>
	   <div class="col-sm-10">
	   	   <form:input type="text" class="form-control" id="country" path="country" />
		 </div>
        </div>
        	<div class="form-group">
      <label class="control-label col-sm-2" for="zip code">Input new zip code:</label>
	   <div class="col-sm-10">
	   	   <form:input type="text" class="form-control" id="zipCode" path="zipCode" />
		 </div>
        </div>
        	<div class="form-group">
      <label class="control-label col-sm-2" for="receiver">Input new receiver:</label>
	   <div class="col-sm-10">
	   	   <form:input type="text" class="form-control" id="receiver" path="receiver" />
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