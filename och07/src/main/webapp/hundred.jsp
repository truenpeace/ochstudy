<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSP 페이지 설정. 페이지 언어는 Java, 내용 유형은 HTML, 문자 인코딩은 UTF-8로 설정 -->
<!DOCTYPE html>
<!-- HTML5 문서 유형 선언 -->
<html>
<head>
<meta charset="UTF-8">
<!-- 웹 페이지의 문자 인코딩을 UTF-8로 설정 -->
<title>Insert title here</title>
</head>
<body>
	<%
	int sum = 0; // 변수 sum을 선언하고 0으로 초기화
	for (int i = 1; i <= 100; i++) { // 1부터 100까지 반복
		sum += i; // 각 숫자를 sum에 더함
	}

	request.setAttribute("sum", sum); // 요청 객체에 "sum"이라는 이름으로 sum 값을 저장

	// RequestDispatcher rd = request.getRequestDispatcher("hunResult.jsp"); // 주석 처리된 코드. "hunResult.jsp" 페이지로 요청을 전달하는 RequestDispatcher를 생성
	RequestDispatcher rd = request.getRequestDispatcher("hunResultEL.jsp"); // "hunResultEL.jsp" 페이지로 요청을 전달하는 RequestDispatcher를 생성
	rd.forward(request, response); // 요청과 응답을 "hunResultEL.jsp" 페이지로 전달
	%>
</body>
</html>
