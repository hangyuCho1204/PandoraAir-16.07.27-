package mypkg.controller.airplane;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypkg.controller.SuperController;
import mypkg.model.Airplane;
import mypkg.model.AirplaneDao;

	public class AirplaneListController implements SuperController {

		@Override
		public void doProcess(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			
			AirplaneDao Adao = new AirplaneDao();
			
			List<Airplane> lists = Adao.SelectDataList();
			
			request.setAttribute("lists", lists);
			
			
			String url = "view/airplane/AirplaneList.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}

	}

