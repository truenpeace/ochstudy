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
		String[] winner = {"홍길동", "강감찬", "대조영"}; // 승자 배열 생성
		request.setAttribute("winner", winner); // 승자 배열을 "winner"라는 이름으로 요청에 추가
		RequestDispatcher rd =
				request.getRequestDispatcher("winnerResult.jsp"); // "winnerResult.jsp" 페이지로 요청을 전달할 RequestDispatcher 객체 생성
		rd.forward(request, response); // 요청과 응답을 "winnerResult.jsp" 페이지로 전달
%>
</body> 
</html> 
