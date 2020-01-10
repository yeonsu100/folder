package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/home/myhome")
public class MyHomeServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PrintWriter pw=resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'/>");
		pw.println("<title>Page of 'Go to Home'</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<p>Hi, Winnie</p>");
		pw.println("<p>Finally Home!!!</p>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}
