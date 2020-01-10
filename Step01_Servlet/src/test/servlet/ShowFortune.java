package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fortune/showfortune")
public class ShowFortune extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter pw=resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'/>");
		pw.println("<title>Page of 'show Today's fortune!'</title>");
		pw.println("<link rel='stylesheet' href='/Step01_Servlet/resources/css/bootstrap.css'/");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<div class='container'>");
			pw.println("<p>Hi, Winnie</p>");
			pw.println("<p>Good Luck!!</p>");
			pw.println("<a class='btn btn-primary' href='/Step01_Servlet/index.html'>Go to the Index</a>");
			pw.println("<div>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}
