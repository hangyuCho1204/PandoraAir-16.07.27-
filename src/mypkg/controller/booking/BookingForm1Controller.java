package mypkg.controller.booking;

import java.io.IOException;
import java.sql.Date;
import java.text.DecimalFormat;
import java.time.Year;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypkg.controller.SuperController;
import mypkg.model.AirCheck;
import mypkg.model.City;
import mypkg.model.CityDao;
import mypkg.model.Data_terminalDao;
import mypkg.model.Member;
import mypkg.model.Schedule;
import mypkg.model.ScheduleDao;

	public class BookingForm1Controller implements SuperController {

		@Override
		public void doProcess(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			this.getClass();

			HttpSession session =  request.getSession();
			
			Member loginfo = (Member)session.getAttribute("loginfo");
			
			String id = loginfo.getId();
			
			
			String start = request.getParameter("section1-1");
			String end = request.getParameter("section1-2");
			
			String citycode = start + "_" + end;
			
			ScheduleDao sdao = new ScheduleDao();
			Schedule schedule = sdao.SelectDataList(citycode);
			
			
			Data_terminalDao dtdao = new Data_terminalDao();
			int dataQty = dtdao.SelectDataqty();
			System.out.println(dataQty);
			
			DecimalFormat df = new DecimalFormat("#00000");
			DecimalFormat datef = new DecimalFormat("#00");
			
			
			String local = "";
			String destination = "";
			
			CityDao cdao = new CityDao();
			List<City> lists = cdao.SelectDataList();
			for (City city : lists) {
				if(city.getCity_code().equals(citycode)){
					local = city.getLocal();
					destination = city.getDestination();
				}
			}
			
			int sequenceNo = schedule.getSequence();
			String airplane_name = schedule.getAplane_name();
			String arrival_time = schedule.getArrival_time();
			String departure_time = schedule.getDeparture_time();
			
			String b_code = "BKL_"+df.format(dataQty+1);
			
			Calendar cal = Calendar.getInstance();
			
			String year = datef.format(cal.get(Calendar.YEAR));
			String afterYear = year.substring(2, 4);
			
			
			String p_date = afterYear+"/"+datef.format(cal.get(Calendar.MONTH))+"/"+datef.format(cal.get(Calendar.DATE));
			
			System.out.println(p_date);
			
			
			
			AirCheck bean = new AirCheck();
			
			bean.setAirplane_name(airplane_name);
			bean.setArrival_time(arrival_time);
			bean.setDeparture_time(departure_time);
			bean.setDestination(destination);
			bean.setLocal(local);
			bean.setP_date(request.getParameter("startTerm"));
			bean.setPersons(request.getParameter("persons"));
			bean.setSection1(start);
			bean.setSection2(end);
			
			request.setAttribute("bean", bean);
			
			String url = "/view/booking/bookingForm2.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			System.out.println(dispatcher);
			dispatcher.forward(request, response);
		}

	}

