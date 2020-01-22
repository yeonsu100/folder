package test.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.cafe.dao.CafeDao;
import test.cafe.dto.CafeDto;
import test.controller.CafeListController;

// .nhh으로 끝나는 모든 요청을 처리할 서블릿 정의하기 (nhn대신 .ys, .win 등등 임의로 지정 가능)
@WebServlet("*.nhn")
public class GateServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		String uri=request.getRequestURI();
		// 컨텍스트 경로의 길이
		String cPath=request.getContextPath();
		int cLength=cPath.length();
		// .의 인덱스
		int index=uri.indexOf(".");
		// 순수 요청 경로 (컨텍스트 경로 제외, .nhn 제외)
		String path=uri.substring(cLength, index);
						 // 범위 : 이상-미만 (서양의 숫자 개념을 따른다(이상-미만))
		
		if(path.equals("/cafe/list")) {			// 카페 글 목록보기 요청이라면
			new CafeListController().execute(request, resp);
		}else if(path.equals("/cafe/insertform")) {
			
		}
	}
}
