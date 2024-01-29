<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Bean 선언 -->
	<jsp:useBean id="person" class="och08.Person" scope="request" />
	
	<!-- 값 가져오기 -->
	<h2>personResult.jsp : 인적 사항</h2>
	이름 : <jsp:getProperty property="name" name="person"/><P>
	성별 : <jsp:getProperty property="gender" name="person"/><P>
	나이 : <jsp:getProperty property="age" name="person"/><P>
</body>
</html>