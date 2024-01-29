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

	<h2>부서 정보 수정</h2>
	<!-- 페이지 제목 -->

	<form action="myUpdate.jsp">
		<!-- 수정된 데이터를 처리할 myUpdate.jsp로 폼 데이터를 전송 -->

		부서코드 : ${dno }<p>
		<!-- 부서 코드를 표시. ${dno}는 request 객체의 속성 'dno'의 값을 표시합니다. -->

		<input type="hidden" name="dno" value="${dno }">
		<!-- 부서 코드를 숨겨진 필드로 설정하여 폼 데이터에 포함 -->

		부서명 : <input type="text" name="dname" value="${dname }"><p>
		<!-- 부서명을 입력 받는 텍스트 필드. 기본값으로 ${dname} 설정 -->

		연락처 : <input type="text" name="phone" value="${phone }"><p>
		<!-- 연락처를 입력 받는 텍스트 필드. 기본값으로 ${phone} 설정 -->

		직급 : <input type="text" name="position" value="${position }"><p>
		<!-- 직급을 입력 받는 텍스트 필드. 기본값으로 ${position} 설정 -->

		<input type="submit" value="수정완료">
		<!-- 데이터 전송 버튼 -->

	</form>
</body>
</html>
