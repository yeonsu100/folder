<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>/member/update.jsp</title>
</head>
<body>
<%
	// 0. 폼 전송되는 한글 깨지지 않도록  인코딩
	request.setCharacterEncoding("utf-8");
	// 1. 파라미터로 전달되는 (폼 전송되는) 수정할 회원의 정보를 읽어온다. 
	int num=Integer.parseInt(request.getParameter("num"));
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	// 2. MemberDao 객체를 이용해서 DB에 수정된 내용을 반영한다.
	MemberDto dto=new MemberDto(num, name, addr);
	boolean isSuccess=MemberDao.getInstance().update(dto);
	// 3. 수정할 회원의 정보를 form에 잘 출력해서 응답한다.
	
%>
<%if(isSuccess){ %>
	<script>
		// 알림창 띄우기
		alert("No.<%=num %> was updated successfully.");
		location.href="list.jsp";
	</script>
<%}else{ %>
	<script>
		alert("Failure to update.");
		location.href="list.jsp";
	</script>
<%} %>

</body>
</html>