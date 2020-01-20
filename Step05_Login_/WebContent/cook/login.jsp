<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 폼 전송된 파라미터 읽어오기
	String id=request.getParameter("id");
	// checkbox를 체크했는지 읽어오기 (체크하지 않았으면 null이다.)
	String isSave=request.getParameter("isSave");
	// 만약 널이 아니면 (체크박스에 체크했으면)
	if(isSave!=null){
		// 아이디를 쿠키로 저장하기
		Cookie cook=new Cookie("savedId", id);
		// 테스트이므로 60초만 유지되도록 한다.
		cook.setMaxAge(60);
		// 응답객체(HttpServletResponse)를 이용해서 쿠키도 같이 응답하기
		response.addCookie(cook);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cook/login.jsp</title>
</head>
<body>

<p>Signed in successfully! ID : <%=id %></p>
<a href="test2.jsp">Go back to Sign in page</a>

</body>
</html>