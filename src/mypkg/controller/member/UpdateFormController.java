package mypkg.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypkg.controller.SuperController;
import mypkg.model.Member;
import mypkg.model.MemberDao;

public class UpdateFormController implements SuperController {

	@Override
	public void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

			String id = request.getParameter("id") ;
	        MemberDao mdao = new MemberDao() ;
	        Member bean = mdao.SelectDataByPk(id) ;
	
	        System.out.println( this.getClass() + bean.toString());
	        request.setAttribute( "bean", bean ); 
		
            String url = "/member/updateForm.jsp";  
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            dispatcher.forward(request, response);
		
	}

}
