<%@page import="DAO.ReservationDAO"%>
<%@page import="VO.ReservationVO"%>
<%@page import="DAO.ReviewDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@page import="VO.user12VO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="VO.ReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
/*
ReservationVO book = (ReservationVO)session.getAttribute("ReservationVO");
int reservation_id = book.getReservation_id();
*/
	// 세션에서 로그인한 사용자 ID 가져오기
	String id = (String) session.getAttribute("user12.id");
	boolean isManager = "manager".equals(id);

	if (id == null) {
        // 로그인하지 않은 경우 로그인 페이지로 리다이렉트
        response.sendRedirect("login.jsp");
        return;
    }
	
	
	ReservationDAO bookDao = new ReservationDAO();
	List<ReservationVO> bookList = bookDao.getReservationsByUserId(id);
	
		
	
	request.setAttribute("bookList", bookList);	


// db에서 리뷰데이터를 조회
//	List<ReviewVO> list = new ReviewDAO().getList();
//	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약 확인 화면</title>
    <style>
        body {
            font-family: sans-serif;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #f2f2f2;
            padding: 20px;
            text-align: center;
        }

        h1 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .testimonials {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .testimonial {
            width: 300px;
            margin: 20px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .testimonial-author {
            font-weight: bold;
            margin-bottom: 10px;
        }

        .testimonial-content {
            line-height: 1.5;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="./feane-1.0.0/css/styles.css">
</head>
<body>
    <div class="navbar">
        <a href="index.jsp">Home</a>
        <a href="menu.jsp">Menu</a>
        <a href="review.jsp">Review</a>
        <a href="register.jsp">Register</a>
        <a href="book.jsp">Book</a>
    </div>
    <h1>Review Page</h1>
    <header>
        <h1>예약 확인 화면</h1>
        
    </header>
       <!--  <script>
        	const writeReviewButton = document.getElementById('writeReviewButton');
        	writeReviewButton.addEventListener('click', () => {
          //  window.location.href = '/restaurant/review/writeForm.do'; // 리뷰 작성 페이지 URL
            window.location.href = 'writeReview.jsp '; // 리뷰 작성 페이지 URL
        	});
    </script> -->
<%--  <%
        // DAO를 사용하여 리뷰 데이터를 가져옵니다.
        ReservationDAO bookDAO = new ReservationDAO();
        List<ReservationVO> reservationList = bookDAO.getAllReservations();
        // 공유 영역에 리뷰 데이터를 설정합니다.
        pageContext.setAttribute("list", reservationList);
    %> --%>

   		 
   		 
   	<div class="testimonials">
        <c:forEach var="reservation" items="${bookList}" varStatus="stat">
            <div class="testimonial">
                <p class="testimonial-author">${stat.count}번 예약</p>
                
                <p class="testimonial-content">예약자 아이디: ${reservation.id}</p>
  				<p class="testimonial-content">인원: ${reservation.numGuests}</p>
  				<p class="testimonial-content">예약날짜:${reservation.reservation_date}</p>
  				<form action="cancelReservation.jsp" method="post">
            	<%-- <input type="hidden" name="reservation_id" value="${reservation.reservation_id}">
           	 	 <% if (isManager) { %> --%>
                    <form action="cancelReservation.jsp" method="post">
                        <input type="hidden" name="reservation_id" value="${reservation.reservation_id}">
                        <input type="submit" value="예약 취소">
                    </form>
           	 	<%-- <% } %> --%>
        		</form>
  					          
            </div>
        </c:forEach>
    </div>
        
</body>
</html>
