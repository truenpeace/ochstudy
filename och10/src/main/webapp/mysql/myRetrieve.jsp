<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!-- JDBC와 관련된 클래스를 임포트합니다. -->

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
	// 사용자 입력 파라미터인 dno(부서 번호)를 받아옵니다.
	String dno = request.getParameter("dno");	
	
	// MySQL JDBC 드라이버 및 데이터베이스 URL 설정
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/scottdb?serverTimezone=UTC";

	// SQL 조회 쿼리 문자열 생성
	String sql = "select * from division where dno=" + dno;

	// JDBC 드라이버 로드 및 데이터베이스 연결
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,"root","mysql80!@#");

	// SQL 쿼리 실행을 위한 Statement 객체 생성
	Statement stmt = conn.createStatement();

	// SQL 쿼리 실행 후 결과 저장 (ResultSet 객체)
	ResultSet rs = stmt.executeQuery(sql);

	if (rs.next()) {
		// 조회 결과가 있으면, 결과 데이터 추출
		request.setAttribute("dno", dno);
		request.setAttribute("dname", rs.getString(2)); // 부서명
		request.setAttribute("phone", rs.getString(3)); // 전화번호
		request.setAttribute("position", rs.getString(4)); // 직급

		// ResultSet, Statement, Connection 종료
		rs.close();
		stmt.close();
		conn.close();

		// 결과 페이지(myResult.jsp)로 리다이렉트
		RequestDispatcher rd = request.getRequestDispatcher("myResult.jsp");
		rd.forward(request, response);
	} else {
		// 결과가 없는 경우, 사용한 리소스 종료
		stmt.close();
		conn.close();

		// 사용자에게 알림을 보내고, 'myUpdate.html'로 리디렉션
		%>
		<script type="text/javascript">
			alert("헐~ 없는 부서야");
			location.href = "myUpdate.html";
		</script>
		<%
	}
%>

</body>
</html>
