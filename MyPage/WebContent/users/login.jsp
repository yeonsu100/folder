<%@page import="java.net.URLEncoder"%>
<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	String url=request.getParameter("url");
	if(url==null){
		url=request.getContextPath()+"/main.jsp";
	}
	String encodedUrl=URLEncoder.encode(url);

	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");

	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	boolean isValid=UsersDao.getInstance().isValid(dto);
	if(isValid){
		session.setAttribute("id", id);
	}
	
	String isSave=request.getParameter("isSave");
	Cookie idCook=new Cookie("savedId", id);
	Cookie pwdCook=new Cookie("savedPwd", pwd);
	if(isSave!=null){		
		idCook.setMaxAge(60*60*24);	
		pwdCook.setMaxAge(60);
	}else{
		idCook.setMaxAge(0);
		pwdCook.setMaxAge(0);
	}
	response.addCookie(idCook);
	response.addCookie(pwdCook);
	
	request.setAttribute("isValid", isValid);
	request.setAttribute("id", id);
	request.setAttribute("url", url);
	request.setAttribute("encodedUrl", encodedUrl);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
<style>
	strong{color:skyblue;}
</style>
</head>
<body>
<div class="container">
	<c:choose>
		<c:when test="${isValid }">
			<p>
				Successfully signed in! </br>
				ID : <strong>${id }</strong> </br>
				<a href="${pageContext.request.contextPath }/main.jsp">Back to the INDEX page</a>
			</p>
		</c:when>
		<c:otherwise>
			<p>
				Please confirm your ID or Password
				<a href="loginform.jsp?url=${encodedUrl }">Back to the SIGN IN page</a>
			</p>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>
