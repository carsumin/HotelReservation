<%@page import="ReservationDB.ReservationDo"%>
<%@page import="Reservation.ReservationBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="aDao" class="ReservationDB.ReservationDao" scope="application" />

<%
	int num = Integer.parseInt(request.getParameter("num"));
	ReservationDo aDo = aDao.getReservationOne(num);
%>

<center>
<h2> 예약현황 수정 </h2>
<hr>
<form action="ReservationModifyProc.jsp" method="post">
	<table border="1">
		<tr height="60" align="center">
			<td width="100">이름</td>
			<td width="200"> <input type="text" name="name" value="<%=aDo.getName() %>"></td>
		</tr>
		<tr height="60" align="center">
			<td width="100">전화번호</td>
			<td width="200"> <input type="text" name="tel" value="<%=aDo.getTel() %>"></td>
		</tr>
		<tr height="60" align="center">
			<td width="100">이메일</td>
			<td width="200"> <input type="text" name="email" value="<%=aDo.getEmail() %>"></td>
		</tr>
		<tr height="60" align="center">
			<td width="100">성인</td>
			<td width="200"> 
				<select name="adult">
					<option value="1">1명</option>	
					<option value="2">2명</option>
					<option value="3">3명</option>
					<option value="4">4명</option>
				</select>		
			</td>
		</tr>
		<tr height="60" align="center">
			<td width="100">유아</td>
			<td width="200"> 
				<select name="child">
					<option value="없음">없음</option>
					<option value="2">1명</option>
					<option value="3">2명</option>
				</select>
			</td>
		</tr>
		<tr height="60" align="center">
			<td width="100">룸</td>
			<td width="200"> 
				<select name="room">
					<option value="스탠다드">스탠다드</option>
					<option value="디럭스">디럭스</option>
					<option value="스위트">스위트</option>
					<option value="싱글">싱글</option>
					<option value="더블">더블</option>
					<option value="패밀리">패밀리</option>
				</select>
			</td>
		</tr>
		<tr height="60" align="center">
			<td width="100">체크인</td>
			<td width="200"> 
				<input type="text" name="checkin" value="<%=aDo.getCheckin() %>">
			</td>
		</tr>
		<tr height="60" align="center">
			<td width="100">체크아웃</td>
			<td width="200"> 
				<input type="text" name="checkout" value="<%=aDo.getCheckout() %>">
			</td>
		</tr>
		<tr height="60" align="center">
			<td colspan="2">
			<input type="hidden" name="num" value="<%=aDo.getNum() %>">
			 <input type="submit" value="수정하기">
			 <input type="button" value="목록보기" onclick="location.href='ReservationList.jsp?num=<%=aDo.getNum()%>'">
			</td>
		</tr>
	</table>
</form>
</center>
</body>
</html>