<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.DriverManager"%>
<!-- JSP 페이지에서 사용될 java.sql 패키지의 클래스들을 임포트합니다. -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 페이지 지시자: 이 페이지가 Java를 사용하며, 컨텐트 타입과 페이지 인코딩 설정을 명시합니다. -->

<!DOCTYPE html>
<!-- HTML5 문서 타입 선언 -->

<html>
<head>
<meta charset="UTF-8">
<!-- 문서의 문자 인코딩을 UTF-8로 설정 -->

<title>Insert title here</title>
<!-- 웹 페이지 타이틀 설정 -->
</head>
<body>

<%
	// 데이터베이스 연결을 위한 설정 값 지정
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	
	// JDBC 드라이버 로드
	Class.forName(driver);
	
	// 데이터베이스 연결 시도
	Connection conn = DriverManager.getConnection(url, "scott", "tiger");
	// 보안상의 이유로, 실제 애플리케이션에서는 중요한 정보(예: 데이터베이스 URL, 사용자 이름, 비밀번호)를 코드에 직접 적는 것을 피해야 하며, 예외 처리를 적절히 추가하는 것이 좋습니다.
	
	// 연결 성공 여부에 따라 메시지 출력
	if (conn != null) out.println("연결 성공 ㅋㅋ");
	else              out.println("연결 실패");
	
	// 데이터베이스 연결 종료
	conn.close();
%>

</body>
</html>
