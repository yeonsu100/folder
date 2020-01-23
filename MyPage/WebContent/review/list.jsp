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
<title>/review/list.jsp</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
	<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	h1{color : #6799FF;}
	h4{color : #3162C7;}
	h3{color : #FF9090;}
	thead{background-color:#B2CCFF;}
</style>
</head>
<body>

<%
	final int PAGE_ROW_COUNT=10;
	final int PAGE_DISPLAY_COUNT=5;
	
	int pageNum=1;
	String strPageNum=request.getParameter("pageNum");
	if(strPageNum != null){		
		pageNum=Integer.parseInt(strPageNum);
	}
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	int totalRow=CafeDao.getInstance().getCount();
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	int startPageNum=1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	if(totalPageCount < endPageNum){endPageNum=totalPageCount;}	
	
	CafeDto dto=new CafeDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);

	List<CafeDto> list=CafeDao.getInstance().getList(dto);

	request.setAttribute("list", list);
	request.setAttribute("pageNum", pageNum);
	request.setAttribute("startPageNum", startPageNum);
	request.setAttribute("endPageNum", endPageNum);
	request.setAttribute("totalPageCount", totalPageCount);
%>

<jsp:include page="../include/navbar.jsp"></jsp:include>
	
<div class="container">
	<ol class="breadcrumb">
		<li><a href="list.jsp">Show all Reviews (List)</a></li>
	</ol>
	
	<h1>Review Page</h1>
	<h4>These are REALLLLLL REVIEWS from our Customer!!!</h4>
	<table class="table table-striped table-hover">
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
	
	<h3><a href="private/insertform.jsp">Create a new comment <span class="glyphicon glyphicon-pencil"></span></a></h3>

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

<jsp:include page="../include/ysfooter.jsp"></jsp:include>	
<embed src="${pageContext.request.contextPath }/resources/music/parade.mp3" autoplay="true" align="bottom" loop="true" ></embed>
</body>
</html>