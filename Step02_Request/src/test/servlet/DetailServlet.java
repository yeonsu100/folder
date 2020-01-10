package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * 	/detail?num=1
 * 	/detail?num=2
 * 	/detail?num=3
 * 
 * - 위와같은 요청을 해올때 아래의 서블릿에 있는 service() 메소드가 호출된다.
 * - ?num=x 형식으로 전달되는 것을 "GET 방식 요청 파라미터"라고 한다. (물음표 뒤 달고오는 것)
 * - 요청 파라미터는 HttpServletRequest 객체를 이용해서 추출할 수 있다.
 */
@WebServlet("/detail")
public class DetailServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// "num"이라는 파라미커명으로 전달되 문자열 읽어오기
		String strNum=req.getParameter("num");
		// 문자열을 만일 정수로 바꾸고 싶으면?
		int num=Integer.parseInt(strNum);
		
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		PrintWriter pw=resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'/>");
		pw.println("<title>Page of details</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<p>"+num+"번 자세히 보기 ok!</p>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}
