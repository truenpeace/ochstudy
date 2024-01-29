package och11;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

//DB CRUD 관련된 DML 처리 Logic
public class MemberDao {
	// 1. 선언(Member 변수)
	Connection conn = null;
	
	// DBCP
	private Connection getUserConn() throws SQLException {
		
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			// 2. 선언 된 것을 가지고 연결
			conn = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	public int insert(MemberDto member) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MEMBER1 VALUES(?, ?, ?, sysdate)";
		
		try {
			// 3. 진짜 conn을 얻기 위해 한번은 반드시 실행
			conn = getUserConn();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// e.printStackTrace(); 테스트에만 사용, 분위기가 심각해질 수 있으니 마지막에는 뺀다
			System.out.println(e.getMessage());
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		return result;	
	}
	// insert Method 생성
	// getUserConn 사용
	// parameter --> MemberDto
	// return -> int
	// PreparedStatement
}
