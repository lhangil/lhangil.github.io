<%@page import="VO.userVO"%>
<%@page import="VO.emailVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="util.ConnectionFactory" %>    
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%--
	전체게시글 조회 순서
	1. 오라클의 t_board 테이블에서 게시글 조회 ==> JAVA
	2. <html> 화면에 게시글 출력
 --%>    
<%
	List<emailVO> boardList = new ArrayList<>();	
	userVO user = (userVO)session.getAttribute("userVO");
	
	
	String id = user.getId();
	
	StringBuilder sql = new StringBuilder();
	sql.append("select no,  sender, receiver, title, content, to_char(reg_date, 'yyyy-mm-dd') reg_date ");
	sql.append("  from email ");
	sql.append(" where receiver = ? ");
	sql.append(" order by no desc ");
	try(
		Connection conn = new ConnectionFactory().getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	) {
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int no = rs.getInt("no");
			
			String sender = rs.getString("sender");
			String receiver = rs.getString("receiver");
			String title = rs.getString("title");
			
			String content = rs.getString("content");
			String regDate = rs.getString("reg_date");
			
			emailVO board = new emailVO(no, sender, receiver,  title, content, regDate);
			boardList.add(board);
		}
		
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	// 공유영역 등록
	pageContext.setAttribute("boardList", boardList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/emailproject/resources/css/layout.css">
<link rel="stylesheet" href="/emailproject/resources/css/table.css">
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	
	$(document).ready(function() {
		$('#addBtn').click(function() {
			location.href = 'sendmailform.jsp'
		})
	})
	
	let goDetail = function(boardNo) {
		<c:if test="${ not empty userVO }">
			location.href = 'detail.jsp?no='+ boardNo
		</c:if>
			
		/*<c:if test="${ empty userVO }">
			if(confirm('로그인 후 사용가능합니다\n로그인페이지로 이동하시겠습니가?'))
				location.href = '/emailproject/login.jsp'
		</c:if> */
	}

	/*
	window.onload = function() {
		let btn = document.querySelector('#addBtn')
		btn.addEventListener('click', function() {
			location.href = 'writeForm.jsp'
		})
	}
	*/
</script>
</head>
<body>
	<header>
		<jsp:include page="/topmenu.jsp" />
	</header>
	<section>
		<div align="center">
		<br>
		<hr>
		<h2>받은메일함</h2>
		<hr>
		<br>
		<table border="1" style="width:100%;" class="listodd">
			<tr>
				<th width="7%">번호</th>
				<th>제목</th>
				<th width="17%">보낸사람</th>
				<th width="20%">받은날</th>
			</tr>
			<c:forEach items="${ boardList }" var="board">
				<tr>
					<td>${ board.no }</td>
					<td>
						<a href="javascript:goDetail(${ board.no })">
							<c:out value="${ board.title }"/>
						</a>
					
						<%-- <a onclick="goDetail()"><c:out value="${ board.title }"/></a> --%>
						<%-- 
						<a href="detail.jsp?no=${ board.no }">
							<c:out value="${ board.title }" />							
						</a> 
						--%>
					</td>
					<td>${ board.sender }</td>
					<td>${ board.regDate }</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<c:if test="${ not empty userVO }">
			<button id="addBtn">메일쓰기</button>
		</c:if>
	</div>
	</section>

</body>
</html>











