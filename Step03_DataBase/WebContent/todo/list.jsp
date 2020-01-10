<%@page import="test.todo.dto.ToDoDto"%>
<%@page import="test.todo.dao.ToDoDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/yscustom.css" />
<style>
	body{padding-top: 50px;}
	h1{color : pink;}
	th{
		background-color : skyblue;
		color : white; 
		}

</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>

</head>
<body>
<%
	// ToDoDao 객체의 참조값 얻어오기
	ToDoDao dao=ToDoDao.getInstance();
	// To Do List 얻어오기
	List<ToDoDto> list=dao.getList();
%>
<!-- 네비게이션 바 추가 -->
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">HOME</a>	<!-- 최상위 경로(index 페이지)로 올라오겠다는 의미 -->
		<ul class="nav navbar-nav">
			<li class="active"><a href="${pageContext.request.contextPath }/member/list.jsp">Member Page</a></li>
			<li class="active"><a href="${pageContext.request.contextPath }/todo/list.jsp">Schedule Page</a></li>
			<li class="active"><a href="${pageContext.request.contextPath }/board/list.jsp">Bulletin board</a></li>
			<li class="active"><a href="${pageContext.request.contextPath }/shoppingmall/list.jsp">Product Page</a></li>
			<li><a href="https://www.youtube.com">YouTube</a></li>
			<li><a href="https://www.instagram.com/yunstagram_100/">Yunstagram</a></li>
		</ul>
	</div>
</div>

<div class="container">
	<h1>Winnie's To Do List</h1>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>No.</th>
				<th>Content</th>
				<th>Date</th>
				<th>Update this assignment</th>
				<th>Delete this assignment</th>
			</tr>
		</thead>
		<tbody>
		<%for(ToDoDto tmp: list){ %>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getContent() %></td>
				<td><%=tmp.getRegdate() %></td>
				<td><a href="updateform.jsp?num=<%=tmp.getNum() %>"><span class="glyphicon glyphicon-edit"></span></a></td>
				<td><a href="javascript:deleteConfirm(<%=tmp.getNum()%>);"><span class="glyphicon glyphicon-trash"></a></td> 
						<!-- ▲ 삭제 버튼을 눌렀을 때 정말 삭제할 것인지 확인하는 알림창 띄우기 -->
			</tr>
		<%} %>	
		</tbody>
	</table>
	<!-- 상대경로 (비추) -->
	<!-- 	<h3><a href="insertform.jsp">Add a to do list...</a></h3> 	-->	
	<!-- 절대경로 (추천) -->	
	<button class="btn btn-default"><a href="${pageContext.request.contextPath }/todo/insertform.jsp">Add an assignment...</a></button>
</div>
<script>
	function deleteConfirm(num){
		var isDelete=confirm("Are you sure you really want a delete No."+num+" ?");
		if(isDelete){
			location.href="delete.jsp?num="+num;
		}
	}
</script>

<jsp:include page="../include/ysfooter.jsp"></jsp:include>

</body>
</html>