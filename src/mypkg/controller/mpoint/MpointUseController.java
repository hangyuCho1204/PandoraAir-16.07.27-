package mypkg.controller.mpoint;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypkg.controller.SuperController;
import mypkg.model.Airplane;
import mypkg.model.AirplaneDao;

	public class MpointUseController implements SuperController {

		@Override
		public void doProcess(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {

			String url = "view/mpoint/mPointMain.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}

	}

