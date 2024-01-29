<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!-- JDBC 데이터베이스 연결을 위해 필요한 클래스를 임포트합니다. -->

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
	// MySQL JDBC 드라이버 및 데이터베이스 URL 설정
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/scottdb?serverTimezone=UTC";

	// JDBC 드라이버 로드
	Class.forName(driver);

	// 데이터베이스 연결을 위한 Connection 객체 생성
	Connection conn = DriverManager.getConnection(url, "root", "mysql80!@#");

	// 연결 상태에 따라 메시지 출력
	if (conn != null) out.println("mysql 연결 성공");
	else out.println("mysql 연결 실패");

	// 사용한 리소스 종료
	conn.close();
%>

</body>
</html>
