package mypkg.controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypkg.controller.SuperController;
import mypkg.model.BookingListJoin;
import mypkg.model.BookingList_Dao;
import mypkg.utility.Paging;

public class BookingListController extends HttpServlet implements SuperController {

	@Override
	public void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		BookingList_Dao bdao = new BookingList_Dao();
		System.out.println("booking");
		
		ServletContext sc = request.getServletContext();
		
		String name = (String)sc.getAttribute("loginName");
		
		System.out.println(name);
		List<BookingListJoin> lists = bdao.SelectDataList(name) ;		
		
		request.setAttribute("lists", lists);
		
		String url = "/view/booking/MemberBookingList.jsp";  
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
