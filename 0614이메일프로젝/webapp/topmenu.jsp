<%@page import="VO.userVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table border="1" style="width: 100%">
	<tr>
		<td rowspan="2"><a href="/Mission-WEB">
				<div style="height: 45px; width: 200px; text-align: center">LOGO</div>
		</a></td>
		<td align="right"><c:if test="${ not empty userVO }">
				[${ userVO.name }(${ userVO.id })님으로 로그인중...]
			</c:if> <c:if test="${ empty userVO }">
				GUEST...v
			</c:if></td>
	</tr>
	<tr>
		<td><c:if test="${ not empty userVO }">
				<a href="/emailproject/sendmailform.jsp">메일보내기</a>
			</c:if> <c:if test="${ empty userVO }">
				<a href="/emailproject/register.jsp">회원가입</a>
			</c:if> | <c:if test="${ empty userVO }">
				<a href="/emailproject/login.jsp">로그인</a>
			</c:if> <c:if test="${ not empty userVO }">
				<a href="/emailproject/receivemail.jsp">받은메일</a>
			</c:if> | <c:if test="${ not empty userVO }">
				<a href="/emailproject/logout.jsp"> 로그아웃 </a>
			</c:if></td>
	</tr>
</table>
