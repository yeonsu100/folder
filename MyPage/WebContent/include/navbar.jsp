<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<div class="navbar navbar-inverse navbar-fixed-top">		
	<div class="container">
	<div class="navbar-header">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/main.jsp">
		<span class="	glyphicon glyphicon-home"></span></a>
		<button class="navbar-toggle"
				data-toggle="collapse"
				data-target="#one">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
	</div>
	
	<div class="collapse navbar-collapse" id="one">
		<ul class="nav navbar-nav">
			<li <c:if test="${param.category eq 'cart' }">class="active" </c:if>> 
				<a href="${pageContext.request.contextPath }/shoppingmall/list.jsp">Cart
				<span class="glyphicon glyphicon-shopping-cart"></span></a>
			</li>
			<li <c:if test="${param.category eq 'review' }">class="active" </c:if>> 
				<a href="${pageContext.request.contextPath }/review/list.jsp">Review
				<span class="glyphicon glyphicon-pencil"></span></a>
			</li>
			<li <c:if test="${param.category eq 'schedule' }">class="active" </c:if>> 
				<a href="${pageContext.request.contextPath }/schedule/list.jsp">schedule
				<span class="glyphicon glyphicon-calendar"></span></a>
			</li>
			<li <c:if test="${param.category eq 'gallery' }">class="active" </c:if>> 
				<a href="${pageContext.request.contextPath }/gallery/list.jsp">Gallery
				<span class="glyphicon glyphicon-camera"></span></a>
			</li>
			<li <c:if test="${param.category eq 'contact' }">class="active" </c:if>> 
				<a href="${pageContext.request.contextPath }/contact/map.jsp">Contact
				<span class="glyphicon glyphicon-envelope"></span></a>
			</li>
			<li><a href="https://www.youtube.com/user/DisneyParks/">YouTube
			<span class="glyphicon glyphicon-facetime-video"></span></a></li>
			<li><a href="https://www.instagram.com/yunstagram_100/">Yunstagram
			<span class="glyphicon glyphicon-picture"></span></a></li>
		</ul>
		
		<c:choose>
			<c:when test="${empty sessionScope.id }">
				<div class="pull-right">
				<a class="btn btn-primary navbar-btn btn-xs" href="${pageContext.request.contextPath }/users/loginform.jsp">Sign In</a>
				<a class="btn btn-info navbar-btn btn-xs" href="${pageContext.request.contextPath }/users/signup_form.jsp">Register</a>
				</div>
			</c:when>
			<c:otherwise>
				<p class="navbar-text pull-right"><span class="glyphicon glyphicon-user"></span>
				Signed as <strong><a class="navbar-link" href="${pageContext.request.contextPath }/users/private/info.jsp">${id }</a></strong>
				<a class="navbar-link" href="${pageContext.request.contextPath }/users/logout.jsp">Signed Out</a>
				</p>
			</c:otherwise>
		</c:choose>
	
		</div>
	</div>
</div>
    