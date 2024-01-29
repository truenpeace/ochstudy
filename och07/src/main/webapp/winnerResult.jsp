<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- 페이지 언어와 인코딩 설정 -->
<!DOCTYPE html> <!-- HTML 문서 유형 선언 -->
<html>
<head>
<meta charset="UTF-8"> <!-- HTML 문서의 문자 인코딩 설정 -->
<title>Insert title here</title>
</head>
<body>
	<h2>scriptlet 우승자</h2>
	<%
		String[] win = (String[])request.getAttribute("winner"); // "winner"라는 이름으로 요청에서 속성을 가져와서 스트링 배열에 저장
		for (int i = 0; i < win.length; i++) { // 배열의 모든 요소를 순회
			out.println((i+1) + "등 : " + win[i]+"<p>"); // 각 우승자의 등수와 이름을 출력
		}
	%>
	<h2>EL 우승자</h2> <!-- EL을 사용한 우승자 섹션의 제목 -->
		1등 : ${winner[0] }<p> <!-- EL을 사용하여 첫 번째 우승자의 이름을 출력 -->
		2등 : ${winner[1] }<p> <!-- EL을 사용하여 두 번째 우승자의 이름을 출력 -->
		3등 : ${winner[2] }<p> <!-- EL을 사용하여 세 번째 우승자의 이름을 출력 -->
</body> <!-- 바디 섹션 종료 -->
</html> <!-- HTML 태그 종료 -->
