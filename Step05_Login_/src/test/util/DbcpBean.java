package test.util;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DbcpBean {
	// 필드
	private Connection conn;
	// 생성자
	public DbcpBean() {
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
			// Connection pool에서 Connection 객체 하나 가져오기!
			// 따라서 Connection 객체가 필요하면 new DbcpBean().getConn(); 하고 불러오면 된다.
			conn = ds.getConnection();
			System.out.println("Connection 얻어오기 성공!");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// Connection 객체를 리턴해주는 메소드
	public Connection getConn() {
		return conn;
	}
}
