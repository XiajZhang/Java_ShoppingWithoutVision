<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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