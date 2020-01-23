<%@page import="test.product.dao.ProductDao"%>
<%@page import="test.product.dto.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Form</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/yscustom.css" />
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="member" name="category"/>
</jsp:include>
<div class="container">
<h1>Insert product page</h1>
	<form action="insert.jsp" method="post">
		<input type="text" name="code" placeholder="Product Code (ex:000000)" />
		<input type="text" name="pdt" placeholder="Write down on product..." />
		<button class="btn btn-primary" type="submit">INSERT</button>
		<button class="btn btn-default" type="reset">RESET</button>
	</form>
</div>
</body>
</html>