<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- JSP 페이지 설정. 페이지 언어는 Java, 내용 유형은 HTML, 문자 인코딩은 UTF-8로 설정 -->
<!DOCTYPE html> <!-- HTML5 문서 유형 선언 -->
<html>
<head>
<meta charset="UTF-8"> <!-- 웹 페이지의 문자 인코딩을 UTF-8로 설정 -->
<title>Insert title here</title>
</head>
<body>
	<h1>Form은 param 받음</h1> <!-- 제목(h1) 태그를 사용하여 텍스트 표시 -->
	첫번째 동물 : ${param.an1 }<br> <!-- "an1" 파라미터 값을 출력. <br> 태그로 줄바꿈 -->
	두번째 동물 : ${param.an2 }<br> <!-- "an2" 파라미터 값을 출력. <br> 태그로 줄바꿈 -->
	같은 	동물 : ${param.an1==param.an2 }<br> <!-- "an1"과 "an2" 파라미터 값이 같은지 비교한 결과를 출력. <br> 태그로 줄바꿈 -->
</body>
</html>
