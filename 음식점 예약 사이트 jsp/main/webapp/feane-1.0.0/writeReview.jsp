<%@page import="VO.user12VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    // 세션에서 로그인된 사용자 정보 가져오기
    user12VO user = (user12VO)session.getAttribute("user12VO");
    String id = user != null ? user.getId() : null;
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Write a Review</title>
    <style>
        body {
            font-family: sans-serif;
            margin: 0;
            padding: 0;
        }

        form {
            width: 500px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
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
</head>
    </style>
</head>
<body>
    <h1>새 리뷰 작성</h1>

    <form id="reviewform" action="writeReviewprocess.jsp" method="post">
        <label for="id">아이디:</label>
        <input type="text"  name="id" value="<%= id%>">
		
        <label for="review">리뷰 내용:</label>
        <textarea id="review" name="content" rows="5" required></textarea>
        <div class="star-rating">
	    <input type="radio" class="star" name="rating" value="1">
	    <input type="radio" class="star" name="rating" value="2">
	    <input type="radio" class="star" name="rating" value="3">
	    <input type="radio" class="star" name="rating" value="4">
	    <input type="radio" class="star" name="rating" value="5">
	 	 </div>
		
		<br>
        <button type="submit">등록</button>
    </form>

    <script>
    /*
        const form = document.querySelector('reviewform');
        form.addEventListener('submit', (event) => {
            event.preventDefault(); // 기본 제출 이벤트 방지

            const name = document.getElementById('name').value;
            const review = document.getElementById('review').value;

            // 리뷰 내용을 서버에 전송하는 로직 작성
            // 예: AJAX, fetch API 등을 사용하여 POST 요청 전송

            alert('리뷰가 등록되었습니다!');
        });
       */
    </script>
</body>
</html>
