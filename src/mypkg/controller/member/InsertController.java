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
			//DAO 객체를 생성한다.
			MemberDao mdao = new MemberDao();			
			int cnt = -99999 ; 			
			//Bean 객체를 이용하여 해당 게시물을 추가한다.
			cnt = mdao.InsertData(bean) ;
		}
		System.out.println( request.getAttribute("bean") );
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(this.request, response);		
	}
	@Override
	public boolean validate() {
		final String PREFIX = "err" ;
		boolean isCheck = true ; //기본 값으로 true이고, 유효성 검사에 문제가 생기면 false으로 변경
		
		//Member err = new Member() ; 
		System.out.println(bean.getName());
		if( bean.getId().length() < 1 || bean.getId().length() > 15 ){
			this.request.setAttribute( PREFIX + "id", "아이디는 4자리 이상 10자리 이하이어야 합니다.");
			isCheck = false  ;
		}
		if( bean.getName().length() < 2 || bean.getName().length() > 15 ){
			this.request.setAttribute( PREFIX + "name", "이름은 2자리 이상 10자리 이하이어야 합니다.");
			isCheck = false  ;
		}
		if( bean.getPassword().length() < 4 || bean.getPassword().length() > 20 ){
			this.request.setAttribute( PREFIX + "password", "비밀 번호는 4자리 이상 10자리 이하이어야 합니다.");
			isCheck = false  ;
		}
		if( !bean.getPassword().equals(password2)) {
			this.request.setAttribute( PREFIX + "password2", "비밀번호가 다릅니다.");
			isCheck = false  ;
		}
	
		return isCheck ;
		
	}



}
