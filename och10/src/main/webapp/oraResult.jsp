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
<body>

<h2>부서 정보 수정</h2>
<!-- 제목: 부서 정보 수정 -->

<form action="oraUpdate.jsp">
	<!-- 수정된 데이터를 oraUpdate.jsp 페이지로 전송하는 폼 -->
	
	부서코드 : ${deptno}
	<!-- EL 표현식을 사용하여 부서 코드를 출력. 사용자는 부서코드를 수정할 수 없음 -->
	<p>
	
	<input type="hidden" name="deptno" value="${deptno}">
	<!-- 부서 코드를 숨겨진 필드로 전송. 폼 제출 시 함께 전송됩니다. -->

	부서명 : <input type="text" name="dname" value="${dname}">
	<!-- 부서명 입력 필드. 기존의 부서명이 value 속성을 통해 입력 필드에 표시됨 -->
	<p>
	
	근무지 : <input type="text" name="loc" value="${loc}">
	<!-- 근무지 입력 필드. 기존의 근무지가 value 속성을 통해 입력 필드에 표시됨 -->
	<p>
	
	<input type="submit" value="수정완료">
	<!-- 수정 완료 버튼 -->
</form>

</body>
</html>
