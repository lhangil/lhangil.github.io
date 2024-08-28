<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 세션 무효화
    session.invalidate();
    
    // 로그아웃 메시지 설정
    String msg = "성공적으로 로그아웃 되었습니다.";
    
    // 리다이렉트할 URL 설정 (메인 페이지로 리다이렉트)
    String url = "index.jsp";
    response.sendRedirect("/restaurant/feane-1.0.0/index.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
        alert('${ msg }');
   
    </script>

</body>
</html>