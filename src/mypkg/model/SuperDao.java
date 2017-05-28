package mypkg.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SuperDao {
	protected Connection conn = null;
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";//192.168.10.18 localhost
	private String id = "pandora";
	private String password = "oracle";
	
	protected Connection getConnection() {// 커넥션 객체를 구해주는 메소드		
		try {
			return DriverManager.getConnection(url, id, password);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}	
	public void closeConnection(){
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}			
		}
	}	
	public SuperDao() {// 드라이버 로딩
		try {
			Class.forName(driver);
			this.conn = getConnection();
			if (conn != null) {
				//System.out.println("얏따!");
			} else {
				System.out.println("똑바로 하시지 말입니다!");
			}
		} catch (ClassNotFoundException e) {
			System.out.println("오타 또는 jar 파일 위치 확인 요망");
			e.printStackTrace();
		}
	}
}
