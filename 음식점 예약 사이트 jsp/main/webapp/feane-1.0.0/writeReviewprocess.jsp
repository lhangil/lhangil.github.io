<%@page import="DAO.ReviewDAO"%>
<%@page import="java.security.Timestamp"%>
<%@page import="VO.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	writeReivew.jsp에서 입력받은 데이터를 추출하여 디비에 저장
 --%> 
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String content  = request.getParameter("content");
	int rating = Integer.parseInt(request.getParameter("rating"));	
	
	System.out.println(id + " : " + content + rating);
	
	ReviewVO reviewVO = new ReviewVO(id, content,rating);	
	ReviewDAO reviewDAO = new ReviewDAO();
	reviewDAO.addReview(reviewVO);
	
	
	
	
%> 
<script>
	alert('리뷰작성완료')
	location.href = "reviewMain.jsp"
</script>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>