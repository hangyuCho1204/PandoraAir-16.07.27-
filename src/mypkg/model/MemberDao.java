package mypkg.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDao extends SuperDao{

	public int InsertData(Member bean) {
		System.out.println(bean.toString());
		String sql = "insert into members(id, name, password, lnum, phone, email, mpoint)";
		sql += " values(?, ?, ?, ?, ?, ?, ?) ";

		PreparedStatement pstmt = null;
		int cnt = -99999;
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			conn.setAutoCommit(false);
			pstmt = super.conn.prepareStatement(sql);
			// 개발자가 수정할 곳 2 : ? 수정할 것
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getPassword());
			pstmt.setString(4, bean.getLnum());
			pstmt.setString(5, bean.getPhone());
			pstmt.setString(6, bean.getEmail());
			pstmt.setInt(7, bean.getMpoint());

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
	
	public int UpdateData(Member bean) {
		System.out.println(bean.toString());
		String sql = " update members set ";
		sql += " name=?, password=?, lnum=?,";
		sql += " phone=?, email=?";
		sql += " where id = ? ";
		PreparedStatement pstmt = null;
		int cnt = -99999;
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			conn.setAutoCommit(false);
			pstmt = super.conn.prepareStatement(sql);
			// 개발자가 수정할 곳 2 : ? 수정할 것
			pstmt.setString(6, bean.getId());
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getPassword());
			pstmt.setString(3, bean.getLnum());
			pstmt.setString(4, bean.getPhone());
			pstmt.setString(5, bean.getEmail());

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
		String sql = "delete from members where id = ? ";
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
	
	public List<Member> SelectDataList() {
		// 모든 데이터를 조회한다.
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from members order by name ";
		List<Member> lists = new ArrayList<Member>();
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Member bean = new Member();
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setPassword(rs.getString("password"));
				bean.setLnum(rs.getString("lnum"));
				bean.setPhone(rs.getString("phone"));
				bean.setEmail(rs.getString("email"));
				bean.setMpoint(rs.getInt("mpoint"));
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
	
	
	public Member SelectDataByPk(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * ";
		sql += " from members ";
		sql += " where id = ? ";
		Member bean = null;
		try {
			if (this.conn == null) {
				this.conn = this.getConnection();
			}
			pstmt = this.conn.prepareStatement(sql);
			// placehodelr 치환은 반드시 execute 메소드 실행 바로 직전에 하세요.
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 1 건이 발견됨
				bean = new Member();
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setPassword(rs.getString("password"));
				bean.setLnum(rs.getString("lnum"));
				bean.setPhone(rs.getString("phone"));
				bean.setEmail(rs.getString("email"));
				bean.setMpoint(rs.getInt("mpoint"));
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
