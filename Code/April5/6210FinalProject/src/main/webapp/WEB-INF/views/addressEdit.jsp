<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Editing Address</title>
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet" />
</head>
<body>
	<div class="addressEdit">
		<h2>Edit Address</h2>
		<div class="content">
			<form:form method="post" action="/coe/address/updated"
				commandName="address">
				<h3>Edit</h3>
				<div>
					<form:label path="address">Input new address:</form:label>
					<form:input type="text" name="address" path="address" />
					<form:input type="hidden" name="addressid" path="addressid" />
				</div>
				<div>
					<form:label path="state">Input new state:</form:label>
					<form:input type="text" name="state" path="state" />
					<form:input type="hidden" name="addressid" path="addressid" />
				</div>
				<div>
					<form:label path="country">Input new country:</form:label>
					<form:input type="text" name="country" path="country" />
					<form:input type="hidden" name="addressid" path="addressid" />
				</div>
				<div>
					<form:label path="zipCode">Input new Zip Code:</form:label>
					<form:input type="text" name="zipCode" path="zipCode" />
					<form:input type="hidden" name="addressid" path="addressid" />
				</div>
				<div>
					<form:label path="receiver">Input new receiver:</form:label>
					<form:input type="text" name="receiver" path="receiver" />
					<form:input type="hidden" name="addressid" path="addressid" />
				</div>
				<div class="button">
					<input type="submit" value="Submit Change" class="categoryedit" />
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>