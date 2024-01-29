<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		try {
			int num1 = Integer.parseInt(request.getParameter("num1"));
			int num2 = Integer.parseInt(request.getParameter("num2"));
			out.println(num1 + " + " + num2 + " = " + (num1+num2)+"<p>");
			out.println(num1 + " - " + num2 + " = " + (num1-num2)+"<p>");
			out.println(num1 + " * " + num2 + " = " + (num1*num2)+"<p>");
			out.println(num1 + " / " + num2 + " = " + (num1/num2)+"<p>");
		} catch (NumberFormatException e) {
			out.println("연산결과 NumberFormatException JSP");
		} catch (ArithmeticException e) {
			out.println("시스템 점검중... JSP");
		// out.println("0으로 나누었어");
		} catch (Exception e) {
			out.println("JSP e.getMessage()->"+e.getMessage());
		}
	
%>

</body>
</html>