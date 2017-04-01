<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/adminhome.js"></script>
<title>Admin page</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<c:url value="/resources/css/adminhome.css" />"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="wrapper">
		<h1>Admin manage page</h1>

		<%-- <div class="container index">

			<div class="span24-right">

				<div class="title">
					<strong class="nav active" index="0">All products</strong>
				</div>

				<ul id="product_list" class="tabContent carousel-content active">

					<li><a
						href="${pageContext.request.contextPath }/findByPid/<c:out value="${pList['9'].pid}"/>"
						target="_blank"> <img
							src="${pageContext.request.contextPath}/<c:out value="${pList['9'].image }"/>"
							style="display: block;" alt="${pList['9'].pname}" />
					</a>
						<div class="product-alt">${pList['9'].pname}</div></li>
					<c:forEach var="p" items="${pList}">
						<li><a
							href="${pageContext.request.contextPath }/findByPid/<c:out value="${p.pid}"/>"
							target="_blank"> <img
								src="${pageContext.request.contextPath}/<c:out value="${p.image }"/>"
								style="display: block;" alt="${p.pname}" />
						</a>
							<div class="product-alt">${p.pname}</div></li>
					</c:forEach>
					<li><a
						href="${pageContext.request.contextPath }/findByPid/<c:out value="${pList['0'].pid}"/>"
						target="_blank"> <img
							src="${pageContext.request.contextPath}/<c:out value="${pList['0'].image }"/>"
							style="display: block;" alt="${pList['0'].pname}" />
					</a>
						<div class="product-alt">${pList['0'].pname}</div></li>
					<li><a
						href="${pageContext.request.contextPath }/findByPid/<c:out value="${pList['1'].pid}"/>"
						target="_blank"> <img
							src="${pageContext.request.contextPath}/<c:out value="${pList['1'].image }"/>"
							style="display: block;" alt="${pList['1'].pname}" />
					</a>
						<div class="product-alt">${pList['1'].pname}</div></li>
					<li><a
						href="${pageContext.request.contextPath }/findByPid/<c:out value="${pList['2'].pid}"/>"
						target="_blank"> <img
							src="${pageContext.request.contextPath}/<c:out value="${pList['2'].image }"/>"
							style="display: block;" alt="${pList['2'].pname}" />
					</a>
						<div class="product-alt">${pList['2'].pname}</div></li>
				</ul>
			</div>
		</div> --%>

		<div class="adminfunction"
			style="margin-left: auto; margin-right: auto; margin-top: 10px;">

			<div class="content">
				<form method="post" action="/coe/..." target="_parent">
					<div>
						<input type="text" name="product" /> <input type="submit"
							value="Search" class="button" />

					</div>
				</form>
			</div>

			<div class="bottom">
				<a href="<c:url value='/'/>">Add product</a>
			</div>

			<div class="bottom">
				<a href="<c:url value='/listAll'/>">Show users</a>
			</div>
		</div>



		<div class="category" style = "margin-top:10px;">

			<ul id="nav">
				<li><a class="selected" href="/">Category1</a>
					<ul>
						<li><a href="#">Category1_1</a></li>
						<li><a href="#">Category1_2</a></li>
						<li><a href="#">Category1_3</a></li>
					</ul></li>



				<li><a class="selected" href="/">Category2</a>
					<ul>
						<li><a href="#">Category2_1</a></li>
						<li><a href="#">Category2_2</a></li>
						<li><a href="#">Category2_3</a></li>
						<li><a href="#">Category2_4</a></li>
					</ul></li>

			</ul>
		</div>


		<%-- <div class="container productList">
			<div class="span6">
				<div class="productCategory">
					<c:forEach var="c" items="${sessionScope.cList }">
						<dl>
							<dt>
								<a
									href="${pageContext.request.contextPath }/findByCid/<c:out value="${c.cid}"/>/1"><c:out
										value="${c.cname}" /></a>
							</dt>
							<c:forEach var="cs" items="${c.categorySeconds}">
								<dd>
									<a
										href="${ pageContext.request.contextPath }/findByCsid/<c:out value="${cs.csid}/1"/>"><c:out
											value="${cs.csname}" /></a>
								</dd>
							</c:forEach>
						</dl>
					</c:forEach>
				</div>
			</div>
			<div class="span18 last">
				<form id="productForm"
					action="${pageContext.request.contextPath}/image/..." method="get">
					<div id="result" class="result table clearfix">
						<ul>
							<c:forEach var="p" items="${products}">
								<li><a
									href="${ pageContext.request.contextPath }/findByPid/<c:out value="${p.pid}"/>">
										<img
										src="${pageContext.request.contextPath}/<c:out value="${p.image}"/>"
										width="170" height="170" style="display: inline-block;" /> <span
										style='color: green'> <c:out value="${p.pname}" />
									</span> <span class="price"> sale price： ￥<c:out
												value="${p.shop_price}" />
									</span>
								</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="pagination">
						<!-- first category -->
						<c:if test="${cid != null }">
							<span>the <c:out value="${page}" />/<c:out
									value="${count}" />page
							</span>
							<!-- index -->
							<span><a class="firstPage"
								href="${pageContext.request.contextPath}/findByCid/${cid}/1"></a></span>
							<c:if test="${page != 1}">
								<span><a class="previousPage"
									href="${pageContext.request.contextPath}/findByCid/${cid}/<c:out value="${page-1}"/>"></a></span>
							</c:if>
							<c:forEach var="i" begin="1" end="${count }">
								<span> <!-- can not click on if it is the current page -->
									<c:if test="${i == page }">
										<span class="currentPage">${page }</span>
									</c:if> <c:if test="${i != page }">
										<a
											href="${pageContext.request.contextPath}/findByCid/${cid}/<c:out value="${i}"/>">
											<c:out value="${i}" />
										</a>
									</c:if>
								</span>
							</c:forEach>
							<!-- next page -->
							<c:if test="${page !=count }">
								<span><a class="nextPage"
									href="${pageContext.request.contextPath}/findByCid/${cid}/<c:out value="${page+1}"/>"></a></span>
							</c:if>
							<!-- last page -->
							<a class="lastPage"
								href="${pageContext.request.contextPath}/findByCid/${cid}/<c:out value="${count}"/>"></a>
						</c:if>
						<!-- second category -->
						<c:if test="${csid != null }">
							<span>the <c:out value="${page}" />/<c:out
									value="${count}" />page
							</span>
							<!-- first page -->
							<span><a class="firstPage"
								href="${pageContext.request.contextPath}/findByCsid/${csid}/1"></a></span>
							<c:if test="${page != 1}">
								<span><a class="previousPage"
									href="${pageContext.request.contextPath}/findByCsid/${csid}/<c:out value="${page-1}"/>"></a></span>
							</c:if>
							<c:forEach var="i" begin="1" end="${count }">
								<span> <!-- can not click on if it is the current page -->
									<c:if test="${i == page }">
										<span class="currentPage">${page }</span>
									</c:if> <c:if test="${i != page }">
										<a
											href="${pageContext.request.contextPath}/findByCsid/${csid}/<c:out value="${i}"/>">
											<c:out value="${i}" />
										</a>
									</c:if>
								</span>
							</c:forEach>
							<!-- next page -->
							<c:if test="${page !=count }">
								<span><a class="nextPage"
									href="${pageContext.request.contextPath}/findByCsid/${csid}/<c:out value="${page+1}"/>"></a></span>
							</c:if>
							<!-- last page -->
							<a class="lastPage"
								href="${pageContext.request.contextPath}/findByCsid/${csid}/<c:out value="${count}"/>"></a>
						</c:if>
					</div>
				</form>
			</div>
		</div> --%>
	</div>
</body>
</html>