<%@page import="test.product.dto.ProductDto"%>
<%@page import="test.product.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	int code=Integer.parseInt(request.getParameter("code"));
	String pdt=request.getParameter("pdt");
	ProductDto dto=new ProductDto();
	dto.setCode(code);
	dto.setPdt(pdt);
	ProductDao dao=ProductDao.getInstance();
	dao.insert(dto);
	boolean isSuccess=dao.insert(dto);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/yscustom.css" />
</head>

<body>
	<div class="container">
	<%if(isSuccess){ %>
	<script>
		alert("Product was successfully inserted.");
		location.href="${pageContext.request.contextPath }/shoppingmall/list.jsp";
	</script>
	<%}else{ %>
		<p class="alert alert-danger">Failure to Insert.</p>
		<a href="insertform.jsp">Please try it again.</a>
	<%} %>
	</div>
	
</body>
</html>