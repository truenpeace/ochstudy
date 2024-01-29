<%@page import="och10.Dept"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!-- 필요한 클래스를 임포트합니다. 여기에는 JDBC 관련 클래스와 'Dept' 클래스가 포함됩니다. -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 페이지의 언어, 컨텐트 타입, 인코딩 설정 -->

<!DOCTYPE html>
<!-- HTML5 문서 타입 선언 -->
<html>
<head>
<meta charset="UTF-8">
<!-- 문서의 문자 인코딩 설정 -->
<title>Insert title here</title>
<!-- 웹 페이지의 제목 설정 -->
</head>
<body>
<!-- DTO(Data Transfer Object)와 DAO(Data Access Object)에 대한 설명 주석 -->
<%
	// 사용자 입력 파라미터인 deptno를 받아옵니다.
	String deptno = request.getParameter("deptno");

	// JDBC 드라이버, 데이터베이스 URL 설정
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";

	// SQL 쿼리 문자열 생성
	String sql = "select * from dept where deptno=" + deptno;
	
	// JDBC 드라이버 로드 및 데이터베이스 연결
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, "scott", "tiger");
	Statement stmt = conn.createStatement();

	// SQL 쿼리 실행 및 결과 저장
	ResultSet rs = stmt.executeQuery(sql);

	// DTO(Data Transfer Object) 인스턴스 생성
	Dept dept = new Dept();
	
	// ResultSet에서 데이터가 존재하는 경우 (부서 정보가 존재하는 경우)
	if (rs.next()) {
		int deptnoInt = (rs.getInt(1));
		String dname = rs.getString("dname"); // 또는 rs.getString(2);
		String loc = rs.getString(3);
		
		// 웹 페이지에 부서 정보 출력
		out.println("부서코드 : " + deptno + "<p>");
		out.println("부서명 : " + dname + "<p>");
		out.println("근무지 : " + loc + "<p>");
		
		// Dept 객체에 조회된 데이터 설정
		dept.setDeptno(deptnoInt);
		dept.setDname(dname);
		dept.setLoc(loc);
		
		// Dept 객체를 request 객체에 저장 (key: "dept")
		request.setAttribute("dept", dept);
	} else {
		// 해당 부서 정보가 없는 경우 메시지 출력
		out.println("그게 무슨 부서야 없는데");
	}

	// 사용한 리소스 종료
	rs.close();
	stmt.close();
	conn.close();
	
	// RequestDispatcher를 사용하여 ora04Result.jsp 페이지로 포워딩
	RequestDispatcher rd = request.getRequestDispatcher("ora04Result.jsp");
	rd.forward(request, response);
%>
</body>
</html>
