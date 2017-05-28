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
		System.out.println("�α��� ��...");
		System.out.println(this.getClass());

		String id = request.getParameter("id");
		String password = request.getParameter("password");

		MemberDao mdao = new MemberDao();

		Member bean = mdao.SelectDataByPk(id);

		String url = null;
		String msg = "";
		ServletContext sc = request.getServletContext();

		if (bean == null) { // �������� �ʴ� ���̵�
			url = "/main.jsp";
			msg = "���̵� ��й�ȣ�� �� �� �Ǿ����ϴ�.";
			System.out.println("���̵��߸�");
			request.setAttribute("errmsg", msg);
		} else { // �����ϴ� ���̵�
			if (password.equals(bean.getPassword())) { // ��й�ȣ ����
				url = "/main.jsp?menu1=1&menu2=1";
				msg = "�α��� ����.";
				HttpSession session = request.getSession();
				session.setAttribute("loginfo", bean);
				sc.setAttribute("loginName", bean.getName());
				System.out.println("�α��μ���");
			} else { // ��й�ȣ Ʋ��
				url = "/main.jsp";	
			}
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
