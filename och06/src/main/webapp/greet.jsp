<%@page import="java.io.FileWriter"%> <!-- FileWriter 클래스를 가져옵니다. -->
<%@page import="java.io.PrintWriter"%> <!-- PrintWriter 클래스를 가져옵니다. -->
<%@page import="java.util.GregorianCalendar"%> <!-- GregorianCalendar 클래스를 가져옵니다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- 페이지의 언어, 컨텐츠 타입, 인코딩을 설정합니다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
		private PrintWriter pw; // PrintWriter 객체를 선언합니다.
		String date; // 날짜를 저장할 문자열을 선언합니다.

		public void jspInit() { // JSP 페이지가 초기화될 때 호출되는 메소드입니다.
			GregorianCalendar gc = new GregorianCalendar(); // 그레고리안 달력 객체를 생성합니다.
			date = String.format("%TF %TT", gc, gc); // 날짜와 시간을 문자열로 변환합니다.
			System.out.println("date->"+date); // 날짜를 출력합니다.
			String fileName = "c:/log/" + date.replaceAll(":", "") + ".txt"; // 파일 이름을 생성합니다. 시간 표시의 ':'를 공백으로 변경합니다.
			try {
				pw = new PrintWriter(new FileWriter(fileName, true)); // 파일에 문자를 쓰기 위한 PrintWriter 객체를 생성합니다.
			} catch (Exception e) { // 예외가 발생하면,
				e.printStackTrace(); // 예외의 스택 추적을 출력합니다.
				System.out.println("jspInit 헐 !"); // 에러 메시지를 출력합니다.
			}
		}
%>
<%
		String name = request.getParameter("name"); // 요청에서 "name" 파라미터를 가져옵니다.
		String msg = name + "님 방가워 "; // 인사 메시지를 생성합니다.
		out.println(msg + "<p> 현재시간 : " + date); // 메시지와 현재 시간을 출력합니다.
		pw.println(msg + "\r\n 현재시간 : " + date + "\r\n"); // 메시지와 현재 시간을 파일에 출력합니다.
%>
<%!
		public void jspDestroy() { // JSP 페이지가 종료될 때 호출되는 메소드입니다.
			System.out.println("jspDestroy start..."); // 메시지를 출력합니다.
			pw.flush();	// 버퍼에 남아있는 내용을 강제로 출력합니다.
			if (pw != null)	pw.close(); // PrintWriter 객체가 null이 아니면, 객체를 닫습니다.
		}
%>
</body>
</html>
