<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<!-- 필요한 클래스들을 임포트합니다. -->

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

	<h2>스크립틀릿+PreparedStatement</h2>
	<!-- 페이지 제목 -->

<%
	// 사용자 입력 파라미터를 받아옵니다.
	int dno = Integer.parseInt(request.getParameter("dno"));
	String dname = request.getParameter("dname");
	String phone = request.getParameter("phone");
	String position = request.getParameter("position");
	
	// 데이터베이스 업데이트를 위한 SQL 쿼리 문자열 생성
	String sql = "update division set dname=?, phone=?, position=? where dno=?";
	
	// JNDI를 사용하여 DataSource를 조회합니다.
	Context init = new InitialContext();
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MySql");
	Connection conn = ds.getConnection();
	
	// PreparedStatement 객체 생성 및 파라미터 설정
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, dname);
	pstmt.setString(2, phone);
	pstmt.setString(3, position);
	pstmt.setInt(4, dno);
	
	// SQL 쿼리 실행 및 결과 처리
	int result = pstmt.executeUpdate();
	if (result > 0) out.println("수정 성공 ㅋㅋ");
	else out.println("수정 실패 ㅠㅠ");
	
	// 리소스 해제
	pstmt.close();
	conn.close();
%>

</body>
</html>
