<%@ page import="DAO.user12DAO"%>
<%@ page import="VO.user12VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String phone = request.getParameter("phone");
//	int reservation_count = Integer.parseInt(request.getParameter("reservation_count"));
	
	 // 역할은 고정으로 'user'를 설정
	
	user12VO member = new user12VO (id, name, email, password, phone);
	user12DAO memberDAO = new user12DAO();
	memberDAO.register(member);
%>
<script>
	alert('회원가입 완료')
	location.href = "index.jsp"
</script>
		