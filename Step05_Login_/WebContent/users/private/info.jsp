<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 1. 세션에서 로그인된 아이디의 정보를 얻어온다.
	String id=(String)session.getAttribute("id");

	// 2. DB에서 해당 아이디의 정보를 얻어온다.
	UsersDto dto=UsersDao.getInstance().getData(id);
	// 3. 개인 정보를 응답해준다.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/info.jsp</title>	<!-- 유저의 가입한 정보 출력 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</head>
<body>

<div class="container">
	<h1>Member Information Page</h1>
	<table>
		<tr>
			<th>ID</th>
			<td><%=dto.getId() %></td>
		</tr>
		<tr>
			<th>Password</th>
			<td><a href="pwd_updateform.jsp">Revise</a></td>
		</tr>
		<tr>
			<th>E-mail</th>
			<td><%=dto.getEmail() %></td>
		</tr>
		<tr>
			<th>Joined Date</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
	</table>
	<a href="updateform.jsp">Revise info</a>
	<a href="javascript:deleteConfirm()">Remove Account</a>
</div>

<script>
	function deleteConfirm(){
		var isDelete=confirm("<%=id%>, Are you sure delete this account?");
		if(isDelete){
			location.href="delete.jsp";
		}
	}
</script>

</body>
</html>