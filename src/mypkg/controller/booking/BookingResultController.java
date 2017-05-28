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
import mypkg.model.BookingList;
import mypkg.model.City;
import mypkg.model.CityDao;
import mypkg.model.Data_terminal;
import mypkg.model.Data_terminalDao;
import mypkg.model.Member;
import mypkg.model.Schedule;
import mypkg.model.ScheduleDao;
import mypkg.model.pdrTicket;

	public class BookingResultController implements SuperController {

		@Override
		public void doProcess(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			this.getClass();

			HttpSession session =  request.getSession();
			
			Member loginfo = (Member)session.getAttribute("loginfo");
			
			String id = loginfo.getId();
			
			
			String start = request.getParameter("section1");
			String end = request.getParameter("section2");
			String c_code = start + "_" + end;
			
			ScheduleDao sdao = new ScheduleDao();
			Schedule schedule = sdao.SelectDataList(c_code);
			
			
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
				if(city.getCity_code().equals(c_code)){
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
						
			Data_terminal bean1 = new Data_terminal();
			
			System.out.println(airplane_name);
			System.out.println(b_code);
			System.out.println(c_code);
			System.out.println(id);
			System.out.println(sequenceNo);
			
			/*bean1.setAplane_name(airplane_name);
			bean1.setB_code(b_code);
			bean1.setC_code(c_code);
			bean1.setM_id(id);
			bean1.setS_sum(sequenceNo);*/
			
			dtdao.InsertData(bean1);
			
			/*BookingList bean2 = new BookingList();
			
			bean2.setB_code(b_code);
			bean2.setSeat_list(request.getParameter("seatlist"));*/
			
			//결과창 bean 입력 창
			pdrTicket bean = new pdrTicket();
			
			/*bean.setDate(date);
			bean.setDeptime(deptime);
			bean.setFlight(flight);
			bean.setFrom(from);
			bean.setGate(gate);
			bean.setName(name);
			bean.getSeat();
			bean.setTo(to);
			
			bean.setAirplane_name(airplane_name);
			bean.setArrival_time(arrival_time);
			bean.setDeparture_time(departure_time);
			bean.setDestination(destination);
			bean.setLocal(local);
			bean.setP_date(request.getParameter("startTerm"));*/
			
			request.setAttribute("bean", bean);
			
			String url = "/view/booking/bookingResultForm.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			System.out.println(dispatcher);
			dispatcher.forward(request, response);
		}

	}

