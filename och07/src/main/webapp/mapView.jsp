<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- 페이지 언어와 인코딩 설정 -->
<!DOCTYPE html> <!-- HTML 문서 유형 선언 -->
<html> 
<head>
<meta charset="UTF-8"> <!-- HTML 문서의 문자 인코딩 설정 -->
<title>Insert title here</title>
</head> 
<body> 
		${param.NAME}의 주소는? ${ADDRESS[param.NAME]} <p> <!-- 요청 파라미터 "NAME"의 값과 해당 이름의 주소를 출력 -->
		<%-- ${ADDRESS.김동욱 } <p> --%>
		${ADDRESS["권도엽"]}<p> <!-- "권도엽"의 주소를 출력 -->
</body>
</html> 
