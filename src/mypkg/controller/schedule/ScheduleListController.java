package mypkg.controller.schedule;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypkg.controller.SuperController;
import mypkg.model.Schedule;
import mypkg.model.ScheduleDao;

	public class ScheduleListController implements SuperController {

		@Override
		public void doProcess(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {

			ScheduleDao sdao = new ScheduleDao();
			
			List<Schedule> lists = sdao.SelectDataList();
			
			request.setAttribute("lists", lists);
			
			String url = "view/schedule/ScheduleList.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}

	}

