package mypkg.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mypkg.controller.SuperController;

public class LogoutController implements SuperController {

	@Override
	public void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession() ; 
		session.invalidate(); //세션을 비우기. 
		
		String contextPath = request.getContextPath()  ;
		response.sendRedirect( contextPath + "/main.jsp" );
		
	}

}
