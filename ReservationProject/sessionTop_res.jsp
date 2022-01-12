<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String logout = request.getParameter("logout");
	if(logout != null) //logout에 값이 들어있으면
	{
		//로그아웃을 했기때문에, id=null을 설정
		session.setAttribute("id", null);
		session.setMaxInactiveInterval(0);
	}
	
	String id = (String)session.getAttribute("id");
	if(id == null)
	{
		id = "손님";
	}
%>
<center>
<table style="border-collapse:collapse" width="800">
	<tr height="100">
		<td align="center" colspan="4">
			<font size="16"> Hotel Seoul </font>
		</td>
	</tr>
	<tr height="50">
		<td width="130" align="center"> 
<%
	if(id.equals("손님")){
%>
	<%=id %> <input type="button" value="로그인"
	onclick="location.href='main_res.jsp?center=sessionLogin_res.jsp'"> 
<%		
	}
	else{
%>
	<%=id %>님<input type="button" value="로그아웃"
	onclick="location.href='main_res.jsp?logout=1'">
<%
	}
%>	
				
	</td>
	</tr>
</table>
</center>
</body>
</html>