<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!-- JSP 페이지에서 사용될 JDBC 관련 클래스들을 임포트합니다. -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 페이지 지시자: 페이지의 언어, 컨텐트 타입, 인코딩을 설정합니다. -->

<!DOCTYPE html>
<!-- HTML5 문서 타입 선언 -->
<html>
<head>
<meta charset="UTF-8">
<!-- 문서의 문자 인코딩을 UTF-8로 설정 -->
<title>Insert title here</title>
<!-- 웹 페이지의 제목 설정 -->
</head>
<body>

<%
	// Home Work 1
	// 조건 1 : deptno를 가지고 dept 테이블을 조회하여 정보를 출력합니다.
	// 사용자 입력 파라미터인 deptno를 받아옵니다.
	String deptno = request.getParameter("deptno");

	// JDBC 드라이버, 데이터베이스 URL 설정
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";

	// SQL 쿼리 문자열. 입력받은 deptno를 이용하여 쿼리를 생성합니다.
	String sql = "select * from dept where deptno=" + deptno;
	
	// JDBC 드라이버 로드 및 데이터베이스 연결
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,"scott","tiger");

	// SQL 쿼리 실행을 위한 Statement 객체 생성
	Statement stmt = conn.createStatement();
	// SQL 쿼리를 생성할 때는 SQL 인젝션 공격을 방지하기 위해 PreparedStatement를 사용하는 것이 좋습니다.

	// SQL 쿼리 실행 후 결과를 ResultSet 객체에 저장
	ResultSet rs = stmt.executeQuery(sql);

	// ResultSet에서 데이터가 존재한다면 (부서 정보가 존재한다면)
	if (rs.next()) {
		// 부서명(dname)과 근무지(loc) 정보를 가져옵니다.
		String dname = rs.getString("dname"); // 또는 rs.getString(2);
		String loc = rs.getString(3);
		
		// 웹 페이지에 부서 정보를 출력합니다.
		out.println("부서코드 : " + deptno + "<p>");
		out.println("부서명 : " + dname + "<p>");
		out.println("근무지 : " + loc + "<p>");
	} else {
		// 해당 부서 정보가 없다면 메시지 출력
		out.println("그게 무슨 부서야 없는데");
	}

	// 사용한 리소스를 닫습니다.
	rs.close();
	stmt.close();
	conn.close();
%>

</body>
</html>
