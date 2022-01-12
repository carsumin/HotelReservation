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
<h2> 예약하기 </h2>

<form action="ReservationProc.jsp" method="post">
	<table style="border-collapse:collapse" border="1">
		<tr height="60" align="center">
			<td width="100">이름</td>
			<td width="250"> <input type="text" name="name"></td>
		</tr>
		<tr height="60" align="center">
			<td width="100">전화번호</td>
			<td width="250"> <input type="text" name="tel"></td>
		</tr>
		<tr height="60" align="center">
			<td width="100">이메일</td>
			<td width="250"> <input type="text" name="email"></td>
		</tr>
		<tr height="60" align="center">
			<td width="100">성인</td>
			<td width="250"> 
				<select name="adult">
					<option value="1">1명</option>
					<option value="2">2명</option>
					<option value="3">3명</option>
					<option value="4">4명</option>
				</select>
			</td>
		</tr>
		<tr height="60" align="center">
			<td width="120">어린이<br>(8세 미만)</td>
			<td width="250"> 
				<select name="child">
					<option value="없음">없음</option>
					<option value="2">1명</option>
					<option value="3">2명</option>
				</select>
			</td>
		</tr>
		<tr height="60" align="center">
			<td width="100">룸 선택</td>
			<td width="250"> 
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
			<td width="250"> 
				<input style="text-align:center" type="text" name="checkin">
			</td>
		</tr>
		<tr height="60" align="center">
			<td width="100">체크아웃</td>
			<td width="250"> 
				<input style="text-align:center" type="text" name="checkout">
			</td>
		</tr>
		<tr height="60" align="center">
			<td colspan="2">
			 <input type="submit" value="예약">
			 <input type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>
</center>
</body>
</html>