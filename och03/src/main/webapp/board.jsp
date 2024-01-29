
<%@page import="java.io.FileWriter"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% // 스크립 클립
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	//Current Date
	Date date = new Date();
	// 파일저장
	long fileName = date.getTime(); // 시간명으로 파일이름을 만듦
	// getRealPath --> Tomcat Metadata File 저장
	String real = application.getRealPath("/WEB-INF/out/"+fileName+".txt");
	System.out.println(real);
	// File 저장할 수 있는 객체
	FileWriter fw = new FileWriter(real); // 다이렉티브 = 디렉티브 = 지시자
	// File 내용
	String msg = "제목 : " + title + "\r\n"; // \r\n 캐리지 리턴(=줄바꿈)
	msg += "작성자 : " + writer + "\r\n";
	msg += "내용 : " + content + "\r\n";
	fw.write(msg);
	fw.close();
	
	/* 화면출력1 */
	out.println("제목1   : " + title + "<p>");
	out.println("작성자1 : " + writer + "<p>");
	out.println("작성일1 : " + date + "<p>");
	out.println("내용1   : " + content + "<p>");	

%>

<!-- 화면출력 2 -->
제목2 : <%=title %> <p>
작성자2 : <%=writer %> <p>
내용2 : <%=content %> <p>

</body>
</html>