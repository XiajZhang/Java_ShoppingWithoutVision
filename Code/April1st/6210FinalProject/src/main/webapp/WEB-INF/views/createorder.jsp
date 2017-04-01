<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper">
		<h1>Create order</h1>
		<div class="content">
			<form method="post" action="/coe/createorder">
				<div id="form_wrapper" class="form_wrapper">
					
					<div>
						<label>Total:</label> <input type="text" name="total" />
						<span class="error">This is an error</span>
					</div>
					<div class="bottom">
						<input type="submit" value="Create" class="button" /> <input
							type="hidden" name="act" value="signin" />
					</div>
				</div>
			</form>
		</div>
		</div>
</body>
</html>