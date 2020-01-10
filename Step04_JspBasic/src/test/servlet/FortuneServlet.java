package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test2/fortune")
public class FortuneServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		
		// 응답을 jsp 페이지 혹은 다른 서블릿으로 위임할 수 있다.
		
		// 1. 응답을 위임할 이동 경로 (context path는 넣지 않는다)
		// (context path 넣지 않는 이유 : 포워드 이동은 같은 컨텍스트(프로젝트) 내에서만 이동 가능하기 때문
		String path="/test2/person.jsp";
		// 2. RequestDispatcher 객체의 참조값
		RequestDispatcher rd=req.getRequestDispatcher(path);
		// 3. 포워드 이동해서 응답한다.
		rd.forward(req, resp);
	}
}
