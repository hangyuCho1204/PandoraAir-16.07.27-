package mypkg.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypkg.controller.SuperController;
import mypkg.model.Member;
import mypkg.model.MemberDao;

public class LoginController extends HttpServlet implements SuperController {

	@Override
	public void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("로그인 중...");
		System.out.println(this.getClass());

		String id = request.getParameter("id");
		String password = request.getParameter("password");

		MemberDao mdao = new MemberDao();

		Member bean = mdao.SelectDataByPk(id);

		String url = null;
		String msg = "";
		ServletContext sc = request.getServletContext();

		if (bean == null) { // 존재하지 않는 아이디
			url = "/main.jsp";
			msg = "아이디나 비밀번호가 잘 못 되었습니다.";
			System.out.println("아이디잘못");
			request.setAttribute("errmsg", msg);
		} else { // 존재하는 아이디
			if (password.equals(bean.getPassword())) { // 비밀번호 맞음
				url = "/main.jsp?menu1=1&menu2=1";
				msg = "로그인 성공.";
				HttpSession session = request.getSession();
				session.setAttribute("loginfo", bean);
				sc.setAttribute("loginName", bean.getName());
				System.out.println("로그인성공");
			} else { // 비밀번호 틀림
				url = "/main.jsp";	
			}
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
