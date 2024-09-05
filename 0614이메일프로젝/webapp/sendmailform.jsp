<%@page import="VO.userVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/emailproject/resources/css/layout.css">
<link rel="stylesheet" href="/emailproject/resources/css/table.css">
<script src="./resources/jquery/jquery-3.7.1.min.js"></script>
<script>

	$(document).ready(function(){   //$(documente).ready는 html뿌려주고 가장먼저 자동으로 실행되게 하는 제이쿼리 함수.
		<c:if test="${ empty userVO }">// 그래서 if함수로 userVO가 비워져있으면  밑에 주소로 가게끔 함.
			location.href="/emailproject/index.jsp";
		</c:if>
		
	})
	let isNull = function(obj, msg) { //function 함수를 만들어줌 fucntion을 쓰면 if 문을 실행함.
		if(obj.value == '') {
			alert(msg)
			obj.focus()
			return true // obj.
		}
		return false
	}
	

	let checkForm = function() { //html 부분에서 onsubmit에서 checkForm을 호출함
		
		let f = document.inputForm //자바스크립트에서는 inputForm 값을 가져올대 예외적으로 document를 씀.
		
		if(f.title.value == '') {
			alert('제목을 입력해주세요')
			f.title.focus()
			return false
		}
		
		/* if(isNull(f.writer, '작성자를 입력해주세요'))
			 return false
		 */
		if(isNull(f.content, '내용을 입력해주세요')) 
			return false
			
		// 파일 확장자 체크 
		if(checkExt(f.attachfile1))
			return false
		if(checkExt(f.attachfile2))
			return false
		
		return true
	}
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
		<h2>메일쓰기</h2>
		<hr>
		<form name="inputForm" action="sendmail.jsp" method="post"
			  onsubmit="return checkForm()">
			<c:if test="${ not empty userVO }">
				<input type="hidden" name="sender" value="${ userVO.id }" >
			</c:if>
			<table style="width: 100%" border="1">
				<tr>
					<th width="25%">제목</th>
					<td>
						<input type="text" name="title" size="80">
					</td>
				</tr>
				<tr>
					<th width="25%">받는사람</th>
					<td>
<%-- 						<c:if test="${ not empty userVO }"> --%>
<%-- 						<c:out value="${ userVO.id }" /> --%>
<%-- 						</c:if> --%>
					<input type="text" name="receiver" size="80" > 
							
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="7" cols="80" name="content"></textarea>
					</td>
				</tr>
			
			</table>
			<br>
			<button type="submit">메일보내기</button>
		</form>
	</div>
	</section>
	
</body>
</html>











