<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.dao.SchoolFoodDAO" %>
<%@ page import="ymaster.vo.SchoolFoodVO" %>
<%@ page import="ymaster.vo.MemberVO" %>
<%@ page import="java.util.List" %>    
<%
	if(session.getAttribute("memberVO") == null) {
		response.sendRedirect("login.jsp");
	}

	MemberVO mvo = (MemberVO) session.getAttribute("memberVO");
	
	String location = request.getParameter("location");
	System.out.println(location);
	SchoolFoodVO vo = new SchoolFoodVO();
	vo.setLocation(location);
	
	SchoolFoodDAO dao = new SchoolFoodDAO();
	SchoolFoodVO locate = dao.getSchoolFood(vo);
	
	List<SchoolFoodVO> foodList = dao.getlocationList(vo);
	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학식메뉴</title>
</head>
<body>
	<div align="right">
		<h4><%= mvo.getName()%>  <a href="logoutProc.jsp">logout</a> </h4>
	</div>
	<div align="center">
	<h2>학식 마스터</h2><hr>
<h3> <%=locate.getLocation()%>메뉴<br> </h3>


<table border="1" cellpadding="0" cellspacing="0" width="700">
	<tr>
		<th bgcolor="pink" width="80">요일</th>
		<th bgcolor="pink" width="80">시간</th>
		<th bgcolor="pink" width="500">메뉴</th>
	</tr>

<% for(SchoolFoodVO food : foodList) { %>

	<tr align="center">
		<td ><%= food.getDay() %></td>
		<td><%= food.getTime() %></td>
		<td><%= food.getMenu() %></td>
	</tr>
<% } %>



</table>
<br>
<input type="button" style="height:20pt;" value="뒤로가기" onclick="location.href='foodindex.jsp'"/>
</div>
</body>
</html>