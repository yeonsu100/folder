package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.users.dto.UsersDto;

@WebServlet("/el02")
public class El02Servlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		UsersDto dto=new UsersDto();
		dto.setId("Winnie");
		dto.setEmail("winnie100@gamil.com");
		// request 영역에 dto 담기 (key, value)
		req.setAttribute("dto", dto);
		// jsp 페이지로 forward 이동 (동일한 컨텍스트 내, 즉 프로젝트 내에서만 포워드 이동이 가능)
		RequestDispatcher rd=req.getRequestDispatcher("/el/test02.jsp");
		rd.forward(req, resp);
	}
}
