<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// context 경로 얻어오기 ( getContextPath(); ) 
	// 이 프로젝트의 context 경로 : "/Step04_JspBasic"
	String cPath=request.getContextPath();
	// 강제로 리다이렉트 시키기
	// 리다이렉트 이동 시킬 때에는 절대경로로 이동하는 것이 일반적이다.
	// 따라서 context 경로가 반드시 필요하다.
	response.sendRedirect(cPath+"/test1/study.jsp");
	//					 ▲ (/Step04_JspBasic/test1/study.jsp)
%>    
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test1/game.jsp</title>
</head>
<body>
<p>This is a <strong>GAME</strong> page. Let's play the game!! lol</p>
</body>
</html>