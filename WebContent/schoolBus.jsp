<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.dao.MemberDAO" %>
<%@ page import="ymaster.vo.MemberVO" %>

 <%
	if(session.getAttribute("memberVO") == null) {
		response.sendRedirect("login.jsp");
	}
 
	MemberVO mvo = (MemberVO) session.getAttribute("memberVO");
	MemberVO vo = new MemberVO();
	MemberDAO dao = new MemberDAO();
 %>
 <%@ page import = "java.io.PrintWriter" %>
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
	<h3>버스 마스터</h3><hr>
		<form>
			<input type="button"  value ="시내 셔틀 위치" onclick = "location.href='busLocation.jsp'"> <br>
			<input type="button"  value ="시내/시외 셔틀 시간표" onclick = "location.href='busSchedule.jsp'"> <br>
			<input type="button"  value ="메인으로" onclick = "location.href='main.jsp'">
		</form>
	</div>
</body>
</html>