<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引入 Bootstrap -->
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
  <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <!-- 包含 bootstrap 样式表 -->
    <link rel="stylesheet" href="https://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
<title>Product page</title>
</head>
<body>
<form method="post" action="/coe/product/addProduct">

					Product name: <input type="text" name="pname" /> 
					Price: <input type="text" name="price" /> 
					Image:<input type="text" name="image" />
					Pdesc: <input type="text" name="pdesc" />
					is_hot: <input type="text" name="is_hot" />
					data: <input type="DATE" name="pdate" />			
				<input type="submit" value="Add Product" class="button" /> 
				
			</form>
			
	<a href="">Update</a>
	<a href="">Delete</a>
	<a href="showlist.htm">Show List</a>
			
			
</body>
</html>