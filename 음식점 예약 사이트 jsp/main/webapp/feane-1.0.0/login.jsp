<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<h1>로그인</h1>
<form action="loginProcess.jsp" method="post">
    <h3>아이디: <input type="text" id="id" name="id" required></h3>
    <br>
    
    <h3>비밀번호: <input type="password" id="password" name="password" required></h3>
    <br>
    
    <button>로그인</button>
</form>

   

</body>
</html>