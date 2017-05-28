package mypkg.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Data_terminalDao extends SuperDao{

	public int InsertData(Data_terminal bean) {
		System.out.println(bean.toString());
		String sql = "insert into data_terminal(b_code, aplane_name, m_id, c_code, s_num)";
		sql += " values(?, ?, ?, ?, ?)";

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
			pstmt.setString(2, bean.getAplane_name());
			pstmt.setString(3, bean.getM_id());
			pstmt.setString(4, bean.getC_code());
			pstmt.setInt(5, bean.getS_sum());

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
	
	public int UpdateData(Data_terminal bean) {
		System.out.println(bean.toString());
		String sql = " update data_terminal set ";
		sql += " aplane_name=?, m_id=?, c_code=?, s_sum=?";
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
			pstmt.setString(5, bean.getB_code());
			pstmt.setString(1, bean.getAplane_name());
			pstmt.setString(2, bean.getM_id());
			pstmt.setString(3, bean.getC_code());
			pstmt.setInt(4, bean.getS_sum());


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
		String sql = "delete from data_terminal where b_code = ? ";
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

	public List<Data_terminal> SelectDataList() {
		// 모든 데이터를 조회한다.
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from data_terminal order by b_code ";
		List<Data_terminal> lists = new ArrayList<Data_terminal>();
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Data_terminal bean = new Data_terminal();
				bean.setB_code(rs.getString("b_code"));
				bean.setAplane_name(rs.getString("aplane_name"));
				bean.setM_id(rs.getString("m_id"));
				bean.setC_code(rs.getString("c_code"));
				bean.setS_sum(rs.getInt("s_sum"));
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
	
	
	public int SelectDataqty() {
		// 모든 데이터를 조회한다.
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select count(*) from DATA_TERMINAL ";
		int cnt = 0;
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				cnt = Integer.parseInt(rs.getString("count(*)"));
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

		return cnt;
	}
}
