package mypkg.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookingList_Dao extends SuperDao{

	public int InsertData(BookingList bean) {
		System.out.println(bean.toString());
		String sql = "insert into bookinglist(b_code, seat_list)";
		sql += " values(?, ?)";

		PreparedStatement pstmt = null;
		int cnt = -99999;
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			conn.setAutoCommit(false);
			pstmt = super.conn.prepareStatement(sql);
			// 개발자가 수정할 곳 2 : ? 수정할 것
			pstmt.setString(1, bean.getB_code());
			pstmt.setString(2, bean.getSeat_list());

			cnt = pstmt.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			SQLException err = (SQLException) e;
			// getErrorCode() : 오라클 오류 상수가 리턴
			// 예 : not null 이면 1400
			cnt = -err.getErrorCode();
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}
	public List<BookingListJoin> SelectDataList(String name) {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;

		String sql = " select b.B_CODE, d.APLANE_NAME, d.M_ID, d.C_CODE,d.S_NUM, m.NAME,b.seat_list, a.CATEGORY, c.LOCAL, c.DESTINATION,s.P_DATE, s.DEPARTURE_TIME, s.ARRIVAL_TIME, s.LEAD_TIME, a.FARE, m.MPOINT "; 
			sql+=" from ((((bookinglist b inner join DATA_TERMINAL d ";
			sql+=" on b.b_code=d.b_code)join MEMBERS m ";
			sql+=" on d.m_id=m.id)join airplane a ";
			sql+=" on d.aplane_name=a.AIRPLANE) join schedule s ";
			sql+=" on d.S_NUM=s.SEQUENCE) join city c ";
			sql+=" on d.C_CODE=c.CITY_CODE";
		boolean adminSwitch = true;	
		
		//if(id==null || "".equals(id)) sql = "select rownum from dual";
		if(name!=null && name.equals("관리자")) {
			System.out.println("1"+name);
			adminSwitch=false;
		}else{
			System.out.println("2"+name);
			sql+=" where name = ? ";
		}
		System.out.println(sql);
		List<BookingListJoin> lists = new ArrayList<BookingListJoin>();
		Connection conn = null;
		try {
			if( conn == null ){ conn = super.getConnection() ; }
			pstmt = conn.prepareStatement(sql) ;
			
			if(!adminSwitch){
				
			}
			else{
				pstmt.setString(1, name);
			}
			rs = pstmt.executeQuery() ;			
			while( rs.next() ){
				BookingListJoin bean = new BookingListJoin();
				
				bean.setAplane_name(rs.getString("aplane_name"));
				bean.setArrival_time(rs.getString("arrival_time"));
				bean.setC_code(rs.getString("c_code"));
				bean.setCategory(rs.getString("category"));
				bean.setDeparture_tim(rs.getString("departure_time"));
				bean.setDestination(rs.getString("destination"));
				bean.setFare(rs.getString("fare"));
				bean.setLead_time(rs.getString("lead_time"));
				bean.setLocal(rs.getString("local"));
				bean.setM_id(rs.getString("m_id"));
				bean.setMpoint(rs.getString("mpoint"));
				bean.setName(rs.getString("name"));
				bean.setP_date(rs.getString("p_date"));
				bean.setS_num(rs.getString("s_num"));
				System.out.println(bean.toString());;
				lists.add( bean ) ;
				
			}
			for(BookingListJoin booking:lists){
				System.out.println(booking);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if( rs != null ){ rs.close(); }
				if( pstmt != null ){ pstmt.close(); }
			} catch (Exception e2) {
				e2.printStackTrace(); 
			}
		}
		
		return lists ;
	}

	public int SelectTotalCount() {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;				
		String sql = "select count(*) as cnt from bookinglist " ; 
		int cnt = -99999 ;
		try {
			if( this.conn == null ){ this.conn = this.getConnection() ; }			
			pstmt = this.conn.prepareStatement(sql) ;			 
			rs = pstmt.executeQuery() ; 
			
			if ( rs.next() ) { 
				cnt = rs.getInt("cnt");
			}
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally{
			try {
				if( rs != null){ rs.close(); } 
				if( pstmt != null){ pstmt.close(); } 
				this.closeConnection() ;
			} catch (Exception e2) {
				e2.printStackTrace(); 
			}
		} 		
		return cnt  ; 
	}
	
	public int UpdateData(BookingList bean) {
		System.out.println(bean.toString());
		String sql = " update bookinglist set ";
		sql += " seat_list=?";
		sql += " where b_code = ? ";
		PreparedStatement pstmt = null;
		int cnt = -99999;
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			conn.setAutoCommit(false);
			pstmt = super.conn.prepareStatement(sql);
			// 개발자가 수정할 곳 2 : ? 수정할 것
			pstmt.setString(2, bean.getB_code());
			pstmt.setString(1, bean.getSeat_list());


			cnt = pstmt.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			SQLException err = (SQLException) e;
			cnt = -err.getErrorCode();
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}

	public int DeleteData(String pmkey) {
		String sql = "delete from bookinglist where b_code = ? ";
		PreparedStatement pstmt = null;
		int cnt = -99999;
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			conn.setAutoCommit(false);
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setString(1, pmkey);
			cnt = pstmt.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			SQLException err = (SQLException) e;
			cnt = -err.getErrorCode();
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}

	public List<BookingList> SelectDataList() {
		// 모든 데이터를 조회한다.
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from bookinglist order by b_code ";
		List<BookingList> lists = new ArrayList<BookingList>();
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookingList bean = new BookingList();
				bean.setB_code(rs.getString("b_code"));
				bean.setSeat_list(rs.getString("seat_list"));
				lists.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return lists;
	}
}
