<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 1. ajax 요청과함께 inputId라는 파라미터명으로 전달된 문자열 읽어오기
	String inputId=request.getParameter("inputId");
	// 2. DB에 이미 존재하는 아이디인지 확인한다.
	boolean isExist=UsersDao.getInstance().isExist(inputId);
	// 3. 존재하는지 여부를 json 형식의 문자열로 응답한다. 
	// (그래야 클라이언트에서 자바스크립트 형식으로 확인하기 편하니까)
%>

{"isExist": <%=isExist%>}