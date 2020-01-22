<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<div class="navbar navbar-inverse navbar-fixed-top">		
	<div class="container">
	<!-- 홈페이지(인덱스) 링크와 버튼을 넣어둘 div -->
	<div class="navbar-header">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">HOME</a>
		<button class="navbar-toggle"
				data-toggle="collapse"
				data-target="#one">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
	</div>
	
	<!-- xs 영역에서는 숨겨졌다가 버튼을 누르면 나오게 할 컨텐츠를 넣을 div -->
	<div class="collapse navbar-collapse" id="one">
		<!-- 네비 바 목록 (절대경로를 쓰는 것이 좋다) -->
		<ul class="nav navbar-nav">
			<li <c:if test="${param.category eq 'cafe' }">class="active" </c:if>> <a href="${pageContext.request.contextPath }/cafe/list.jsp">Cafe</a></li>
			<li <c:if test="${param.category eq 'file' }">class="active" </c:if>><a href="${pageContext.request.contextPath }/file/list.jsp">Web hard</a></li>
			<li><a href="https://www.youtube.com">YouTube</a></li>
			<li><a href="https://www.instagram.com/yunstagram_100/">Yunstagram</a></li>
		</ul>
		
		<c:choose>
			<c:when test="${empty sessionScope.id }">
				<div class="pull-right">
				<a class="btn btn-primary navbar-btn btn-xs" href="${pageContext.request.contextPath }/users/loginform.jsp">Sign In</a>
				<a class="btn btn-info navbar-btn btn-xs" href="${pageContext.request.contextPath }/users/signup_form.jsp">Create an account</a>
				</div>
			</c:when>
			<c:otherwise>
				<p class="navbar-text pull-right">
				Signed as <strong><a class="navbar-link" href="${pageContext.request.contextPath }/users/private/info.jsp">${id }</a></strong>
				<a class="navbar-link" href="${pageContext.request.contextPath }/users/logout.jsp">Signed Out</a>
				</p>
			</c:otherwise>
		</c:choose>
	
		</div>
	</div>
</div>
    