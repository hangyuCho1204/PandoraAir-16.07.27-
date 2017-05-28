package mypkg.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypkg.controller.SuperController;
import mypkg.model.MemberDao;
import mypkg.utility.FlowParameters;

public class DeleteController implements SuperController {

	@Override
	public void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
//		FlowParameters parameters = new FlowParameters() ;
//		parameters.setKeyword( request.getParameter("keyword") ); 
//		parameters.setMode( request.getParameter("mode") ); 
//		parameters.setPageNumber( request.getParameter("pageNumber") );
//		parameters.setPageSize( request.getParameter("pageSize") );
		
		MemberDao bdao = new MemberDao() ;
		int cnt = -99999 ;
		cnt = bdao.DeleteData(id) ;
		
		HttpSession session = request.getSession() ; 
		session.invalidate(); //세션을 비우기. 
		String url ="/main.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);	
	}

}
