<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.dao.RouteShareDAO" %>
<%@ page import="ymaster.vo.RouteShareVO" %>
<%@ page import="ymaster.vo.MemberVO" %>
<%@ page import="java.util.List" %>    
<%
	if(session.getAttribute("memberVO") == null) {
		response.sendRedirect("login.jsp");
	}

	MemberVO mvo = (MemberVO) session.getAttribute("memberVO");
	
	RouteShareVO vo = new RouteShareVO();
	RouteShareDAO dao = new RouteShareDAO();
	List<RouteShareVO> routeshareList = dao.getRouteShareList();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>경로공유</title>
</head>
<body>
<div align="right">
		<h4><%= mvo.getName()%>  <a href="logoutProc.jsp">logout</a> </h4>
	</div>
	<div align="center">
	<h2>경로 마스터</h2><hr>
<form action="routeShareList.jsp" method="post">
<table border="1" cellpadding="0" cellspacing="0" width="700">
<tr>
<th bgcolor="pink" width="200">제목</th>
<th bgcolor="pink" width="150">작성자</th>
<th bgcolor="pink" width="150">등록일</th>
<th bgcolor="pink" width="100">조회수</th>
</tr>
<% for(RouteShareVO share : routeshareList) { %>
<tr align="center">
	<td ><a href="routeShareGet.jsp?seq=<%= share.getSeq() %>"><%= share.getTitle() %></a></td>
	<td><%= share.getWriter() %></td>
	<td><%= share.getRegdate() %></td>
	<td><%= share.getCnt() %></td>
</tr>
<tr>


<% } %>
<td colspan="5" align="center">
<input type="button" style="height:20pt;" value="새글작성" onclick="location.href='routeShareInsert.jsp'"/>
<input type="button" style="height:20pt;" value="뒤로가기" onclick="location.href='main.jsp'"/>
</td>
</tr>
</table>
</form>
<br>
</div>
</body>
</html>