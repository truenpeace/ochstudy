<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String[] color={"red", "orange", "yellow", "green", "blue", "navy", "violet"};
		request.setAttribute("color", color);
	%>
	<%-- <jsp:forward page="colorResult.jsp" /> --%>
	<%-- <jsp:forward page="colorResult2.jsp" /> --%>
	<jsp:forward page="colorResult3.jsp" />
</body>
</html>