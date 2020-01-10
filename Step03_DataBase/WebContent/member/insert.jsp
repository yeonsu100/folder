<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 0. 한글 인코딩 설정...(하지만 난 이 과정이 필요 없지...) <- post 방식 전송했을 때 한글 깨지지 않도록 이 작업 필수!!
	request.setCharacterEncoding("utf-8");
	// 1. 폼 전송되는 파라미터 추출 (이름과 주소 추출)하여
	String name=request.getParameter("name");	// insertform에서 input요소의 네임 속성의 밸류값과 일치해야 한다
	String addr=request.getParameter("addr");
	// MemberDto에 담고
	MemberDto dto=new MemberDto(0, name, addr);
	// 2. MemberDao객체를 이용해서 DB에 저장한 다음
	MemberDao dao=MemberDao.getInstance();
	dao.insert(dto);
	
	// (작업의 성공여부를 알고싶으면 부울리언을 이용해 응답을 나타냄)
	boolean isSuccess=dao.insert(dto);
	
	// 3. 응답한다

%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>/member/insert.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	body{
		padding-top: 50px;
		}
	.container{
		padding-top: 100px;
		}
</style>

</head>
<body>
<div class="container">
	<%if(isSuccess){ %>
		<p class="alert alert-success">Information of Member was Inserted.</p>
		<a href="list.jsp">Show a member list</a>
	<%}else{ %>
		<p class="alert alert-danger">Failure to Insert.</p>
		<a href="insertform.jsp">Try it again</a>
	<%} %>
</div>
</body>
</html>