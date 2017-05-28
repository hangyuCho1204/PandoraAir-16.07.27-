package mypkg.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypkg.controller.SuperController;
import mypkg.model.Member;
import mypkg.model.MemberDao;
import mypkg.utility.Validator;

public class InsertController implements SuperController,Validator{

	private HttpServletRequest request ;
	private Member bean = null ;
	private String password2 = "";
	
	@Override
	public void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
        this.request = request ; 

		bean  = new Member();	
		bean.setId( request.getParameter("id") );
		if( request.getParameter("mpoint") != null && request.getParameter("mpoint") != "" ){
			bean.setMpoint( Integer.parseInt( request.getParameter("mpoint") ));	
		}
		bean.setEmail(request.getParameter("email"));
		bean.setLnum(request.getParameter("lnum"));
		bean.setPhone(request.getParameter("phone"));
		bean.setName( request.getParameter("name"));
		bean.setPassword( request.getParameter("password"));
		if( request.getParameter("mpoint") != null && request.getParameter("mpoint") != ""){
			bean.setMpoint(Integer.parseInt( request.getParameter("mpoint")));	
		}
		
		System.out.println( bean );
		
		password2 = request.getParameter("password2") ;
		System.out.println(password2 + "@@");
		
		String url = "";
		if ( this.validate() == false ) {
			url = "/member/InsertForm.jsp";  
			this.request.setAttribute("bean", bean);
		}else{
			url = "/main.jsp";
			//DAO ��ü�� �����Ѵ�.
			MemberDao mdao = new MemberDao();			
			int cnt = -99999 ; 			
			//Bean ��ü�� �̿��Ͽ� �ش� �Խù��� �߰��Ѵ�.
			cnt = mdao.InsertData(bean) ;
		}
		System.out.println( request.getAttribute("bean") );
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(this.request, response);		
	}
	@Override
	public boolean validate() {
		final String PREFIX = "err" ;
		boolean isCheck = true ; //�⺻ ������ true�̰�, ��ȿ�� �˻翡 ������ ����� false���� ����
		
		//Member err = new Member() ; 
		System.out.println(bean.getName());
		if( bean.getId().length() < 1 || bean.getId().length() > 15 ){
			this.request.setAttribute( PREFIX + "id", "���̵�� 4�ڸ� �̻� 10�ڸ� �����̾�� �մϴ�.");
			isCheck = false  ;
		}
		if( bean.getName().length() < 2 || bean.getName().length() > 15 ){
			this.request.setAttribute( PREFIX + "name", "�̸��� 2�ڸ� �̻� 10�ڸ� �����̾�� �մϴ�.");
			isCheck = false  ;
		}
		if( bean.getPassword().length() < 4 || bean.getPassword().length() > 20 ){
			this.request.setAttribute( PREFIX + "password", "��� ��ȣ�� 4�ڸ� �̻� 10�ڸ� �����̾�� �մϴ�.");
			isCheck = false  ;
		}
		if( !bean.getPassword().equals(password2)) {
			this.request.setAttribute( PREFIX + "password2", "��й�ȣ�� �ٸ��ϴ�.");
			isCheck = false  ;
		}
	
		return isCheck ;
		
	}



}
