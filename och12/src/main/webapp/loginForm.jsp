<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	background-color: pink;
}

tr {
	font-size: 24;
}
</style>
</head>
<body>
<h2>로그인</h2>
	<form action="loginPro.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" required="required"></td>
			</tr>
			<tr>
				<td>암호</td>
				<td><input type="password" name="passwd" required="required"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="확인">
				<input type="reset" value="취소"></td>
			</tr>
		</table>
	</form><p>
</body>
</html>