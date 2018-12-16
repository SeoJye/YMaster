<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.dao.SchoolFoodDAO" %>
<%@ page import="ymaster.vo.SchoolFoodVO" %>
<%@ page import="ymaster.vo.MemberVO" %>
<%@ page import="java.util.List" %>   
<%@ page import="java.net.URLEncoder" %> 
<%
	if(session.getAttribute("memberVO") == null) {
		response.sendRedirect("login.jsp");
	}

	MemberVO mvo = (MemberVO) session.getAttribute("memberVO");
	SchoolFoodVO vo = new SchoolFoodVO();
	SchoolFoodDAO dao = new SchoolFoodDAO();
	
	List<SchoolFoodVO> locateList = dao.locateSchoolFoodList();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>
</head>
<body>
	<div align="right">
		<h4><%= mvo.getName()%>  <a href="logoutProc.jsp">logout</a> </h4>
	</div>
	<div align="center">
	<h2>학식 마스터</h2><hr>
<form action="foodList.jsp" method="post">
<table border="1" cellpadding="0" cellspacing="0" width="100">

<% for(SchoolFoodVO location : locateList) { %>
<tr align="center">
	<td >
	<%
		String loc = location.getLocation();

		loc = URLEncoder.encode(loc, "UTF-8");
					%>
	<a href="foodList.jsp?location=<%= loc %>"><%= location.getLocation() %></a>
	</td>
</tr>
<tr>
<% } %>
</tr>



</table>
</form>
<input type="button" style="height:20pt;" value="뒤로가기" onclick="location.href='main.jsp'"/>

</div>



</body>
</html>