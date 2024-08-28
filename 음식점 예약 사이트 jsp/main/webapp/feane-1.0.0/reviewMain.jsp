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
List<ReviewVO> boardList = new ArrayList<>();	
user12VO user = (user12VO)session.getAttribute("user12VO");
String userid = user.getId();
request.setAttribute("userid", userid);

// 리뷰 삭제 요청 처리
String action = request.getParameter("action");
if ("delete".equals(action)) {
    int reviewNo = Integer.parseInt(request.getParameter("no"));
    ReviewDAO reviewDAO = new ReviewDAO();
    boolean result = reviewDAO.deleteReview(reviewNo);
    if (result) {
        out.println("<script>alert('리뷰가 성공적으로 삭제되었습니다.'); location.href='reviewMain.jsp';</script>");
    } else {
        out.println("<script>alert('리뷰 삭제에 실패했습니다.'); history.back();</script>");
    }
}	

StringBuilder sql = new StringBuilder();
sql.append("select no,  id, reservation_id, rating, content, to_char(review_date, 'yyyy-mm-dd') review_date ");
sql.append("  from review ");
sql.append(" where id = ? ");
sql.append(" order by no desc ");
try(
	Connection conn = new ConnectionFactory().getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
) {
	pstmt.setString(1, userid);
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()) {
		int no = rs.getInt("no");
		String id = rs.getString("id");
		String content = rs.getString("content");
		
		int rating =rs.getInt("rating");
		
		ReviewVO board = new ReviewVO();
		board.setNo(no);
		board.setId(id);
		board.setContent(content);
		
		board.setRating(rating);
		
		
		
		boardList.add(board);
	}
	
} catch(Exception e) {
	e.printStackTrace();
}

// 공유영역 등록
pageContext.setAttribute("boardList", boardList);	


// db에서 리뷰데이터를 조회
//	List<ReviewVO> list = new ReviewDAO().getList();
//	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 화면</title>
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
                 <style>
    .star-rating {
      display: flex;
    }

    .star {
      appearance: none;
      padding: 1px;
    }

    .star::after {
      content: '☆';
      color: hsl(60, 80%, 45%);
      font-size: 20px;
    }

    .star:hover::after,
    .star:has(~ .star:hover)::after,
    .star:checked::after,
    .star:has(~ .star:checked)::after {
      content: '★';
    }

    .star:hover ~ .star::after {
      content: '☆';
    }
  </style>
    </style>
    <link rel="stylesheet" type="text/css" href="styles.css">
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
        <h1>리뷰</h1>
        <button id="writeReviewButton">새 리뷰 작성</button>
    </header>
        <script>
        	const writeReviewButton = document.getElementById('writeReviewButton');
        	writeReviewButton.addEventListener('click', () => {
          //  window.location.href = '/restaurant/review/writeForm.do'; // 리뷰 작성 페이지 URL
            window.location.href = 'writeReview.jsp '; // 리뷰 작성 페이지 URL
        	});
    </script>
 <%
      // DAO를 사용하여 리뷰 데이터를 가져옵니다.
      ReviewDAO reviewDAO = new ReviewDAO();
      List<ReviewVO> reviewList = reviewDAO.getAllReviews();
      // 공유 영역에 리뷰 데이터를 설정합니다.
      pageContext.setAttribute("list", reviewList);
      
        
      
  %>

   		 
   		 
   		 <div class="testimonials">
        <c:forEach var="review" items="${list}">
            <div class="testimonial">
                <p class="testimonial-author">${review.id}</p>
                <p class="testimonial-content">${review.content}</p>
            	<div class="star-rating">
                    <c:forEach begin="1" end="5" var="i">
                        <input type="radio" class="star" value="${i}" <c:if test="${i == review.rating}">checked</c:if> disabled>
                    </c:forEach>
                </div>
				 <p class="testimonial-content">${review.review_date}</p>
				  <c:if test="${userid eq 'admin'}">
                    <form  method="post">
                        <input type="hidden" name="action" value="delete" />
                        <input type="hidden" name="no" value="${review.no}" />
                        <input type="submit" value="리뷰 삭제" />
                    </form>
                </c:if>
            </div>
        </c:forEach>
    </div>
        
</body>
</html>
