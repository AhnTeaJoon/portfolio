package com.ggiri.root.project.Interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ggiri.root.session.login.GgiriMemberSession;

public class projectInterceptor extends HandlerInterceptorAdapter implements GgiriMemberSession{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		if(session.getAttribute(LOGIN)==null && session.getAttribute("kakaoMember")==null && session.getAttribute("naverMember")==null && session.getAttribute("googleMember")==null ) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('로그인 하세요!');"
					+ "location.href='"
					+ request.getContextPath()
					+ "/ggiriMember/ggiriLogin'</script>");
			return false;
		}
		return true;
	}
	
	
}
