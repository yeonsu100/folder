package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/el01")
public class El01Servlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		// request 영역에 "myName"이라는 키값으로 "Winnie" 저장하기
		req.setAttribute("myName", "Winnie");
		// jsp 페이지로 forward 이동 (응답을 위임하기)
		RequestDispatcher rd=req.getRequestDispatcher("/el/test01.jsp");
				// 즉 test01.jsp가 응답하기 전까지는 응답은 미루어진 상태이다. 
		rd.forward(req, resp);
	}
}
