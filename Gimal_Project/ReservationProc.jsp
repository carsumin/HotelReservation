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
<h2> 예약 정보 </h2>

<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="aDo" class="ReservationDB.ReservationDo">
	<jsp:setProperty property="*" name="aDo"/>
</jsp:useBean>

<jsp:useBean id="aDao" class="ReservationDB.ReservationDao" scope="application" />
<%
	aDao.insertReservation(aDo); //jspdb 데이터베이스의 reservation 테이블에 입력 값 저장.
%>
<table style="border-collapse:collapse" border="1">
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
</table>
<br>
<br>
<a style="text-decoration:none;" href="ReservationList.jsp"> 예약현황 보기 </a>
</center>
</body>
</html>