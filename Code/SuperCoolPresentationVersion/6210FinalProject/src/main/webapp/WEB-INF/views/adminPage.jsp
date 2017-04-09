<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>management center</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"/>
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
<div class="container text-center">
  <h1>Welcome to Shopping without Vision</h1>
  <h3>Hello! ${currentUser.username}!</h3>
  <div class="row text-center">
    <div class="col-sm-6">
      <div class="thumbnail">
       <img src="<c:url value="/resources/image/users.jpg" />">
        <p><strong><a href="<c:url value='/listAll'/>">
        <button type="button"
			class="btn btn-info">Manage Users</button></a></strong></p>
      </div>
    </div>
    <div class="col-sm-6">
      <div class="thumbnail">
       <img src="<c:url value="/resources/image/products.jpg" />">
        <p><strong><a href="<c:url value='/product'/>"><button type="button"
			class="btn btn-info">Manage Products</button></a></strong></p>
      </div>
    </div>
    <div class="clear"></div>
    <a href="<c:url value='/logout'/>">Log Out</a>
</div>
</body>
</html>