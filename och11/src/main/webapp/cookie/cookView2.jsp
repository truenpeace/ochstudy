<%@page import="java.net.URLDecoder"%> <%-- URLDecoder 클래스를 가져와서 URL 인코딩된 문자열을 디코드할 수 있게 함 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <%-- 페이지의 언어, 내용 유형, 문자 인코딩 설정 --%>
<!DOCTYPE html> <%-- HTML5 문서 유형 선언 --%>
<html>
<head>
<meta charset="UTF-8"> <%-- 문서의 문자 인코딩을 UTF-8로 설정 --%>
<title>Insert title here</title> <%-- 웹 페이지의 제목 설정 --%>
</head>
<body>
<%
	Cookie cooks[] = request.getCookies(); /* 웹 브라우저에서 전송된 쿠키들을 가져옴 */
	if(cooks != null) { /* 쿠키가 존재하는 경우 */
		for (int i=0; i<cooks.length; i++) { /* 모든 쿠키를 순회 */
			if(cooks[i].getName().equals("name")) { /* 쿠키의 이름이 "name"인 경우 */
				out.println("쿠키값 : " + URLDecoder.decode(cooks[i].getValue(), "utf-8"));
				/* 쿠키의 값을 UTF-8로 디코딩하여 화면에 표시 */
			}
		}
	}	
%>
</body>
</html>
