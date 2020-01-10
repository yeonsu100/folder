<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>/member/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />

</head>
<body>
<%
   	// MemberDao 객체의 참조값 얻어오기
   	MemberDao dao=MemberDao.getInstance();
   	// 회원목록 얻어오기
   	List<MemberDto> list=dao.getList();
%>
<!-- 네비게이션 바 include (경로 : WebContent/include/navbar.jsp) 
	  만약 경로를 두 칸 올라가야 한다면 ../../include/navbar.jsp로 표현한다 -->
<%-- 피 include되는 jsp 페이지에 파라미터를 전달해줄 수 있다 --%>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="member" name="category"/>
</jsp:include>

<div class="container">
	<!-- 현재 페이지의 위치를 좀 더 자세히 알려주는 breadcrumb (빵 부스러기) - depth를 추가하여 알도록 할 수 있다 -->
	<ol class="breadcrumb">
		<li><a href="list.jsp">List</a></li>
	</ol>
	<h1>List of Member</h1>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>Number</th>
				<th>Name</th>
				<th>Address</th>
				<th>UPDATE</th>
				<th>DELETE</th>
			</tr>
		</thead>
		<tbody>
		<%for(MemberDto tmp: list){ %>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getName() %></td>
				<td><%=tmp.getAddr() %></td>
				<td><a href="updateform.jsp?num=<%=tmp.getNum() %>">
					<!-- 스크린 리더기를 위한 기능 text 제공하기 -->
					<span class="glyphicon glyphicon-edit" class="sr-only">Update</a></td>
				<td><a href="delete.jsp?num=<%=tmp.getNum() %>"><span class="glyphicon glyphicon-trash"></a></td>
			</tr>
		<%} %>
		</tbody>
	</table>
	<h3><a href="insertform.jsp">Add a member</a></h3>
</div>

<%-- /include/footer.jsp --%>
<jsp:include page="../include/footer.jsp"></jsp:include>

</body>
</html>