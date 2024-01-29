<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<body>

	<h2>부서정보</h2>
	<!-- 페이지 제목 -->

	<p>부서코드 : ${dno }</p>
	<!-- 부서 코드를 표시. ${dno}는 request 객체의 속성 'dno'의 값을 표시합니다. -->

	<p>부서명 : ${dname }</p>
	<!-- 부서명을 표시. ${dname}는 request 객체의 속성 'dname'의 값을 표시합니다. -->

	<p>전화번호 : ${phone }</p>
	<!-- 전화번호를 표시. ${phone}은 request 객체의 속성 'phone'의 값을 표시합니다. -->

	<p>근무지 : ${position }</p>
	<!-- 근무지를 표시. ${position}은 request 객체의 속성 'position'의 값을 표시합니다. -->

</body>
</html>
