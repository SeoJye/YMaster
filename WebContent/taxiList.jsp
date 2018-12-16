<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.dao.TaxiDAO" %>
<%@ page import="ymaster.vo.TaxiVO" %>
<%@ page import="ymaster.vo.MemberVO" %>
<%@ page import="java.util.List" %>    
<%
	if(session.getAttribute("memberVO") == null) {
		response.sendRedirect("login.jsp");
	}

	MemberVO mvo = (MemberVO) session.getAttribute("memberVO");

TaxiVO vo = new TaxiVO();
TaxiDAO dao = new TaxiDAO();
	List<TaxiVO> list = dao.getTaxiList();
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
	<h2>택시 마스터</h2><hr>


<form action="taxiList.jsp" method="post">
	 출발
	<select name ="startingS">
		<option value="시청">시청</option>
		<option value="명지대사거리">명지대 사거리</option>
		<option value="이약국">이약국</option>
		<option value="CGV">CGV</option>
		<option value="터미널">터미널</option>
		<option value="학교">학교</option>
	</select>		
	-> 도착
	<select name ="destinationS">
		<option value="시청">시청</option>
		<option value="명지대사거리">명지대 사거리</option>
		<option value="이약국">이약국</option>
		<option value="CGV">CGV</option>
		<option value="터미널">터미널</option>
		<option value="학교">학교</option>
	</select>
	   <input type="button" style="height:20pt;" value="검색" onclick="location.href='taxiSearch.jsp'"/>	
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
<input type="button" style="height:20pt;" value="새글작성" onclick="location.href='taxiInsert.jsp'"/>
<input type="button" style="height:20pt;" value="뒤로가기" onclick="location.href='main.jsp'"/>
</td>
</tr>
</table>
</form>
<br>

		<input type="button" style="height:20pt;" value="로그아웃" onclick="location.href='logout.jsp'"/>
</div>
</body>
</html>