<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form method="POST" action="/coe/address/updated"
		commandName="address">
		<form:input type="hidden" name="addressid" path="addressid" />
		<form:input path="user.uid" name="uid" type="hidden"/>
		<div>
			<form:label path="address">Input new address:</form:label>
			<form:input type="text" name="address" path="address" />
		</div>
		<div>
			<form:label path="state">Input new state:</form:label>
			<form:input type="text" name="state" path="state" />
		</div>
		<div>
			<form:label path="country">Input new country:</form:label>
			<form:input type="text" name="country" path="country" />
		</div>
		<div>
			<form:label path="zipCode">Input new Zip Code:</form:label>
			<form:input type="text" name="zipCode" path="zipCode" />
		</div>
		<div>
			<form:label path="receiver">Input new receiver:</form:label>
			<form:input type="text" name="receiver" path="receiver" />
		</div>
		<input type="submit" value="update" class="button">
	</form:form>
</body>
</html>