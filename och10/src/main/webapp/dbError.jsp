<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!--
    위의 지시자는 이 페이지가 Java 언어를 사용하는 JSP 페이지임을 명시합니다.
    contentType="text/html; charset=UTF-8"은 이 페이지의 컨텐츠 유형이 HTML이며 문자 인코딩은 UTF-8임을 명시합니다.
    pageEncoding="UTF-8"은 JSP 페이지 자체의 인코딩이 UTF-8임을 나타냅니다.
    isErrorPage="true"는 이 페이지가 에러 페이지로 사용됨을 나타냅니다.
-->

<% response.setStatus(200); %>
<!--
    위의 스크립트릿 코드는 HTTP 응답 상태를 200(OK)으로 설정합니다.
    일반적으로 에러 페이지는 상태 코드를 500(Internal Server Error) 등으로 설정하지만,
    여기서는 명시적으로 200(OK)으로 설정하고 있습니다.
-->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--
    HTML 문서의 기본 구조를 설정합니다.
    <meta charset="UTF-8">는 HTML 문서의 문자 인코딩이 UTF-8임을 명시합니다.
    <title>태그는 브라우저 탭에 표시될 페이지의 제목을 설정합니다. 현재는 'Insert title here'로 설정되어 있습니다.
-->
</head>
<body>
    <h2>DB Error</h2>
    <!--
        <h2> 태그는 HTML에서 두 번째로 큰 제목을 표시하는 태그입니다.
        여기서는 'DB Error'라는 텍스트를 페이지에 큰 글씨로 표시합니다.
    -->
    <%=exception.getMessage() %>
    <!--
        위의 표현식은 발생한 예외의 메시지를 출력합니다.
        이 페이지가 에러 페이지로 설정되었기 때문에, exception 객체가 자동으로 페이지에 포함됩니다.
        exception.getMessage()는 예외 상황의 세부 정보나 오류 메시지를 가져와 페이지에 표시합니다.
    -->
</body>
</html>
