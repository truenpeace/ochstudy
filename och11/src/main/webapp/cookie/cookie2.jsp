<%@page import="java.net.URLEncoder"%> <!-- java.net 패키지의 URLEncoder 클래스를 가져옴 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 페이지에 대한 설정: 언어는 Java, 내용 유형은 HTML, 문자 인코딩은 UTF-8 -->

<!DOCTYPE html> <!-- HTML5 문서 유형 선언 -->
<html>
<head>
<meta charset="UTF-8"> <!-- 문자 인코딩 설정 -->
<title>Insert title here</title> <!-- 웹 페이지 제목 설정 -->
</head>
<body>
<%
    // 쿠키 객체 생성: 'name'이라는 이름으로, '중앙정보'라는 값을 UTF-8로 URL 인코딩하여 쿠키에 저장
	Cookie cook2 = new Cookie("name", URLEncoder.encode("중앙정보","utf-8")); 
	response.addCookie(cook2); // 생성한 쿠키를 응답에 추가하여 클라이언트에게 전송
%>
쿠키저장 성공<p> <!-- 쿠키 저장 성공 메시지 출력 -->
<a href="cookView2.jsp">쿠키보기</a> <!-- '쿠키보기'라는 링크 제공, 클릭하면 cookView2.jsp 페이지로 이동 -->
</body>
</html>
