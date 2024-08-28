<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// db에서 리뷰데이터를 조회
//	List<ReviewVO> list = new ReviewDAO().getList();
//	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
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
    <h1>Register page</h1>
    <header>
        
        <h1>회원가입</h1>
	<form action="registerProcess.jsp" method="post" id="inputForm" name="inputForm">
		<h3>
			아이디: <input type="text" id="id" name="id" required>
			
		</h3>
		<br>

		<h3>
			이름: <input type="text" id="name" name="name" required>
		</h3>
		<br>

		<h3>
			이메일: <input type="email" id="email" name="email" required>
			
		</h3>
		<br>

		<h3>
			비밀번호: <input type="password" id="password" name="password" required>
		</h3>
		<br>

		<h3>
			전화번호: <input type="text" id="phone" name="phone">
		</h3>
		<br>
		<h3>
			<input type="submit" value="회원가입">
		</h3>
	</form>
        
       
    </header>
        <script>
        	/* const writeReviewButton = document.getElementById('writeReviewButton');
        	writeReviewButton.addEventListener('click', () => {
          //  window.location.href = '/restaurant/review/writeForm.do'; // 리뷰 작성 페이지 URL
            window.location.href = 'index.jsp '; // 리뷰 작성 페이지 URL
        	}); */
    </script>


        
        
</body>
</html>
