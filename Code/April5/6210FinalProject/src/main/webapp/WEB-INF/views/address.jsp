<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form:form method="post" action="/coe/address/addAddress"
				commandName="address">
				<h3>Add</h3>
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
				<div class="button">
					<input type="submit" value="Submit Change" class="categoryedit" />
				</div>
			</form:form>
			
	<%-- <form method="post" action="/coe/address/addAddress">

		Address: <input type="text" name="address" /> State: <input
			type="text" name="state" /> Country:<input type="text"
			name="country" /> ZipCode: <input type="text" name="zipCode" />
		Receiver: <input type="text" name="receiver" /> <input type="submit"
			value="Add Address" class="button" />

	</form> --%>

	<a href="">Update</a>
	<a href="">Delete</a>
	<a href="<c:url value='/addresses'/>">All addresses</a>

</body>
</html>