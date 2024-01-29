<%@page import="och10.Emp"%>
<%@page import="java.util.ArrayList"%>
<!-- 필요한 클래스를 임포트합니다. 여기에는 'Emp' 클래스와 'ArrayList' 클래스가 포함됩니다. -->

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

<style type="text/css">
	<!-- CSS 스타일 정의: 테이블 행에 마우스를 올리면 배경색을 빨간색으로 변경 -->
	tr:hover {
		background-color: red;
	}
</style>
</head>
<body>
<h2>Model 1 View</h2>
<!-- 페이지 제목 -->

<%
	// request 객체로부터 'al'이라는 이름으로 저장된 ArrayList<Emp> 객체를 가져옵니다.
	ArrayList<Emp> al = (ArrayList<Emp>)request.getAttribute("al");
%>

<table width="100%" bgcolor="yellow"	border="1">
	<!-- 테이블 생성, 폭은 100%, 배경색은 노란색, 테두리는 1 -->
	<tr><th>사번</th><th>이름</th><th>업무</th><th>급여</th></tr>
	<!-- 테이블 헤더 정의: 사번, 이름, 업무, 급여 -->
	
	<%
		// ArrayList<Emp>의 각 요소(Emp 객체)에 대해 반복
		for(int i=0; i<al.size(); i++) {
			// 각 직원의 정보(사번, 이름, 업무, 급여)를 테이블의 행으로 출력
			out.println("<tr><td>"+al.get(i).getEmpno()+"</td>");
			out.println("<td>"+al.get(i).getEname()+"</td>");
			out.println("<td>"+al.get(i).getJob()+"</td>");
			out.println("<td>"+al.get(i).getSal()+"</td></tr>");
		}
	%>
</table>
</body>
</html>
