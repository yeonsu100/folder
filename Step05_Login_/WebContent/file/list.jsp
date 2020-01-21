<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	// 세션에 있는 아이디 읽어오기 (본인의 글만 삭제할 수 있도록) (로그인을 하지 않았다면 null이다.)
	String id=(String)session.getAttribute("id");
	
	//페이징 처리 로직
	// 한 페이지에 나타낼 row 의 갯수
	final int PAGE_ROW_COUNT=5;
	// 하단 디스플레이 페이지 갯수
	final int PAGE_DISPLAY_COUNT=5;
	
	// 보여줄 페이지의 번호
	int pageNum=1;
	// 보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.	
	String strPageNum=request.getParameter("pageNum");
	if(strPageNum != null){			// 페이지 번호가 파라미터로 넘어온다면
		// 페이지 번호를 설정한다. (넘어오지 않는다면 디폴트값 : 1 (1페이지가 보여지게 된다))
		pageNum=Integer.parseInt(strPageNum);
	}
	// 보여줄 페이지 데이터의 시작 ResultSet row 번호 (공차수열의 일반항)
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	// 보여줄 페이지 데이터의 끝 ResultSet row 번호
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	// 전체 row 의 갯수를 읽어온다.
	int totalRow=FileDao.getInstance().getCount();
	// 전체 페이지의 갯수 구하기
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	// 시작 페이지 번호
	int startPageNum=1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	// 끝 페이지 번호
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	// 끝 페이지 번호가 잘못된 값이라면 보정해준다.
	if(totalPageCount < endPageNum){endPageNum=totalPageCount;}	
	
	// CafeDto 객체에 위에서 계산된 startRowNum과 endRowNum을 담는다.
	FileDto dto=new FileDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);

	// 1. DB에서 파일 목록을 얻어와서
	List<FileDto> list=FileDao.getInstance().getList(dto);
	// 2. 응답하기
	
	// EL, JSTL을 활용하기 위해 필요한 모델을 request에 담는다.
	request.setAttribute("list", list);
	request.setAttribute("dto", dto);
	request.setAttribute("pageNum", pageNum);
	request.setAttribute("startPageNum", startPageNum);
	request.setAttribute("endPageNum", endPageNum);
	request.setAttribute("totalPageCount", totalPageCount);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/list.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	h1{color:#6EE3F7;}
	h3{color : #FF9090;}
	thead{background-color:#B2EBF4;}
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="file" name="category" />
</jsp:include>

<div class="container">
	<ol class="breadcrumb">
		<li><a href="list.jsp">Show all uploaded files (List)</a></li>
	</ol>
	
	<h1>List of File</h1>
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>No.</th>
				<th>Writer</th>
				<th>Title</th>
				<th>File Name</th>
				<th>File Size</th>
				<th>Down Count</th>
				<th>Date</th>
				<th>Delete</th>
			</tr>
		</thead>
				
		<tbody>
		
		<c:forEach var="tmp" items="${list }">
			<tr>
				<td>${tmp.num }</td>
				<td>${tmp.writer }</td>
				<td>${tmp.title }</td>
				<td>
					<a href="download.jsp?num=${tmp.num }">
						${tmp.orgFileName }
					</a>
				</td>
				<td>${tmp.fileSize }</td>
				<td>${tmp.downCount }</td>
				<td>${tmp.regdate }</td>
				<td>
					<c:if test="${id eq tmp.writer }">
						<a href="javascript:deleteConfirm(${tmp.num })">Delete</a>
					</c:if>
				</td>
			</tr>
		</c:forEach>
		
		<%-- 
			<%for(FileDto tmp:list) {%>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getWriter() %></td>
					<td><%=tmp.getTitle() %></td>
					<td>
						<a href="download.jsp?num=<%=tmp.getNum() %>">
							<%=tmp.getOrgFileName() %>
						</a>
					</td>
					<td><%=tmp.getFileSize() %></td>
					<td><%=tmp.getDownCount() %></td>
					<td><%=tmp.getRegdate() %></td>
					<td>
						<%if(tmp.getWriter().equals(id)){ %>
							<a href="javascript:deleteConfirm(<%=tmp.getNum()%>)">Delete</a>
						<%} %>
					</td>
				</tr>
			<%} %>
			--%>
		</tbody>
	</table>
	
	<h3><a href="${pageContext.request.contextPath }/file/private/upload_form.jsp">File Upload</a></h3>
	
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
		
		<c:forEach var="w" begin="${startPageNum }" end="${endPageNum }">
			<c:choose>
				<c:when test="${w eq pageNum }">
					<li class="active">
						<a href="list.jsp?pageNum=${w }">${w }</a>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="list.jsp?pageNum=${w }">${w }</a>
					</li>
				</c:otherwise>
			</c:choose>	
		</c:forEach>
		
			<c:choose>
				<c:when test="${endPageNum lt totalPageNum }">
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

<script>
	// 삭제 여부를 확인하고 삭제를 진행하는 javascript 함수
	function deleteConfirm(num){
		var isDelete=confirm("Are you sure delete this No."+num+" file?");
		if(isDelete){
			location.href="private/delete.jsp?num="+num;
		}
	}
</script>

</body>
</html>