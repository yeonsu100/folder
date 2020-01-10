package test.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test1/game")
public class GameServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {

		// 컨텍스트 경로 읽어오기
		String cPath=req.getContextPath();
		// 원하는 경로로 리다이렉트 이동시키기
		resp.sendRedirect(cPath+"/test1/study.jsp");
	}
}
