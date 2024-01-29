<%@page import="java.util.HashMap"%> <!-- java.util.HashMap 패키지를 가져옴 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- 페이지 언어와 인코딩 설정 -->
<!DOCTYPE html> <!-- HTML 문서 유형 선언 -->
<html>
<head>
<meta charset="UTF-8"> <!-- HTML 문서의 문자 인코딩 설정 -->
<title>Insert title here</title>
</head>
<body>
<%
		//						KEY		Value
		HashMap<String, String> map = new HashMap<String, String>(); // 새로운 HashMap 객체를 생성
		map.put("Park", "목동"); // "Park"이라는 키에 "목동"이라는 값을 맵에 추가
		map.put("권도엽", "신촌"); // "권도엽"이라는 키에 "신촌"이라는 값을 맵에 추가
		map.put("김동욱", "홍대"); // "김동욱"이라는 키에 "홍대"이라는 값을 맵에 추가
		map.put("안재준", "시드니"); // "안재준"이라는 키에 "시드니"이라는 값을 맵에 추가
		
		request.setAttribute("ADDRESS", map); // "ADDRESS"라는 이름으로 맵을 요청에 추가
		RequestDispatcher dispatcher =
				request.getRequestDispatcher("mapView.jsp?NAME=Park"); // "mapView.jsp?NAME=Park" 페이지로 요청을 전달할 RequestDispatcher 객체 생성
		dispatcher.forward(request, response); // 요청과 응답을 "mapView.jsp?NAME=Park" 페이지로 전달
%>
</body> <!-- 바디 섹션 종료 -->
</html> <!-- HTML 태그 종료 -->
