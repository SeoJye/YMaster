<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.vo.MemberVO" %>
<%
	if(session.getAttribute("memberVO") == null) {
		response.sendRedirect("login.jsp");
	}

	MemberVO mvo = (MemberVO) session.getAttribute("memberVO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>routeShareInsert</title>
</head>
<body>
<div align="right">
		<h4><%= mvo.getName()%>  <a href="logoutProc.jsp">logout</a> </h4>
	</div>
	<div align="center">
	<h2>경로 마스터</h2><hr>
		<h2> 새글 등록 </h2>
		
		<hr>
		<form action="routeShareInsertProc.jsp" method="post">
		<table border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td>제목</td>
				<td align="left"><input name="title" type="text"/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td align="left"><input name="password" type="text"/> 숫자 4자리 입력</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td align="left"><input name="writer" type="text"/>로그인한 이름 입력</td>
			</tr>
			<tr>
				<td>내용</td>
				<td align="left"><textarea  name="content" cols="40" rows="10"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"> <input type="submit" value="등록" />
				<input type="button" value="취소" onclick="location.href='routeShareList.jsp'"/></td>
			</tr>
			
		</table>
		</form>
		<hr>
	</div>
</body>

</html>