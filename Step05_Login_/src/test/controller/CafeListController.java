package test.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.cafe.dao.CafeDao;
import test.cafe.dto.CafeDto;

// 카페 글 목록 보기 요청을 처리하는 컨트롤러
public class CafeListController implements Controller {

	@Override
	public void execute(HttpServletRequest request, 
			HttpServletResponse response) 
					throws ServletException, IOException {
		// 1. 카페 글 목록을 얻어와서
		// 페이징 처리 로직
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
		int totalRow=CafeDao.getInstance().getCount();
		// 전체 페이지의 갯수 구하기
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		// 시작 페이지 번호
		int startPageNum=1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		// 끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		// 끝 페이지 번호가 잘못된 값이라면 보정해준다.
		if(totalPageCount < endPageNum){endPageNum=totalPageCount;}	
		
		// CafeDto 객체에 위에서 계산된 startRowNum과 endRowNum을 담는다.
		CafeDto dto=new CafeDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);


		List<CafeDto> list=CafeDao.getInstance().getList(dto);

		// 2. request 영역에 담고
		request.setAttribute("list", list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		
		
		// 3. view page (jsp 페이지)로 forward 이동해서 응답한다.
		RequestDispatcher rd=request.getRequestDispatcher("/views/cafe/list.jsp");
		rd.forward(request, response);
	}

}