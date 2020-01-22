package test.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/el03")
public class El03Servlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		// 세션 영역에 String type 담기 (request에 담으면 응답을 하기전까지만 유효하므로)
		HttpSession session=req.getSession();
		session.setAttribute("myNick", "Chloe");
		// jsp 페이지로 리다일렉트 이동하기
		String cPath=req.getContextPath();
		resp.sendRedirect(cPath+"/el/test03.jsp");
	}
}
