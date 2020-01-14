<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<style>
	.page-display ul li{
		float: left;		/* 왼쪽으로 일렬로 정렬 */
		list-style-type: none;
		margin-right: 10px;
	}
	.page-display ul li a{
		text-decoration: none;
		color: skyblue;
	}
	.page-display ul li.active a{
		text-decoration: underline;
		font-weight: bold;
		color: purple;
	}
</style>
</head>

<body>
<%
	// 페이징 처리 로직
	// 한 페이지에 나타낼 row 의 갯수
	final int PAGE_ROW_COUNT=5;
	// 하단 디스플레이 페이지 갯수
	final int PAGE_DISPLAY_COUNT=10;
	
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
	int totalRow=CafeDao.getInstance().getCount();
	// 전체 페이지의 갯수 구하기
	int totalPageCount=
			(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	// 시작 페이지 번호
	int startPageNum=
		1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	// 끝 페이지 번호
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	// 끝 페이지 번호가 잘못된 값이라면 
	if(totalPageCount < endPageNum){
		endPageNum=totalPageCount; 			// 보정해준다. 
	}	
	
	// CafeDto 객체에 위에서 계산된 startRowNum과 endRowNum을 담는다.
	CafeDto dto=new CafeDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);

	// 1. DB에서 글 목록을 얻어온다.
	List<CafeDto> list=CafeDao.getInstance().getList(dto);
	// 2. 글 목록을 응답한다.
%>

<div class="container">
	<a href="private/insertform.jsp">Create a new article</a>
	<h1>Article List</h1>
	<table>
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
		<%for(CafeDto tmp:list){ %>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getWriter() %></td>
				<td><%=tmp.getTitle() %></td>
				<td><%=tmp.getViewCount() %></td>
				<td><%=tmp.getRegdate() %></td>
			</tr>
		<%} %>
		</tbody>
	</table>

	<div class="page-display">
		<ul>
			<%for(int i=startPageNum; i<=endPageNum; i++){ %>
				<%if(i==pageNum){ %>
					<li class="active">
						<a href="list.jsp?pageNum=<%=i %>"><%=i %></a>
					</li>
				<%}else{ %>
					<li>
						<a href="list.jsp?pageNum=<%=i %>"><%=i %></a>
					</li>
				<%} %>
			<%} %>
		</ul>
	</div>

</div>
</body>
</html>