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
<h2>스크립틀릿 + Statement 부서 삭제 Hw2</h2>
<!-- 페이지 제목 -->

<%
	// JDBC 드라이버, 데이터베이스 URL 설정
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";

	// 사용자 입력 파라미터인 deptno를 받아옵니다.
	String deptno = request.getParameter("deptno");

	// SQL 삭제 쿼리 문자열 생성
	String sql = "delete from dept where deptno=" + deptno;
	
	// JDBC 드라이버 로드 및 데이터베이스 연결
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, "scott", "tiger");

	// SQL 쿼리 실행을 위한 Statement 객체 생성
	Statement stmt = conn.createStatement();

	// SQL 쿼리 실행 후 결과 저장(삭제된 행의 수)
	int result = stmt.executeUpdate(sql);

	// 삭제 성공 여부에 따라 메시지 출력
	if (result > 0) out.println("삭제 성공 ㅎㅎ");
	else out.println("삭제실패 ㅠㅠ");

	// 사용한 리소스 종료
	stmt.close();
	conn.close();
%>

</body>
</html>
