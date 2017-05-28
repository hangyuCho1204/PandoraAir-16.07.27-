package mypkg.controller.city;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypkg.controller.SuperController;
import mypkg.model.City;
import mypkg.model.CityDao;

	public class CityListController implements SuperController {

		@Override
		public void doProcess(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			
			CityDao cdao = new CityDao();
			
			List<City> lists = cdao.SelectDataList();
			
			request.setAttribute("lists", lists);
			
			String url = "view/city/CityList.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}

	}

