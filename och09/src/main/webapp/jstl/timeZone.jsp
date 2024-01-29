<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<c:set var="date" value="<%=new Date()%>"></c:set>

<body>
서울: <fmt:formatDate value="${date}" type="both" /><br>
<!-- 서울: 2024. 1. 19. 오후 12:09:34 -->

<fmt:timeZone value="Asia/Hong_Kong">
	홍콩: <fmt:formatDate value="${date}" type="both"/><br>
</fmt:timeZone>
<!-- 홍콩: 2024. 1. 19. 오전 11:09:34 -->

<fmt:timeZone value="Europe/London">
	런던: <fmt:formatDate value="${date}" type="both"/><br>
</fmt:timeZone>
<!-- 런던: 2024. 1. 19. 오전 3:09:34 -->

<fmt:timeZone value="America/New_York">
	뉴욕: <fmt:formatDate value="${date}" type="both"/><br>
</fmt:timeZone>
<!-- 뉴욕: 2024. 1. 18. 오후 10:09:34 -->

</body>
</html>