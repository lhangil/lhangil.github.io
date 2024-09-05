<%@ page import="DAO.userDAO"%>
<%@ page import="VO.userVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String email = request.getParameter("email");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	 // 역할은 고정으로 'user'를 설정
	
	userVO member = new userVO(email, id, password, name, address, phone);
	userDAO memberDAO = new userDAO();
	memberDAO.register(member);
	%>
<script>
	alert('회원가입 완료')
	location.href = "login.jsp"
</script>
		
	
		
	
		
<!-- 		 세션등록 -->
<!-- 		session.setAttribute("userVO", member); -->
	
	
	

