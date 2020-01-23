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
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<style>
	h1{color : #6799FF;}
	h4{color : #3162C7;}
	h3{color : #FF9090;}
	thead{background-color:#B2CCFF;}
</style>
</head>

<body>
<%
	ProductDao dao=ProductDao.getInstance();
	List<ProductDto> list=dao.getList();
%>
<jsp:include page="../include/navbar.jsp"></jsp:include>

<div class="container">
	</br><ol class="breadcrumb">
		<li><a href="list.jsp">Show all Goods (List)</a></li>
	</ol>

<div class="container">
	<h1>Product List</h1>
	<table class="table table-striped table-hover">
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
	<button><a href="insertform.jsp">Add a product</a></button></br></br>
</div>

</div>

<jsp:include page="../include/ysfooter.jsp"></jsp:include>

</body>
</html>