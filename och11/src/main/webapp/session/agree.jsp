<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!-- JSP 페이지에 대한 설정: 사용 언어는 Java, 문서 형식은 HTML, 문자 인코딩은 UTF-8 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- HTML 문서의 헤더 정보: 문자 인코딩 UTF-8, 페이지 제목 설정 -->
</head>
<body>
<%
    // 사용자로부터 전송받은 파라미터(id, password, name)를 가져옴
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");

    // 가져온 파라미터 값을 세션에 저장 (사용자 식별 및 인증 정보 유지 목적)
	session.setAttribute("id", id);
	session.setAttribute("password", password);
	session.setAttribute("name", name);
%>
<h2>약관 동의</h2>
---------------------------------------------------------- <BR>
1. 회원 정보는 웹 사이트의 운영을 위해서만 사용됩니다.     <BR>
2. 웹 사이트의 정상 운영을 방해하는 회원은 탈퇴 처리합니다. <BR>
----------------------------------------------------------- <BR>
<form action="subscribe.jsp">
	<!-- 약관 동의 여부 입력 폼 -->
    <!-- 사용자가 동의 또는 거부를 선택할 수 있는 라디오 버튼 -->
	동의<input type="radio" name="agree" value="y"><p>
	거부<input type="radio" name="agree" value="n"><p>
    <!-- 확인 버튼. 사용자가 선택한 내용을 subscribe.jsp로 전송 -->
	<input type="submit" value="확인">
</form>
</body>
</html>
