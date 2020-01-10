package test.filter;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/shop/*")			// shop 하위 폴더의 모든 요청은 필터를 거치도록 설정
public class LoginFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req, 
			ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		/*
		 * 로그인 여부를 확인하려면 HttpSession 객체가 필요하다.
		 * HttpSession 객체는 HttpServletRequest 객체의 메소드를 이용해서 참조값을 얻어낼 수 있으므로
		 * ServletRequest 객체를 원래 type인 HttpServletRequest type으로 캐스팅한다.
		 */
		
		// 1. HttpServletRequest type 얻어내기
		HttpServletRequest request=(HttpServletRequest)req;
		// 2. HttpSession type 얻어내기
		HttpSession session=request.getSession();
		// 3. 세션에 "id"라는 키값으로 저장된 문자열이 있는지 읽어와본다.
		String id=(String)session.getAttribute("id");
		if(id!=null) {		// 로그인이 된 경우
			// 관여하지 않고 요청의 흐름 계속 진행 시키기
			chain.doFilter(req, res);
		}else {				// 로그인이 안된 경우
			/*
			 * 로그인 후에 원래 가려고했던 목적지 페이지로 다시 보내야하고
			 * 전송되던 파라미터가 있다면 파라미터 정보도 같이 넘겨주어야 한다.
			 */
			String url=request.getRequestURI();
			String query=request.getQueryString();
			String encodedUrl=null;
			if(query==null) {
				encodedUrl=URLEncoder.encode(url);
			}else {
				encodedUrl=URLEncoder.encode(url+"?"+query);
			}
			
			HttpServletResponse response=(HttpServletResponse)res;
			String cPath=request.getContextPath();
			// 로그인 폼으로 리다이렉트 시킨다.
			response.sendRedirect(cPath+"/users/loginform.jsp?url="+encodedUrl);
		}
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	
}
