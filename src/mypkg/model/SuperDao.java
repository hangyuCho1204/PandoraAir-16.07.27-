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
	
	protected Connection getConnection() {// Ŀ�ؼ� ��ü�� �����ִ� �޼ҵ�		
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
	public SuperDao() {// ����̹� �ε�
		try {
			Class.forName(driver);
			this.conn = getConnection();
			if (conn != null) {
				//System.out.println("���!");
			} else {
				System.out.println("�ȹٷ� �Ͻ��� ���Դϴ�!");
			}
		} catch (ClassNotFoundException e) {
			System.out.println("��Ÿ �Ǵ� jar ���� ��ġ Ȯ�� ���");
			e.printStackTrace();
		}
	}
}
