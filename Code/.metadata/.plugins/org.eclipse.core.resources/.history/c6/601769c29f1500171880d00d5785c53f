<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Admin page</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
	<div class="wrapper">
		<h1>Admin manage page</h1>

		<div class="bottom">
			<form method="post" action="/coe/addproduct">
				<input type="submit" value="Add product" class="button" /> <input
					type="hidden" name="act" value="signin" />
			</form>
		</div>

		<div class="bottom">
			<form method="post" action="/coe/deleteproduct">
				<input type="submit" value="Delete product" class="button" /> <input
					type="hidden" name="act" value="signin" />
			</form>
		</div>
		
		<div class="bottom">
			<form method="post" action="/coe/getusers">
				<input type="submit" value="Show users" class="button" /> <input
					type="hidden" name="act" value="signin" />
			</form>
		</div>

		<div class="content">
			<div id="form_wrapper" class="form_wrapper">
				<div>
					<input type="text" name="product" /> <input type="submit"
						value="Search" class="button" />
				</div>
			</div>
		</div>
	</div>



</body>
</html>