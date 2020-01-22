<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/list.jsp</title>

<jsp:include page="../../include/resource.jsp"></jsp:include>
<style>
	h1{color : #6799FF;}
	h3{color : #FF9090;}
</style>
</head>
<body>
<jsp:include page="../../include/navbar.jsp">
	<jsp:param value="cafe" name="category" />
</jsp:include>
	
<div class="container">
	<ol class="breadcrumb">
		<li><a href="list.jsp">Show all contents (List)</a></li>
	</ol>
	
	<h1>Article List</h1>
	<table class="table table-striped table-condensed">
		<colgroup>  <!-- 값을 다 더했을 때 12가 되도록 -->
			<col class="col-xs-1"/>
			<col class="col-xs-2"/>
			<col class="col-xs-4"/>
			<col class="col-xs-1"/>
			<col class="col-xs-2"/>
		</colgroup>
			<thead>
				<tr>
					<th>No.</th>
					<th>Writer</th>
					<th>Title</th>
					<th>View</th>
					<th>Date</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="tmp" items="${requestScope.list }">
				<tr>
					<td>${tmp.num }</td>
					<td>${tmp.writer }</td>
					<td>
						<a href="detail.jsp?num=${tmp.num }">
							${tmp.title }
						</a>
					</td>
					<td>${tmp.viewCount }</td>
					<td>${tmp.regdate }</td>
				</tr>
			</c:forEach>
			</tbody>
	</table>
	
	<h3><a href="private/insertform.jsp">Create a new article</a></h3>

	<div class="page-display">
		<ul class="pagination pagination-sm">
		
		<c:choose>
			<c:when test="${startPageNum ne 1 }">
				<li>
					<a href="list.jsp?pageNum=${startPageNum-1 }">&laquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="disabled">
					<a href="javascript:">&laquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
		
		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }" step="1">
			<c:choose>
				<c:when test="${i eq pageNum }">
					<li class="active">
						<a href="list.jsp?pageNum=${i }">${i }</a>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="list.jsp?pageNum=${i }">${i }</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>

			<c:choose>
				<c:when test="${endPageNum lt totalPageCount }">
					<li>
						<a href="list.jsp?pageNum=${endPageNum+1 }">&raquo;</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="disabled">
						<a href="javascript:">&raquo;</a>
					</li>
				</c:otherwise>
			</c:choose>
								
		</ul>
	</div>
</div>
</body>
</html>