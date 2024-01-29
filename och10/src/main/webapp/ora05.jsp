<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="och10.Emp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!-- 필요한 클래스를 임포트합니다. 여기에는 JDBC 관련 클래스, 'Emp' 클래스, 그리고 'ArrayList' 클래스가 포함됩니다. -->

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

<%
	// JDBC 드라이버, 데이터베이스 URL 설정
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";

	// SQL 쿼리 문자열 생성
	String sql = "select empno, ename, job, sal from emp";
	
	// JDBC 드라이버 로드 및 데이터베이스 연결
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, "scott", "tiger");

	// Emp 객체를 저장할 ArrayList 생성
	ArrayList<Emp> al = new ArrayList<Emp>();

	// SQL 쿼리 실행을 위한 Statement 객체 생성
	Statement stmt = conn.createStatement();

	// SQL 쿼리 실행 및 결과 저장
	ResultSet rs = stmt.executeQuery(sql);

	// ResultSet에서 데이터를 읽어와 Emp 객체에 저장하고, 이를 ArrayList에 추가
	if (rs.next()) {
		do {
			Emp emp = new Emp();
			emp.setEmpno(rs.getInt(1));
			emp.setEname(rs.getString(2));
			emp.setJob(rs.getString(3));
			emp.setSal(rs.getInt(4));
			al.add(emp);
		} while(rs.next());
		// ArrayList를 request 객체에 저장 (key: "al")
		request.setAttribute("al", al);

		// 사용한 리소스 종료
		rs.close();
		stmt.close();
		conn.close();

		// RequestDispatcher를 사용하여 ora05Result2.jsp 페이지로 포워딩
		RequestDispatcher rd = request.getRequestDispatcher("ora05Result2.jsp");
		rd.forward(request, response);
	} else {
		// 데이터가 없는 경우 메시지 출력
		out.println("데이터가 없습니다");
		stmt.close();
		conn.close();
	}
%>

</body>
</html>
