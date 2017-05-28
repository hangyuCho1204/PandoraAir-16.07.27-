package mypkg.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ScheduleDao extends SuperDao {
	
	

	public int InsertData(Schedule bean) {
		System.out.println(bean.toString());
		String sql = "insert into schedule(aplane_name, city_code, p_date, departure_time,";
		sql += " arrival_time, lead_time)";
		sql += " values(?, ?, to_date(?, 'yyyy/MM/dd'), ?, ?, ?)";

		PreparedStatement pstmt = null;
		int cnt = -99999;
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			conn.setAutoCommit(false);
			pstmt = super.conn.prepareStatement(sql);
			// 개발자가 수정할 곳 2 : ? 수정할 것
			pstmt.setString(1, bean.getAplane_name());
			pstmt.setString(2, bean.getCity_code());
			pstmt.setString(3, bean.getP_date());
			pstmt.setString(4, bean.getDeparture_time());
			pstmt.setString(5, bean.getArrival_time());
			pstmt.setString(6, bean.getLead_time());

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

	public int UpdateData(Schedule bean) {
		System.out.println(bean.toString());
		String sql = " update Schedule set ";
		sql += " aplane_name=?, city_code=?, p_date=to_date(?, 'yyyy/MM/dd'), departure_time=?, arrival_time=?, lead_time=?";
		sql += " where sequence = ? ";
		PreparedStatement pstmt = null;
		int cnt = -99999;
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			conn.setAutoCommit(false);
			pstmt = super.conn.prepareStatement(sql);
			// 개발자가 수정할 곳 2 : ? 수정할 것
			pstmt.setInt(7, this.extractSeqnum(bean));
			pstmt.setString(1, bean.getAplane_name());
			pstmt.setString(2, bean.getCity_code());
			pstmt.setString(3, bean.getP_date());
			pstmt.setString(4, bean.getDeparture_time());
			pstmt.setString(5, bean.getArrival_time());
			pstmt.setString(6, bean.getLead_time());

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

	public int DeleteData(int pmkey) {
		String sql = "delete from schedule where sequence = ? ";
		PreparedStatement pstmt = null;
		int cnt = -99999;
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			conn.setAutoCommit(false);
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setInt(1, pmkey);
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

	public List<Schedule> SelectDataList() {
		// 모든 데이터를 조회한다.
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from Schedule order by sequence ";
		List<Schedule> lists = new ArrayList<Schedule>();
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Schedule bean = new Schedule();
				bean.setSequence(rs.getInt("sequence"));
				bean.setAplane_name(rs.getString("aplane_name"));
				bean.setArrival_time(rs.getString("arrival_time"));
				bean.setCity_code(rs.getString("city_code"));
				bean.setDeparture_time(rs.getString("departure_time"));
				bean.setLead_time(rs.getString("lead_time"));
				bean.setP_date(rs.getString("p_date"));
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
	
	public Schedule SelectDataList(String citycode) {
		// 모든 데이터를 조회한다.
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select * from schedule where city_code = ? ";
		Schedule bean = new Schedule();
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			conn.setAutoCommit(false);
			pstmt = super.conn.prepareStatement(sql);
			// 개발자가 수정할 곳 2 : ? 수정할 것
			pstmt.setString(1, citycode);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				bean.setSequence(rs.getInt("sequence"));
				bean.setAplane_name(rs.getString("aplane_name"));
				bean.setArrival_time(rs.getString("arrival_time"));
				bean.setCity_code(rs.getString("city_code"));
				bean.setDeparture_time(rs.getString("departure_time"));
				bean.setLead_time(rs.getString("lead_time"));
				bean.setP_date(rs.getString("p_date"));
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

		return bean;
	}
	
	public int extractSeqnum(Schedule bean){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from Schedule where aplane_name = ?, arrival_time=?, city_code =?, ";
		sql += "departure_time = ?, lead_time= ?, p_date =?";
		int cnt = -99999;
		
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			conn.setAutoCommit(false);
			pstmt = super.conn.prepareStatement(sql);
			// 개발자가 수정할 곳 2 : ? 수정할 것
			pstmt.setString(1, bean.getAplane_name());
			pstmt.setString(2, bean.getCity_code());
			pstmt.setString(3, bean.getP_date());
			pstmt.setString(4, bean.getDeparture_time());
			pstmt.setString(5, bean.getArrival_time());
			pstmt.setString(6, bean.getLead_time());

			cnt = pstmt.executeUpdate();
			conn.commit();
			
			bean.setSequence(rs.getInt("sequence"));
			
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
		
		return bean.getSequence();
	}
}
