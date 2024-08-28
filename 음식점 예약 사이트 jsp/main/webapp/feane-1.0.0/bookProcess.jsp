<%@page import="DAO.ReservationDAO"%>
<%@page import="VO.ReservationVO"%>
<%@page import="DAO.Menu11DAO"%>
<%@page import="VO.Menu11VO"%>
<%@page import="DAO.ReviewDAO"%>
<%@page import="java.security.Timestamp"%>
<%@page import="VO.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
	book.jsp에서 입력받은 데이터를 추출하여 디비에 저장
 --%> 
<%
	request.setCharacterEncoding("utf-8");
	


String id = request.getParameter("id");
// int deposit = Integer.parseInt(request.getParameter("deposit"));
int numGuests = Integer.parseInt(request.getParameter("numGuests"));
String reservation_date = request.getParameter("reservation_date");

	
	
	

	ReservationVO reservation = new ReservationVO (id, numGuests, reservation_date);
	ReservationDAO reservationDAO = new ReservationDAO();
	
	
	boolean isReservationInserted = reservationDAO.insertReservation(reservation);
	
	if (isReservationInserted) {
	
	
%> 
<script>
	alert('예약완료')
	location.href = "bookboard.jsp"
</script>  
<%
    } else {
%>
        <script>
            alert('그 날짜는 예약이 초과되었습니다.');
            location.href = "book.jsp"
        </script>
<%
    }
%>