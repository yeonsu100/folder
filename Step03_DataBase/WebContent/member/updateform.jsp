<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>/member/updateform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<%
	// 1. 파라미터로 전달되는 수정할 회원의 번호 읽어오기
	int num=Integer.parseInt(request.getParameter("num"));
	// 2. MemberDao 객체를 이용해서 수정할 회원의 정보 얻어오기
	MemberDao dao=MemberDao.getInstance();
	MemberDto dto=dao.getData(num);
%>
<div class="container">
	<h2>Update information form</h2>
	
	<form action="update.jsp" method="post">
		<div class="form-group">
			<label for="num">Number</label>
			<input class="form-control" type="text" id="num" value="<%=num%>" disabled/>
			<!-- disabled된 input 요소는 form 전송했을 때 전송이 되지 않는다.
				따라서 번호도 같이 전송되게 하려면 input type="hidden"으로 만들어놓고
				form 전송했을 때 번호도 같이 전송되게 한다. -->
			<input type="hidden" name="num" value="<%=num%>" />
		</div>
		<div class="form-group">
			<label for="name">Name</label>
			<input class="form-control" type="text" name="name" id="name" value="<%=dto.getName() %>" />
		</div>
		<div class="form-group">
			<label for="addr">Address</label>
			<input class="form-control" type="text" name="addr" id="addr" value="<%=dto.getAddr() %>" />
		</div>
		<button class="btn btn-primary" type="submit">Submit</button>
		<button class="btn btn-warning" type="reset">Cancel</button>
	</form>
</div>
</body>
</html>