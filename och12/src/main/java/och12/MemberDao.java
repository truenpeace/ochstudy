package och12;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//singleton + DBCF -> Memory 절감 + DOS(Denial of Service)공격 예방
public class MemberDao {
	private static MemberDao instance;
	private MemberDao() {
	}
	
	public static MemberDao getInstance() {
		if(instance == null) {
			instance = new MemberDao(); 
		}
		return instance;
	}
	
	private Connection getConnection() {
		Connection conn = null;
		
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			// e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	public int check(String id, String passwd) throws SQLException {
		int result = 0;
		Connection conn = null;
		String sql = "SELECT passwd FROM member2 WHERE id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			// id OK
			if (rs.next()) {
				String dbPasswd = rs.getString(1);
				if (dbPasswd.equals(passwd)) result = 1;
				else result = 0;
			} else result = -1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			// 지원 해제
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close(); 
			if (conn != null) conn.close();
		}
		return result;
	}
	
	public int insert(Member2 member2) throws SQLException {
		int result = 0;
		Connection conn = null;
		String sql = "INSERT INTO MEMBER2 VALUES(?, ?, ?, ?, ?, sysdate)";
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member2.getId());
			pstmt.setString(2, member2.getPasswd());
			pstmt.setString(3, member2.getName());
			pstmt.setString(4, member2.getAddress());
			pstmt.setString(5, member2.getTel());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		return result;
	}
	
	public List<Member2> list() throws SQLException {
		List<Member2> list = new ArrayList<Member2>();
		Connection conn = null;
		String sql = "SELECT * FROM member2";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					Member2 member = new Member2();
					member.setId(rs.getString(1));
					member.setPasswd(rs.getString(2));
					member.setName(rs.getString(3));
					member.setAddress(rs.getString(4));
					member.setTel(rs.getString(5));
					member.setReg_date(rs.getDate(6));
					list.add(member);
				} while (rs.next());
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) rs.close();
			if (conn != null) conn.close();
		}
		return list;
	}
	
	public Member2 select(String id) throws SQLException {
		Member2 member = new Member2();
		Connection conn = null;
		String sql = "SELECT * FROM member2 WHERE id = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member.setId(rs.getString(1));
				member.setPasswd(rs.getString(2));
				member.setName(rs.getString(3));
				member.setAddress(rs.getString(4));
				member.setTel(rs.getString(5));
				member.setReg_date(rs.getDate(6));			
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) rs.close();
			if (conn != null) conn.close();
		}
		return member;
	}
	
	public int delete(String id, String passwd) throws SQLException {
		int result = 0;
		Connection conn = null;
		
		result = check(id, passwd);
		if (result != 1) return result;
		String sql = "DELETE FROM member2 WHERE id=?";
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result;
	}
	
	// ID 중복 확인 메소드
	public int confirm(String id) throws SQLException {
		int result = 0;
		Connection conn = null;
		String sql = "SELECT id FROM member2 WHERE id = ?";	// SQL 쿼리 준비
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// 데이터베이스 연결 로직 (Connection 객체 획득)
			conn = getConnection(); // 데이터베이스 연결 로직
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();	// 쿼리 실행
			if (rs.next()) {	// 결과 처리
				result = 1; // ID가 이미 존재함
			} else {
				result = 0; // ID 사용 가능
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result;
	}
	
	public int update(Member2 member) throws SQLException {
		int result = 0;
		Connection conn = null;
		System.out.println("getId->"+member.getId());
		System.out.println("getName->"+member.getName());
		System.out.println("getAddress->"+member.getAddress());
		System.out.println("getTel->"+member.getTel());
		String sql = "UPDATE member2 set passwd=?, name=?, address=?, tel=? WHERE id = ?";
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPasswd());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getAddress());
			pstmt.setString(4, member.getTel());
			pstmt.setString(5, member.getId());
			result = pstmt.executeUpdate();
			System.out.println("result->"+result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		return result;
	}
}