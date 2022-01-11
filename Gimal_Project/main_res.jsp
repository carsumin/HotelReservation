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
	String center = request.getParameter("center");

	if(center == null)
	{
		center = "center_res.jsp";
	}

%>

<center>
<table style="border-collapse:collapse" width="800" border="1">
	<!--  top -->
	<tr height="150">
		<td align="center" colspan="2">
			<jsp:include page="sessionTop_res.jsp"/>
		</td>
	</tr> 
	
	<!-- left/center -->
	<tr height="300">
		<td align="center" width="100">
			<jsp:include page="left_res.jsp"/>
		</td>
		<td align="center" width="100">
			<jsp:include page="<%=center %>"/>
		</td>
	</tr>
	
	<!--  bottom -->
	<tr height="100">
		<td align="center" colspan="2">
			<jsp:include page="bottom_res.jsp"/>
		</td>
	</tr>	
</table>
</center>
</body>
</html>