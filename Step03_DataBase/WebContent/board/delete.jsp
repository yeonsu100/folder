<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 한글 인코딩
	request.setCharacterEncoding("utf-8");
	// 폼 전송 파라미터로 전달되는 삭제할 글번호와 비밀번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	String pwd=request.getParameter("pwd");
	// 비밀번호가 일치하는지 확인
	String savedPwd=BoardDao.getInstance().getData(num).getPwd();
	// 작업의 성공여부를 담을 boolean type 지역변수 선언하고 초기값 부여
	boolean isSuccess=false;
	// 만일 DB에 저장된 비밀번호와 입력한 비밀번호가 같다면,
	if(savedPwd.equals(pwd)){
		// 삭제한다.
		isSuccess=BoardDao.getInstance().delete(num);
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />
</head>
<body>

<div class="container">
	<%if(isSuccess){ %>
		<p class="alert alert-success">No.<%=num %> article is deleted.</p>
		<a class="alert-link" href="list.jsp">Back to the List page</a>
	<%}else{ %>
		<p class="alert alert-danger">Failure to delete.</p>
		<a class="alert-link" href="detail.jsp?num=<%=num %>">Back to the Previous page</a>
	<%} %>
</div>

<marquee width="500" height="50" bgcolor="#FFC6C6" >Welcome to Winnie World!</marquee>
<jsp:include page="../include/ysfooter.jsp"></jsp:include>

</body>
</html>