<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.ReservationDAO" %>
<%@ page import="VO.ReservationVO" %>

<%
// 예약 취소 처리할 예약 ID를 받아옵니다.

request.setCharacterEncoding("utf-8");
System.out.println("jsp 호출 : "+request.getParameter("reservation_id"));
int reservation_id = Integer.parseInt(request.getParameter("reservation_id"));
System.out.println("cancelREservation.jsp 에서 호출 : "+reservation_id);
// 예약 DAO를 이용해 데이터베이스에서 예약을 삭제합니다.
ReservationDAO reservationDAO = new ReservationDAO();
boolean success = reservationDAO.cancelReservation(reservation_id);

if (success) {
    // 예약 취소 성공 메시지를 출력합니다.
    out.println("<script>alert('예약이 취소되었습니다.'); window.location.href='bookboard.jsp';</script>");
} else {
    // 예약 취소 실패 시 메시지를 출력합니다.
    out.println("<script>alert('예약 취소에 실패하였습니다.'); window.history.back();</script>");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>