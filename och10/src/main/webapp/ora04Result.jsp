<%@page import="och10.Dept"%>
<!-- Dept 클래스를 임포트합니다. 이 클래스는 부서 정보를 저장하는데 사용됩니다. -->

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
<%
	// request 객체로부터 'dept'라는 이름으로 저장된 Dept 객체를 가져옵니다.
	Dept dept = (Dept)request.getAttribute("dept");
%>
<body>
<h2>Expression 부서정보</h2>
<!-- JSP 표현식을 사용하여 부서 정보를 출력하는 섹션 -->
부서코드 : <%=dept.getDeptno() %><p>
<!-- JSP 표현식을 사용하여 부서코드를 출력 -->
부서명 :	<%=dept.getDname() %><p>
<!-- JSP 표현식을 사용하여 부서명을 출력 -->
근무지 :	<%=dept.getLoc() %><p>
<!-- JSP 표현식을 사용하여 근무지를 출력 -->

<h2>EL 표기법 부서정보 (같은의미)</h2>
<!-- EL(Expression Language) 표기법을 사용하여 부서 정보를 출력하는 섹션 -->
부서코드 :	${dept.getDeptno() }<p>
<!-- EL 표기법을 사용하여 부서코드를 출력 -->
부서명 :	${dept.dname }<p>
<!-- EL 표기법을 사용하여 부서명을 출력. 'dept.dname'은 'dept.getDname()'와 동일한 의미입니다. -->
근무지 :	${dept.loc }<p>
<!-- EL 표기법을 사용하여 근무지를 출력. 'dept.loc'은 'dept.getLoc()'와 동일한 의미입니다. -->
</body>
</html>