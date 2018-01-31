package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DBConn {
	
	public Connection get_Conn() {
		Connection conn = null;
		try {
			//ALL_1 Driver Import
			Class.forName("com.mysql.jdbc.Driver");
			
			//ALL_2 Build Connection
			Properties prop = new Properties();
			prop.setProperty("user", "***user_name***");
			prop.setProperty("password", "***user_passwd***");

			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:***user_port***/***user_DB***", prop);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return conn;
	}	

}
