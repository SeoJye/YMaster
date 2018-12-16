<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.vo.MemberVO" %>
<%@ page import="ymaster.dao.MemberDAO" %>
<%@ page import="java.util.List" %>
<%
	if(session.getAttribute("memberVO") == null) {
		response.sendRedirect("login.jsp");
	}

	MemberVO mvo = (MemberVO) session.getAttribute("memberVO");
	
	MemberDAO dao = new MemberDAO();
	List<MemberVO> mList = dao.getMemberList();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>용인마스터</title>
</head>
<body>
	<div align="right">
		<h4><%= mvo.getName()%>  <a href="logoutProc.jsp">logout</a> </h4>
	</div>
	<div align="center">
		<h2>회원 목록</h2><hr>
			<table border="1" cellpadding="4" cellspacing="0" width="650">
				<tr align="center">
					<th bgcolor="ffaaaa" width="150">아이디</th>
					<th bgcolor="ffaaaa" width="300">비밀번호</th>
					<th bgcolor="ffaaaa" width="150">이름</th>
					<th bgcolor="ffaaaa" width="50">역할</th>
				</tr>
				<% for(MemberVO vo : mList) { %>
				<tr align="center">
					<td><%= vo.getId() %></td>
					<td><%= vo.getPassword() %></td>
					<td><%= vo.getName() %></td>
					<td><%= vo.getRole() %></td>
				</tr>
				<% } %>
			</table>
			<br>
			<input type="button" style="width:20%; height:20pt;" value="메인으로" onclick="location.href='adminMain.jsp'"/>
		</div>
</body>
</html>