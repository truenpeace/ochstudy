<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 페이지의 언어, 컨텐트 타입, 인코딩 설정 -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- JSTL 코어 라이브러리를 임포트합니다. 'c'는 JSTL 태그에 사용될 접두사입니다. -->

<!DOCTYPE html>
<!-- HTML5 문서 타입 선언 -->
<html>
<head>
<meta charset="UTF-8">
<!-- 문서의 문자 인코딩 설정 -->
<title>Insert title here</title>
<!-- 웹 페이지의 제목 설정 -->

<style type="text/css">
	/* CSS 스타일 정의: 테이블 행에 마우스를 올리면 배경색을 빨간색으로 변경 */
	tr:hover {
		background-color: red;
	}
</style>
</head>
<body>

<h2>EL표기법 + JSTL	Model 2 View</h2>
<!-- 페이지 제목 -->

<table width="100%" bgcolor="yellow" border="1">
	<!-- 테이블 생성, 폭은 100%, 배경색은 노란색, 테두리는 1 -->
	<tr bgcolor="pink">
		<!-- 테이블 헤더 행의 배경색을 분홍색으로 설정 -->
		<th>사번</th><th>이름</th><th>업무</th><th>급여</th>
		<!-- 테이블 헤더 정의: 사번, 이름, 업무, 급여 -->
	</tr>
	
	<c:forEach var="emp" items="${al}">
		<!-- JSTL의 forEach 태그를 사용하여 'al'이라는 이름의 리스트를 반복 처리 -->
		<!-- 각 반복마다 리스트의 아이템을 'emp'라는 변수에 할당 -->
		<tr>
			<!-- 테이블 행 생성 -->
			<td>${emp.empno}</td>
			<!-- EL을 사용하여 'emp' 객체의 'empno' 속성 값 출력 -->
			<td>${emp.ename}</td>
			<!-- EL을 사용하여 'emp' 객체의 'ename' 속성 값 출력 -->
			<td>${emp.job}</td>
			<!-- EL을 사용하여 'emp' 객체의 'job' 속성 값 출력 -->
			<td>${emp.sal}</td>
			<!-- EL을 사용하여 'emp' 객체의 'sal' 속성 값 출력 -->
		</tr>
	</c:forEach>
</table>

</body>
</html>
