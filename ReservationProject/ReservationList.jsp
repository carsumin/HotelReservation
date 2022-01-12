<%@page import="ReservationDB.ReservationDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ReservationDB.ReservationDo"%>
<%@page import="Reservation.ReservationBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
    function searchCheck(frm){
        //검색
       
        if(frm.keyWord.value ==""){
            alert("검색 단어를 입력하세요.");
            frm.keyWord.focus();
            return;
        }
        frm.submit();      
    }
</script>
</head>
<body>

<jsp:useBean id="aDao" class="ReservationDB.ReservationDao" scope="application" />
<%	
	request.setCharacterEncoding("UTF-8");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	ArrayList<ReservationDo> v = aDao.getAllReservation(keyField, keyWord);
%>
<center>
<h2> 예약현황 </h2>
<br>
<a href="ReservationForm.jsp"> 추가 예약하기 </a>
<br><br>
<table border="1">
	<tr height="60" align="center">
		<td width="150"> 이름 </td>
		<td width="150"> 전화번호 </td>
		<td width="150"> 이메일 </td>
		<td width="150"> 성인 </td>
		<td width="150"> 유아 </td>
		<td width="150"> 룸 </td>
		<td width="150"> 체크인 </td>
		<td width="150"> 체크아웃 </td>
	</tr>	

<%
	for(int i=0; i<v.size(); i++)
	{
		ReservationDo aDo = v.get(i);
%>
	<tr height="60" align="center">
		<td width="150"> 
			<a style="text-decoration:none;" href="ReservationInfo.jsp?num=<%=aDo.getNum()%>"><%= aDo.getName() %></a>
		</td>
		<td width="150"> <%= aDo.getTel() %> </td>
		<td width="150"> <%= aDo.getEmail() %> </td>
		<td width="150"> <%= aDo.getAdult() %> </td>
		<td width="150"> <%= aDo.getChild() %> </td>
		<td width="150"> <%= aDo.getRoom() %> </td>
		<td width="150"> <%= aDo.getCheckin() %> </td>
		<td width="150"> <%= aDo.getCheckout() %> </td>
	</tr>
<%
	}
%>
</table>
  
     <tr>  
        <td colspan="7"> <br/>
            <form name="serach" method ="post">
            	이름으로 검색하기 :  
            <input type="text" name="keyWord" />
            <input type="button" value="검색" onclick="searchCheck(form)" />      
            </form>          
        </td>      
    </tr>

</center>
</body>
</html>