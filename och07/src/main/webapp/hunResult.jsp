<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>1부터 100까지 합			Scriptlet+Expression</h2>
<%
	String sum = request.getAttribute("sum").toString();
// 이 부분은 Java 코드입니다.
// 여기서는 요청 객체(request)에서 "sum"이라는 속성을 가져와 문자열로 변환하고,
// 이를 "sum"이라는 변수에 저장하고 있습니다.
%>
<%=sum %><p>
</body>
</html>