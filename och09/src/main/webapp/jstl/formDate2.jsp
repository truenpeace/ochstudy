<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<c:set var="date" value="<%=new Date() %>"></c:set>
<body>
	<h2>현재 날짜와 시간</h2>
	<fmt:formatDate value="${date}" type="both" dateStyle="short" timeStyle="short"/><p>
	<!-- 24. 1. 19. 오전 11:34 -->
	<fmt:formatDate value="${date}" type="both" dateStyle="medium" timeStyle="medium"/><p>
	<!-- 2024. 1. 19. 오전 11:34:06 -->
	<fmt:formatDate value="${date}" type="both" dateStyle="long" timeStyle="long"/><p>
	<!-- 2024년 1월 19일 오전 11시 34분 6초 KST -->
	<fmt:formatDate value="${date}" type="both" dateStyle="full" timeStyle="full"/>
	<!-- 2024년 1월 19일 금요일 오전 11시 34분 6초 대한민국 표준시 -->
</body>
</html>