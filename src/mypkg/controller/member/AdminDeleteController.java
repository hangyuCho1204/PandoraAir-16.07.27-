package mypkg.controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypkg.controller.SuperController;
import mypkg.model.Member;
import mypkg.model.MemberDao;

public class AdminDeleteController implements SuperController {

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
		
		MemberDao mdao = new MemberDao();
		
		List<Member> lists = mdao.SelectDataList();
		
		request.setAttribute("lists", lists);
		
		String url = "view/member/memberList.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);	
	}

}
