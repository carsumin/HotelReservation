<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<h2> 로그인  </h2>

<form action="sessionLoginProc_res.jsp" method="post">
<table style="border-collapse:collapse" border="1">
	<tr height="60" align="center">
		<td width="100">아이디</td>
		<td width="200"><input type="text" name="userid"></td>
	</tr>
	<tr height="60" align="center">
		<td width="100">비밀번호</td>
		<td width="200"><input type="text" name="password"></td>
	</tr>
	<tr height="60" align="center">
		<td colspan="2">
			<input type="submit" value="확인"> &nbsp &nbsp &nbsp
			<input type="reset" value="취소">
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>