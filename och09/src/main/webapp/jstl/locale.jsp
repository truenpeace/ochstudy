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
<h2>우리나라</h2>
	<fmt:setLocale value="ko_kr"/>
	금액: <fmt:formatNumber value="1000000" type="currency" /><br>
	일시: <fmt:formatDate value="${date}" type="both" dateStyle="full" timeStyle="full"/>
<!-- 우리나라
금액: ₩1,000,000
일시: 2024년 1월 19일 금요일 오전 11시 47분 19초 대한민국 표준시 -->

<h2>미국</h2>
	<fmt:setLocale value="en_us"/>
	금액: <fmt:formatNumber value="1000000" type="currency" /><br>
	일시: <fmt:formatDate value="${date}" type="both" dateStyle="full" timeStyle="full"/>
<!-- 미국
금액: $1,000,000.00
일시: Friday, January 19, 2024 at 11:47:19 AM Korean Standard Time -->

<h2>일본</h2>
	<fmt:setLocale value="ja_jp"/>
	금액: <fmt:formatNumber value="1000000" type="currency" /><br>
	일시: <fmt:formatDate value="${date}" type="both" dateStyle="full" timeStyle="full"/>
<!-- 일본
금액: ￥1,000,000
일시: 2024年1月19日金曜日 11時47分19秒 韓国標準時 -->
</body>
</html>