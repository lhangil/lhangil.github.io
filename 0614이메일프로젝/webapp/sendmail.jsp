<%@page import="VO.userVO"%>
<%@page import="DAO.emailDAO"%>
<%@page import="VO.emailVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

// 세션에서 현재 로그인한 사용자 정보 가져오기
userVO user = (userVO)session.getAttribute("userVO");
if (user == null) {
    response.sendRedirect("/emailproject/login.jsp");
    return;
}

String id = request.getParameter("id");
String sender = request.getParameter("sender"); 
String receiver = request.getParameter("receiver");
String title = request.getParameter("title");
String content = request.getParameter("content");

/* emailVO board = new emailVO( sender, receiver, title, content, regDate); */
emailVO board = new emailVO(); 

board.setSender(sender);
board.setReceiver(receiver);
board.setTitle(title);

board.setContent(content);
emailDAO emailDao = new emailDAO();
emailDao.insertBoard(board);
%>

<script>
	alert('이메일 전송 완료')
	location.href = "sendmailform.jsp"
</script>
<!-- 순서 -->
<!-- 1.board로 request에 있는 정보를 다 받고 insertBoard로 데이터베이스에 넣음.  -->
<!-- 2.writeform 으로 html에서 정보를 write.jsp로 넘겨주고, wwirte.jsp에서 데이터베이스로 정보를 넣음 -->
<!-- 3.receivedmailbox로 다시 html에 정보를 띄움. -->