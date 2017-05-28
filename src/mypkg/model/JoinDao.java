package mypkg.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class JoinDao extends SuperDao{

	public List<Join> SelectJoin02() {
		PreparedStatement pstmt = null ;
		String sql = "select b.B_CODE, d.APLANE_NAME, d.M_ID, d.C_CODE,d.S_NUM, m.NAME, b.seat_list,";
		sql += " a.CATEGORY, c.LOCAL, c.DESTINATION,s.P_DATE, s.DEPARTURE_TIME, s.ARRIVAL_TIME, s.LEAD_TIME, a.FARE, m.MPOINT" ; 
		sql += " from ((((bookinglist b inner join DATA_TERMINAL d";
		sql += " on b.b_code=d.b_code)join MEMBERS m" ;
		sql += " on d.m_id=m.id)join airplane a" ;
		sql += " on d.aplane_name=a.AIRPLANE) join schedule s" ;
		sql += " on d.S_NUM=s.SEQUENCE) join city c" ;
		sql += " on d.C_CODE=c.CITY_CODE" ; 
		
		ResultSet rs = null ;
		List<Join> lists = new ArrayList<Join>();
		try {			
			if( conn == null ){ super.conn = super.getConnection() ; }
			pstmt = conn.prepareStatement( sql ) ;
			rs = pstmt.executeQuery() ;
			while( rs.next() ){
				Join join = new Join();
				join.setAirplane_name( rs.getString("airplane_name") );
				join.setArrival_time( rs.getString("arrival_time") );
				join.setB_code( rs.getString("b_code") );
				join.setC_code( rs.getString("c_code") );
				join.setCategory( rs.getString("category") );
				join.setDeparture_time( rs.getString("departure_time") );
				join.setDestination( rs.getString("destination") );
				join.setFare( rs.getInt("fare") );
				join.setLead_time( rs.getString("lead_time") );
				join.setLocal( rs.getString("local") );
				join.setM_id( rs.getString("m_id") );
				join.setMpoint( rs.getInt("mpoint") );
				join.setName( rs.getString("name") );
				join.setP_date( rs.getString("p_date") );
				join.setS_num( rs.getInt("s_num") );
				join.setSeat_list( rs.getString("seat_list") );
				lists.add( join ) ;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if( rs != null ){ rs.close(); }
				if( pstmt != null ){ pstmt.close(); }
				super.closeConnection(); 
			} catch (Exception e2) {
				e2.printStackTrace(); 
			}
		}		
		return lists ;
	}
}
