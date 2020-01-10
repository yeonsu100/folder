<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
	// 1. 파라미터로 전달되는 삭제할 회원의 번호를 읽어와서
	int num=Integer.parseInt(request.getParameter("num"));
	
	// 2. MemberDao 객체를 이용해 DB에서 삭제한 다음
	MemberDao dao=MemberDao.getInstance();
	// 부울리언 함수로 작업의 성공여부를 확인
	boolean isSuccess=dao.delete(num);
	
	// 3. 응답한다.
	
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>/member/delete.jsp</title>
</head>
<body>
<%if(isSuccess){ %>
	<script>
		// 알림창 띄우기
		alert("No.<%=num %> was deleted successfully.");
		// javascript에서 페이지 이동하는 방법
		location.href="list.jsp";
	</script>
<%}else{ %>
	<script>
		// 알림창 띄우기
		alert("Failure to delete.");
		// javascript에서 페이지 이동하는 방법
		location.href="list.jsp";
	</script>
<%} %>

</body>
</html>