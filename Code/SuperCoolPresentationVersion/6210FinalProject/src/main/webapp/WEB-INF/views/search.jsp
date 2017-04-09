<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>management center</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet" />

<!-- 引入 Bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" />
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 包含 bootstrap 样式表 -->
<link rel="stylesheet"
	href="https://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css" />
</head>
<body>
	<audio autoplay>
		<source src="<c:url value="/resources/audio/home.m4a" />"
			type="audio/mp3" style="display: none" hidden="true">
	</audio>

	<div class="container">
		<div class="container-fluid bg-2 text-center">
			<h1>Welcome to Shopping without Vision</h1>

			<h6>&nbsp;</h6>
			<form method="get" action="<c:url value="/search"/>" target="_parent"
				class="form-inline">
				<input id="input" type="text" name="desc" class="form-control"
					size="50" /> &nbsp;&nbsp; <input type="submit" name="button"
					value="Search" id="Search" class="btn btn-primary" class="button" />
				<input type="submit" name="button" class="btn btn-primary"
					value="ClearSearch" id="ClearSearch" class="button" />
			</form>
			<div class="pull-right">
				<a href="<c:url value='/userInfo'/>">
					<h6>User Info</h6>
				</a>
			</div>
			<h6>&nbsp;</h6>

		</div>

		<center>
			<h1>Here is the search result:</h1>
		</center>
		<sec:authorize access="hasAuthority('admin')">
			<a href="<c:url value='/product/add'/>">Add Product</a>
		</sec:authorize>
		<center>
			<div class="table-responsive" style="width: 500px">
				<table class="table table-striped table-bordered">
					<!-- <thead>
					<tr>
						<td>Product ID</td>
						<td>Product Name</td>
						<td>Product Price</td>
						<td>Product Description</td>
						<td>Date</td>
					</tr>
				</thead> -->
					<tbody>

						<c:forEach items="${plist}" var="plist">
							<tr>
								<td>Product ID</td>
								<td>${plist.pid}</td>
							</tr>
							<tr>
								<td>Name</td>
								<td><a
									href="<c:url value='/product/${plist.pid}/viewProduct'/>">${plist.pname}</a></td>
							</tr>

							<tr>
								<td>Product Price</td>
								<td>${plist.price}</td>
							</tr>

							<tr>
								<td>Description</td>
								<td>${plist.pdesc}</td>
							</tr>

							<tr>
								<td>Date</td>
								<td>${plist.pdate}</td>
							</tr>

							<%-- <tr>
								<td>Smell</td>
								<td>Smell Type: ${plist.smell.smellName};<br/>
									Currency Range: ${plist.smell.currencyRange} mA;<br/>
									Currency Frequency: ${plist.smell.currencyFrequence} mA
								</td>
								
							</tr> --%>
							<sec:authorize access="hasAuthority('admin')">
								<td><a href="<c:url value='/product/${plist.pid}/edit'/>">Edit</a></td>
								<td><a href="<c:url value='/product/${plist.pid}/delete'/>">Delete</a></td>
							</sec:authorize>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</center>
	</div>
	<!-- Page start -->
	<div align="center">
		<a href="<c:url value='search/myProductPage?pageNow=1'/>"></a>
		<c:choose>
			<c:when test="${page.pageNow - 1 > 0}">
				<a
					href="<c:url value='search/myProductPage?pageNow=${page.pageNow - 1}'/>"
					class="PrevPage"></a>
			</c:when>
			<c:when test="${page.pageNow - 1 <= 0}">
				<a href="<c:url value='search/myProductPage?pageNow=1'/>"
					class="PrevPage"></a>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${page.totalPageCount==0}">
				<a
					href="<c:url value='search/myProductPage?pageNow=${page.pageNow}'/>"
					class="NextPage"></a>
			</c:when>
			<c:when test="${page.pageNow + 1 < page.totalPageCount}">
				<a
					href="<c:url value='search/myProductPage?pageNow=${page.pageNow + 1}'/>"
					class="NextPage"></a>
			</c:when>
			<c:when test="${page.pageNow + 1 >= page.totalPageCount}">
				<a
					href="<c:url value='search/myProductPage?pageNow=${page.totalPageCount}'/>"
					class="NextPage"></a>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${page.totalPageCount==0}">
				<a
					href="<c:url value='search/myProductPage?pageNow=${page.pageNow}'/>"></a>
			</c:when>
			<c:otherwise>
				<a
					href="<c:url value='search/myProductPage?pageNow=${page.totalPageCount}'/>"></a>
			</c:otherwise>
		</c:choose>
		<font size="2"><< &nbsp; <- &nbsp; -> &nbsp; >> &nbsp; <mark>${page.pageNow}/${page.totalPageCount}</mark></font>
	</div>
	<!-- Page End -->
	<script>
		$(document).keydown(function(e) {
			switch (e.which) {
			case 52: // $ for checkout
				window.location.href = "<c:url value="/cart/checkout"/>";
				break;

			case 50: // @ for orders
				/* 				<a href="<c:url value='/order'/>">My Orders</a> */

				window.location.href = "<c:url value='/order'/>";
				break;

			case 40: // down
				$('#Search').click();
				break;

			case 38: // up
				$('#ClearSearch').click();
				/* 				window.location.href = "<c:url value='/home'/>"; */
				break;
			/* 
			 case 192: //` for home
			 window.location.href = "<c:url value='/home'/>";
			 break; */

			case 191: // ? for logout
				window.location.href = "<c:url value='/logout'/>";
				break;

			case 53: //% for cart
				window.location.href = "<c:url value='/cart'/>";
				break;

			case 39: // right
				$('a.NextPage').trigger('click');
				/* $('#NextPage').click(); */
				break;

			case 37: // left
				$('a.PrevPage').trigger('click');
				break;

			case 187: // + for add product to cart
				$('a.Plus').trigger('click');
				/* $('#NextPage').click(); */
				break;

			default:
				return;
			}
			e.preventDefault();
		});
		$('a.NextPage').click(function(e) {
			e.preventDefault();
			window.location.href = $(this).attr("href");
			return false;
		});
		$('a.PrevPage').click(function(e) {
			e.preventDefault();
			window.location.href = $(this).attr("href");
			/* 			$.get($(this).attr("href")); */
			/* 			$("#theContent").load($(this).attr("href")); */
			return false;
		});
		$('a.Plus').click(function(e) {
			e.preventDefault();
			window.location.href = $(this).attr("href");
			return false;
		});
	</script>
</body>
</html>

