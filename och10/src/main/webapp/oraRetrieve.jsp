<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!-- 필요한 JDBC 관련 클래스를 임포트합니다. -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="dbError.jsp"%>
<!-- 페이지의 언어, 컨텐트 타입, 인코딩 설정 및 에러 발생 시 이동할 페이지 설정 -->

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
	// 사용자 입력 파라미터인 deptno(부서 번호)를 받아옵니다.
	String deptno = request.getParameter("deptno");

	// JDBC 드라이버, 데이터베이스 URL 설정
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";

	// SQL 조회 쿼리 문자열 생성
	String sql = "select * from dept where deptno=" + deptno;
	
	// JDBC 드라이버 로드 및 데이터베이스 연결
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, "scott", "tiger");

	// SQL 쿼리 실행을 위한 Statement 객체 생성
	Statement stmt = conn.createStatement();

	// SQL 쿼리 실행 후 결과 저장 (ResultSet 객체)
	ResultSet rs = stmt.executeQuery(sql);

	if (rs.next()) {
		// 조회 결과가 있으면, 결과 데이터를 request 객체에 속성으로 저장
		request.setAttribute("deptno", deptno);
		request.setAttribute("dname", rs.getString(2));
		request.setAttribute("loc", rs.getString(3));

		// 사용한 리소스 종료
		rs.close();
		stmt.close();
		conn.close();

		// 결과 데이터를 포함한 request 객체를 oraResult.jsp 페이지로 전달
		RequestDispatcher rd = request.getRequestDispatcher("oraResult.jsp");
		rd.forward(request, response);
	} else {
		// 조회 결과가 없으면, 사용한 리소스 종료
		stmt.close();
		conn.close();
	}
%>

<script type ="text/javascript">
	// 조회 결과가 없는 경우, 경고창을 띄우고 oraUpdate.html 페이지로 리디렉션
	alert("헐~ 없는 부서야");
	location.href = "oraUpdate.html";
</script>
</body>
</html>
