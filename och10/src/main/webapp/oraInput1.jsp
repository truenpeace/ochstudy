<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!-- 필요한 JDBC 관련 클래스를 임포트합니다. -->

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
	// 요청(request)의 문자 인코딩을 UTF-8로 설정합니다.
	request.setCharacterEncoding("utf-8");

	// 사용자 입력 파라미터인 deptno(부서 번호), dname(부서명), loc(위치)를 받아옵니다.
	String deptno = request.getParameter("deptno");
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");

	// JDBC 드라이버, 데이터베이스 URL 설정
	String driver = "oracle.jdbc.driver.OracleDriver";
	// 여러 데이터베이스 URL 예시가 주석 처리되어 있습니다. 실제 사용할 URL은 아래와 같습니다.
	String url = "jdbc:oracle:thin:@172.30.1.69:1521:xe";

	// SQL 삽입 쿼리 문자열 생성 (String.format을 사용하여 동적으로 쿼리 생성)
	String sql = String.format("Insert into dept values (%s, '%s', '%s')", deptno, dname, loc);
	System.out.println("sql->"+sql); // 생성된 쿼리를 콘솔에 출력 (디버깅 용도)

	// JDBC 드라이버 로드 및 데이터베이스 연결
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, "scott", "tiger");

	// SQL 쿼리 실행을 위한 Statement 객체 생성
	Statement stmt = conn.createStatement();

	// SQL 쿼리 실행 후 결과 저장 (추가된 행의 수)
	int result = stmt.executeUpdate(sql);

	// 입력 성공 여부에 따라 메시지 출력
	if (result > 0) out.println("입력 성공 ㅋㅋ");
	else out.println("입력 실패 흑유흑유");

	// 사용한 리소스 종료
	stmt.close();
	conn.close();
%>

</body>
</html>
