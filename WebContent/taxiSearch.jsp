<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.dao.TaxiDAO" %>
<%@ page import="ymaster.vo.TaxiVO" %>
<%@ page import="java.util.List" %> 
<%@ page import="ymaster.vo.MemberVO" %>
<%@ page import = "java.io.PrintWriter" %>
<%
	if(session.getAttribute("memberVO") == null) {
		response.sendRedirect("login.jsp");
	}

	MemberVO mvo = (MemberVO) session.getAttribute("memberVO");
		request.setCharacterEncoding("UTF-8");

String starting=request.getParameter("startingS");
String destination = request.getParameter("destinationS");

TaxiVO vo = new TaxiVO();
vo.setStarting(starting);
vo.setDestination(destination);
System.out.print("JSP"+vo.getStarting());
System.out.println(vo.getDestination());

TaxiDAO dao = new TaxiDAO();
List<TaxiVO> list = dao.getSearchTaxiList(vo);

%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>search</title>
</head>
<body>
<div align="right">
		<h4><%= mvo.getName()%>  <a href="logoutProc.jsp">logout</a> </h4>
	</div>
	<div align="center">
	<h2>택시 마스터</h2><hr>
<table border="1" cellpadding="0" cellspacing="0" width="700">



<tr>
<th bgcolor="pink" width="200">제목</th>
<th bgcolor="pink" width="100">작성자</th>
<th bgcolor="pink" width="150">출발지</th>
<th bgcolor="pink" width="150">목적지</th>
<th bgcolor="pink" width="150" >시간</th>
<th bgcolor="pink" width="150">등록일</th>
</tr>
<% for(TaxiVO taxi : list) { %>
<tr align="center">
	<td ><a href="taxiGet.jsp?seq=<%= taxi.getSeq() %>"><%= taxi.getTitle() %></a></td>
	<td><%= taxi.getWriter() %></td>
	<td><%= taxi.getStarting() %></td>
	<td><%= taxi.getDestination() %></td>
	<td><%= taxi.getTime() %> <%= taxi.getTimeHour() %>시 <%= taxi.getTimeMinute()%>분</td>
	<td><%= taxi.getRegdate() %></td>
</tr>
<tr>


<% } %>
<td colspan="8" align="center">
<input type="button" style="height:20pt;" value="뒤로가기" onclick="location.href='taxiList.jsp'"/>
</td>
</tr>
</table>
</div>
</body>
</html>