package mypkg.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AirplaneDao extends SuperDao{

	public int InsertData(Airplane bean) {
		System.out.println(bean.toString());
		String sql = "insert into airplane(airplane, category, seat_qty, fare, saving_point)";
		sql += " values(?, ?, ?, ?, ?) ";

		PreparedStatement pstmt = null;
		int cnt = -99999;
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			conn.setAutoCommit(false);
			pstmt = super.conn.prepareStatement(sql);
			// 개발자가 수정할 곳 2 : ? 수정할 것
			pstmt.setString(1, bean.getAirplane());
			pstmt.setString(2, bean.getCategory());
			pstmt.setInt(3, bean.getSeat_qty());
			pstmt.setInt(4, bean.getFare());
			pstmt.setInt(5, bean.getSaving_point());
			

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
	
	public int UpdateData(Airplane bean) {
		System.out.println(bean.toString());
		String sql = " update airplane set ";
		sql += " category=?, seat_qty=?, fare=?, saving_point=?";
		sql += " where airplane = ? ";
		PreparedStatement pstmt = null;
		int cnt = -99999;
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			conn.setAutoCommit(false);
			pstmt = super.conn.prepareStatement(sql);
			// 개발자가 수정할 곳 2 : ? 수정할 것
			pstmt.setString(7, bean.getAirplane());
			pstmt.setString(1, bean.getCategory());
			pstmt.setInt(2, bean.getSeat_qty());
			pstmt.setInt(3, bean.getFare());
			pstmt.setInt(4, bean.getSaving_point());

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
		String sql = "delete from airplane where airplane = ? ";
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
	
	public List<Airplane> SelectDataList() {
		// 모든 데이터를 조회한다.
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from airplane order by airplane ";
		List<Airplane> lists = new ArrayList<Airplane>();
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Airplane bean = new Airplane();
				bean.setAirplane(rs.getString("airplane"));
				bean.setCategory(rs.getString("category"));
				bean.setSeat_qty(rs.getInt("seat_qty"));
				bean.setFare(rs.getInt("fare"));
				bean.setSaving_point(rs.getInt("saving_point"));
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
	
	public Airplane SelectDataByPk(String pmkey) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * ";
		sql += " from airplane ";
		sql += " where airplane = ? ";
		Airplane bean = null;
		try {
			if (this.conn == null) {
				this.conn = this.getConnection();
			}
			pstmt = this.conn.prepareStatement(sql);
			// placehodelr 치환은 반드시 execute 메소드 실행 바로 직전에 하세요.
			pstmt.setString(1, pmkey);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 1 건이 발견됨
				bean = new Airplane();
				bean.setAirplane(rs.getString("airplane"));
				bean.setCategory(rs.getString("category"));
				bean.setSeat_qty(rs.getInt("seat_qty"));
				bean.setFare(rs.getInt("fare"));
				bean.setSaving_point(rs.getInt("saving_point"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				this.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return bean;
	}
}
