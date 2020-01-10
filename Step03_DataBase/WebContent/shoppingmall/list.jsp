<%@page import="test.product.dto.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="test.product.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/yscustom.css" />
</head>

<body>
<%
	ProductDao dao=ProductDao.getInstance();
	List<ProductDto> list=dao.getList();
%>
<jsp:include page="../include/navbar.jsp"></jsp:include>

<div class="container">
	<h1>Product List</h1>
	<table class="table table-hover">
	<thead>
		<tr>
			<th>CODE</th>
			<th>PRODUCT NAME</th>
			<th>ENROLLED DATE</th>
			<th>UPDATE</th>
			<th>DELETE</th>
		</tr>
	</thead>
	<tbody>
	<%for(ProductDto tmp: list){ %>
		<tr>
			<td><%=tmp.getCode() %></td>
			<td><%=tmp.getPdt() %></td>
			<td><%=tmp.getRegdate() %></td>
			<td><a href="updateform.jsp?num=<%=tmp.getCode() %>">Update this information</a></td>
			<td><a href="delete.jsp?num=<%=tmp.getCode() %>">Delete this information<</a></td>
		</tr>
		<%} %>
	</tbody>
	</table>
	<button><a href="insertform.jsp">Add a product</a></button>
</div>

<jsp:include page="../include/ysfooter.jsp"></jsp:include>

</body>
</html>