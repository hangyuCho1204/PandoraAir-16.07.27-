package mypkg.controller.member;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypkg.controller.SuperController;
import mypkg.model.Member;
import mypkg.model.MemberDao;
public class IdcheckController implements SuperController{
  @Override
  public void doProcess(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String id = request.getParameter("id") ;
    
    MemberDao udao = new MemberDao() ;
    Member bean = udao.SelectDataByPk(id) ;
    if ( bean == null ) { 
      request.setAttribute("message", id + "��(��) ��� ������ ���̵��Դϴ�.") ;
      request.setAttribute("isCheck", true) ;
    }else{
      request.setAttribute("message", id + "��(��) �̹� ������� ���̵��Դϴ�.") ;
      request.setAttribute("isCheck", false) ;
    }
    String url = "/member/idCheck.jsp";  
    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
    dispatcher.forward(request, response);
  }
}