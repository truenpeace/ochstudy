<%@page import="java.sql.PreparedStatement"%>
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
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");

	// JDBC 드라이버, 데이터베이스 URL 설정
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";

	// SQL 삽입 쿼리 문자열 생성. '?'를 사용하여 파라미터를 동적으로 바인딩합니다.
	String sql = "insert into dept values (?,?,?)";
	System.out.println("sql->"+sql); // 생성된 쿼리를 콘솔에 출력 (디버깅 용도)

	// JDBC 드라이버 로드 및 데이터베이스 연결
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, "scott", "tiger");

	// PreparedStatement 객체 생성
	PreparedStatement pstmt = conn.prepareStatement(sql);

	// SQL 쿼리의 파라미터에 실제 값 바인딩
	pstmt.setInt(1, deptno);
	pstmt.setString(2, dname);
	pstmt.setString(3, loc);

	// SQL 쿼리 실행 후 결과 저장 (추가된 행의 수)
	int result = pstmt.executeUpdate();

	// 입력 성공 여부에 따라 메시지 출력
	if (result > 0) out.println("입력 성공 ㅋㅋ");
	else out.println("입력 실패 흑유흑유");

	// 사용한 리소스 종료
	pstmt.close();
	conn.close();
%>

</body>
</html>
