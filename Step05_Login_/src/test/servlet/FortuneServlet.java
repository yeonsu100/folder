package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		// 1. 오늘의 운세를 얻어오는 비즈니스 로직을 수행한다.
		String fortuneToday="A smile is your passport into the hearts of others.";
		
		// 2. 로직 수행 결과 모델 (data)를 request에 담는다.
		req.setAttribute("fortuneToday", fortuneToday);
		
		// 3. view page (jsp 페이지)로 forward 이동해서 응답한다.
		RequestDispatcher rd=req.getRequestDispatcher("/views/fortune.jsp");
		rd.forward(req, resp);
	}
}
