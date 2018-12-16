<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.dao.MemberDAO" %>
<%@ page import="ymaster.vo.MemberVO" %>

 <%
	if(session.getAttribute("memberVO") == null) {
		response.sendRedirect("login.jsp");
	}
 
	MemberVO vo = new MemberVO();
	MemberDAO dao = new MemberDAO();
	vo = (MemberVO) session.getAttribute("memberVO");
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
		<h4><%= vo.getName()%>  <a href="logoutProc.jsp">logout</a> </h4>
	</div>
	<div align="center" style='line-height:170%'>
		<form style='line-height:170%'>
			환영합니다 관리자  <%= vo.getName()%> 님<br>
			<input type="button"  value ="회원 목록" onclick = "location.href='memberList.jsp'" style="background-color:#eff7f9;"><br>
			<input type="button"  value ="셔틀 마스터" onclick = "location.href='adminSchoolBus.jsp'" style="background-color:#eff7f9;"><br>
			<input type="button"  value ="학식 마스터" onclick = "location.href='foodindex.jsp'" style="background-color:#eff7f9;"><br>
			<input type="button"  value ="경로 마스터" onclick = "location.href='routeShareList.jsp'"style="background-color:#eff7f9;"><br>
			<input type="button"  value ="택시 마스터" onclick = "location.href='taxiList.jsp'" style="background-color:#eff7f9;"><br>
			<input type="button"  value ="맛집 마스터" onclick = "location.href='adminRestaurant.jsp'" style="background-color:#eff7f9;"><br>
			<input type="button"  value ="배달 마스터" onclick = "location.href='adminDelivery.jsp'" style="background-color:#eff7f9;"><br>
		</form>
	</div>
</body>
</html>