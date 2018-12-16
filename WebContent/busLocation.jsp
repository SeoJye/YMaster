<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="ymaster.vo.BusLocationVO" %>
<%@ page import="ymaster.dao.BusLocationDAO" %>
<%@ page import="ymaster.vo.MemberVO" %>
<%
	if(session.getAttribute("memberVO") == null) {
		response.sendRedirect("login.jsp");
	}

	MemberVO mvo = (MemberVO) session.getAttribute("memberVO");	

	BusLocationDAO dao = new BusLocationDAO();
	List<BusLocationVO> blList = dao.getBusLocationList();
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
	<div align="center" style='line-height:170%'>
		<h2>버스 마스터</h2><hr>
		<h3>시내 셔틀 위치</h3><hr>
		
		<div align="center" style='line-height:170%'>
			<table border="1" cellpadding="0" cellspacing="0" width="200">
				<tr>
					<td width="160">용인대학교</td>
					<% for(BusLocationVO vo : blList) {
						if(vo.getLocation() == 1) { %>
							<td width="40" bgcolor='#ffffe0'><%= vo.getNumberPlate() %></td>
						<% }
					} %>
				</tr>
				<tr>
					<td width="160">진입로</td>
					<% for(BusLocationVO vo : blList) {
						if(vo.getLocation() == 2) { %>
							<td width="40 bgcolor='#ffffe0'"><%= vo.getNumberPlate() %></td>
						<% }
					} %>
				</tr>
				<tr>
					<td width="160">명지대사거리</td>
					<% for(BusLocationVO vo : blList) {
						if(vo.getLocation() == 3) { %>
							<td width="40 bgcolor='#ffffe0'"><%= vo.getNumberPlate() %></td>
						<% }
					} %>
				</tr>
				<tr>
					<td width="160">이약국</td>
					<% for(BusLocationVO vo : blList) {
						if(vo.getLocation() == 4) { %>
							<td width="40 bgcolor='#ffffe0'"><%= vo.getNumberPlate() %></td>
						<% }
					} %>
				</tr>
				<tr>
					<td width="160">용인시장</td>
					<% for(BusLocationVO vo : blList) {
						if(vo.getLocation() == 5) { %>
							<td width="40" bgcolor='#ffffe0'><%= vo.getNumberPlate() %></td>
						<% }
					} %>
				</tr>
				<tr>
					<td width="160">용인터미널</td>
					<% for(BusLocationVO vo : blList) {
						if(vo.getLocation() == 6) { %>
							<td width="40" bgcolor='#ffffe0'><%= vo.getNumberPlate() %></td>
						<% }
					} %>
				</tr>
				<tr>
					<td width="160">명지대사거리</td>
					<% for(BusLocationVO vo : blList) {
						if(vo.getLocation() == 7) { %>
							<td width="40" bgcolor='#ffffe0'><%= vo.getNumberPlate() %></td>
						<% }
					} %>
				</tr>
			</table>
		</div>
		<input type="button" style="width:20%; height:20pt;" value="메인으로" onclick="location.href='main.jsp'"/>
	</div>
</body>
</html>