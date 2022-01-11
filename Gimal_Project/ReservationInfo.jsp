<%@page import="ReservationDB.ReservationDo"%>
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
<jsp:useBean id="aDao" class="ReservationDB.ReservationDao" scope="application"></jsp:useBean>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	ReservationDo aDo = aDao.getReservationOne(num);
%>

<h2> 예약 정보 보기 </h2>

<table border="1">
		<tr height="60" align="center">
			<td width="100">이름</td>
			<td width="200"><%= aDo.getName() %></td>
		</tr>
		<tr height="60" align="center">
			<td width="100">전화번호</td>
			<td width="200"><%= aDo.getTel() %></td>
		</tr>
		<tr height="60" align="center">
			<td width="100">이메일</td>
			<td width="200"><%= aDo.getEmail() %></td>
		</tr>
		<tr height="60" align="center">
			<td width="100">성인</td>
			<td width="200"><%= aDo.getAdult() %></td>
		</tr>
		<tr height="60" align="center">
			<td width="100">유아</td>
			<td width="200"><%= aDo.getChild() %></td>
		</tr>
		<tr height="60" align="center">
			<td width="100">룸</td>
			<td width="200"><%= aDo.getRoom() %></td>
		</tr>
		<tr height="60" align="center">
			<td width="100">체크인</td>
			<td width="200"><%= aDo.getCheckin() %></td>
		</tr>
		<tr height="60" align="center">
			<td width="100">체크아웃</td>
			<td width="200"><%= aDo.getCheckout() %></td>
		</tr>
		<tr height="60" align="center">
			<td colspan="2">
				<input type="button" value="수정하기" onclick="location.href='ReservationModify.jsp?num=<%=aDo.getNum()%>'">
				<input type="button" value="삭제하기" onclick="location.href='ReservationDelete.jsp?num=<%=aDo.getNum()%>'">
				<input type="button" value="목록보기" onclick="location.href='ReservationList.jsp?num=<%=aDo.getNum()%>'">
			</td>			
		</tr>
</table>
</center>
</body>
</html>