package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;

//DB연결을 위한 클래스 생성
public class JDBConnectHome {
	//멤버변수 : 연결, 쿼리문 실행 및 전송, 결과셋반환
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;

	//기본생성자 : 매개변수가 없는 생성자.
	public JDBConnectHome() {

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "musthave";
			String pw = "1234";
			//오라클 DB 연결
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("DB 연결 성공(기본 생성자)");
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		
		try {
			if(rs != null) rs.close(); 
			if(stmt != null) stmt.close(); 
			if(psmt != null) psmt.close(); 
			if(con != null) con.close(); 
			
			System.out.println("JDBC 자원 해제");
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public JDBConnectHome(String driver, String url, String id, String pwd) {
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,id,pwd);
			System.out.println("DB 연결 성공(인수 생성자 1)");
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public JDBConnectHome(ServletContext application) {
		/*
		JSP의 내장객체는 메서드에서는 즉시 사용할 수 없고 반드시
		매개변수로 참조값을 받은 후 사용해야한다.
		 */
		try {
			/* web.xml에 정의된 컨텍스트 초기화 파라미터를 직접
			얻어와서 드라이버로드 및 연결을 진행한다.*/
			String driver = application.getInitParameter("OracleDriver");
			Class.forName(driver);
			
			String url = application.getInitParameter("OracleURL");
			String id = application.getInitParameter("OracleId");
			String pwd = application.getInitParameter("OraclePwd");
			
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결 성공(인수 생성자 2)");
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
