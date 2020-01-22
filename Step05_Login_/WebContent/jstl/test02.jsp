<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	// Model (data)
	List<String> names=new ArrayList<>();
	names.add("Lily");
	names.add("Peter");
	names.add("Mickey");
	names.add("Minnie");
	names.add("William");
	names.add("Bentley");
	names.add("Olaf");
	names.add("Pluto");
	names.add("Stitch");
	
	// request 영역에 담기 (request와 session에 담긴 데이터만 쓸 수 있다. (el에서 사용하려면))
	request.setAttribute("names", names);
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/jstl/test02.jsp</title>
</head>
<body>
<h3>JSTL - forEach</h3>
<h4>List of Friends</h4>
<ul>
	<c:forEach var="tmp" items="${requestScope.names }">
		<li>${tmp }</li>
	</c:forEach>
</ul>

<h4>List of Friends</h4>
<ul>
	<c:forEach var="tmp" items="${requestScope.names }" varStatus="status">
								<%-- varStatus는 변수명처럼 임의로 지을 수 있다 (상태값이라는 의미에서 "status"라고 한것임) --%>
		<li>		
			status.index : <strong>${status.index}</strong> |  <%-- 인덱스를 같이 출력하므로 인덱스 넘버를 알 수 있다 --%>
			status.count : <strong>${status.count}</strong> |  <%-- 순서 (혹은 갯수)를 알 수 있다 --%>
			status.first : <strong>${status.first}</strong> |  <%-- 배열의 가장 첫번째인지 여부 --%>
			status.last : <strong>${status.last}</strong>     <%-- 배열의 가장 마지막 번호인지 여부 --%>
			${tmp }
		</li>
	</c:forEach>
</ul>

</body>
</html>