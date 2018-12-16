<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="ymaster.dao.BusScheduleDAO" %>
<%@ page import="ymaster.vo.BusScheduleVO" %>
<%@ page import="ymaster.vo.MemberVO" %>
<%@ page import="java.net.URLEncoder" %>
<%
	if(session.getAttribute("memberVO") == null) {
		response.sendRedirect("login.jsp");
	}

	MemberVO mvo = (MemberVO) session.getAttribute("memberVO");	

	BusScheduleDAO dao = new BusScheduleDAO();
	List<BusScheduleVO> bsList1 = dao.getBusScheduleList("시내", "평일", "용인대");
	List<BusScheduleVO> bsList2 = dao.getBusScheduleList("시내", "주말", "용인대");
	List<BusScheduleVO> bsList3 = dao.getBusScheduleList("시내", "방학평일", "용인대");
	List<BusScheduleVO> bsList4 = dao.getBusScheduleList("시외", "평일", "강남행");
	List<BusScheduleVO> bsList5 = dao.getBusScheduleList("시외", "평일", "잠실행");
	List<BusScheduleVO> bsList6 = dao.getBusScheduleList("시외", "평일", "영등포행");
	List<BusScheduleVO> bsList7 = dao.getBusScheduleList("시외", "평일", "성남/분당행");
	List<BusScheduleVO> bsList8 = dao.getBusScheduleList("시외", "평일", "일산행");
	List<BusScheduleVO> bsList9 = dao.getBusScheduleList("시외", "평일", "인천행");
	List<BusScheduleVO> bsList10 = dao.getBusScheduleList("시외", "평일", "안양행");
	List<BusScheduleVO> bsList11 = dao.getBusScheduleList("시외", "평일", "강북행");
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
		<h3>시내/시외 셔틀 시간표</h3><hr>
		
		<hr><h3>시내</h3><hr>
		<div align="center" style='line-height:170%'>
		<form method="post" action="insertBusScheduleProc.jsp">
			<table border="1" cellpadding="0" cellspacing="0" width="400">
				<tr>
					<th colspan="3" align="center" bgcolor="ffffe0">평일</th>
				</tr>
				<% for(BusScheduleVO vo : bsList1) { %>
				<tr>
					<td width="100"><%= vo.getWeek() %></td>
					<td width="200"><%= vo.getContent() %></td>
					<td width="100"><%= vo.getTime() %></td>
					<%
						String week = vo.getWeek();
						String content = vo.getContent();
						String time = vo.getTime();
						String side = vo.getSide();
						String destination = vo.getDestination();
						
						week = URLEncoder.encode(week, "UTF-8");
						content = URLEncoder.encode(content, "UTF-8");
						time = URLEncoder.encode(time, "UTF-8");
						side = URLEncoder.encode(side, "UTF-8");
						destination = URLEncoder.encode(destination, "UTF-8");
					%>
					<td><input type="button" value="삭제" onclick="location.href='deleteBusScheduleProc.jsp?side=<%= side %>&week=<%= week %>&destination=<%= destination %>&content=<%= content %>&time=<%= time %>'"/></td>
				</tr>
				<% } %>
				<tr>
					<td>평일</td>
					<td>용인순환</td>
					<td><input type="text" size="10" name="time"/></td>
					<td><input type="submit" style="height:20pt;" value="등록"/></td>
				</tr>
			</table>
			<input type="hidden" name="side" value="시내"/>
			<input type="hidden" name="destination" value="용인대"/>
			<input type="hidden" name="week" value="평일"/>
			<input type="hidden" name="content" value="용인순환"/>
  			</form>
   		</div>
   		<br>
   		<div align="center" style='line-height:170%'>
   		<form method="post" action="insertBusScheduleProc.jsp">
			<table border="1" cellpadding="0" cellspacing="0" width="400">
				<tr>
					<th colspan="3" align="center" bgcolor="ffffe0">주말</th>
				</tr>
				<% for(BusScheduleVO vo : bsList2) { %>
				<tr>
					<td width="100"><%= vo.getWeek() %></td>
					<td width="200"><%= vo.getContent() %></td>
					<td width="100"><%= vo.getTime() %></td>
					<%
						String week = vo.getWeek();
						String content = vo.getContent();
						String time = vo.getTime();
						String side = vo.getSide();
						String destination = vo.getDestination();
						
						week = URLEncoder.encode(week, "UTF-8");
						content = URLEncoder.encode(content, "UTF-8");
						time = URLEncoder.encode(time, "UTF-8");
						side = URLEncoder.encode(side, "UTF-8");
						destination = URLEncoder.encode(destination, "UTF-8");
					%>
					<td><input type="button" value="삭제" onclick="location.href='deleteBusScheduleProc.jsp?side=<%= side %>&week=<%= week %>&destination=<%= destination %>&content=<%= content %>&time=<%= time %>'"/></td>
				</tr>
				<% } %>
				<tr>
					<td>주말</td>
					<td>용인순환</td>
					<td><input type="text" size="10" name="time"/></td>
					<td><input type="submit" style="height:20pt;" value="등록"/></td>
				</tr>
			</table>
			<input type="hidden" name="side" value="시내"/>
			<input type="hidden" name="destination" value="용인대"/>
			<input type="hidden" name="week" value="주말"/>
			<input type="hidden" name="content" value="용인순환"/>
  			</form>
   		</div>
   		<br>
   		<div align="center" style='line-height:170%'>
   		<form method="post" action="insertBusScheduleProc.jsp">
			<table border="1" cellpadding="0" cellspacing="0" width="400">
				<tr>
					<th colspan="3" align="center" bgcolor="ffffe0">방학평일</th>
				</tr>
				<% for(BusScheduleVO vo : bsList3) { %>
				<tr>
					<td width="100"><%= vo.getWeek() %></td>
					<td width="200"><%= vo.getContent() %></td>
					<td width="100"><%= vo.getTime() %></td>
					<%
						String week = vo.getWeek();
						String content = vo.getContent();
						String time = vo.getTime();
						String side = vo.getSide();
						String destination = vo.getDestination();
						
						week = URLEncoder.encode(week, "UTF-8");
						content = URLEncoder.encode(content, "UTF-8");
						time = URLEncoder.encode(time, "UTF-8");
						side = URLEncoder.encode(side, "UTF-8");
						destination = URLEncoder.encode(destination, "UTF-8");
					%>
					<td><input type="button" value="삭제" onclick="location.href='deleteBusScheduleProc.jsp?side=<%= side %>&week=<%= week %>&destination=<%= destination %>&content=<%= content %>&time=<%= time %>'"/></td>
				</tr>
				<% } %>
			<tr>
					<td>방학평일</td>
					<td>용인순환</td>
					<td><input type="text" size="10" name="time"/></td>
					<td><input type="submit" style="height:20pt;" value="등록"/></td>
				</tr>
			</table>
			<input type="hidden" name="side" value="시내"/>
			<input type="hidden" name="destination" value="용인대"/>
			<input type="hidden" name="week" value="방학평일"/>
			<input type="hidden" name="content" value="용인순환"/>
  			</form>
   		</div>
   		
   		<hr><h3>시외</h3><hr>
   		<div align="center" style='line-height:170%'>
   		<form method="post" action="insertBusScheduleProc.jsp">
			<table border="1" cellpadding="0" cellspacing="0" width="700">
				<tr>
					<th colspan="3" align="center" bgcolor="ffffe0">평일 강남행</th>
				</tr>
				<% for(BusScheduleVO vo : bsList4) { %>
				<tr>
					<td width="100"><%= vo.getWeek() %></td>
					<td width="200"><%= vo.getDestination() %></td>
					<td width="250"><%= vo.getContent() %></td>
					<td width="150"><%= vo.getTime() %></td>
					<%
						String week = vo.getWeek();
						String content = vo.getContent();
						String time = vo.getTime();
						String side = vo.getSide();
						String destination = vo.getDestination();
						
						week = URLEncoder.encode(week, "UTF-8");
						content = URLEncoder.encode(content, "UTF-8");
						time = URLEncoder.encode(time, "UTF-8");
						side = URLEncoder.encode(side, "UTF-8");
						destination = URLEncoder.encode(destination, "UTF-8");
					%>
					<td><input type="button" value="삭제" onclick="location.href='deleteBusScheduleProc.jsp?side=<%= side %>&week=<%= week %>&destination=<%= destination %>&content=<%= content %>&time=<%= time %>'"/></td>
				</tr>
				<% } %>
				<tr>
					<td>평일</td>
					<td>강남행</td>
					<td><input type="hidden" size="20" name="content"/></td>
					<td><input type="text" size="10" name="time"/></td>
					<td><input type="submit" style="height:20pt;" value="등록"/></td>
				</tr>
			</table>
			<input type="hidden" name="side" value="시외"/>
			<input type="hidden" name="destination" value="강남행"/>
			<input type="hidden" name="week" value="평일"/>
			
  			</form>
   		</div>
   		<br>
   		<div align="center" style='line-height:170%'>
   		<form method="post" action="insertBusScheduleProc.jsp">
			<table border="1" cellpadding="0" cellspacing="0" width="700">
				<tr>
					<th colspan="3" align="center" bgcolor="ffffe0">평일 잠실행</th>
				</tr>
				<% for(BusScheduleVO vo : bsList5) { %>
				<tr>
					<td width="100"><%= vo.getWeek() %></td>
					<td width="200"><%= vo.getDestination() %></td>
					<td width="250"><%= vo.getContent() %></td>
					<td width="150"><%= vo.getTime() %></td>
					<%
						String week = vo.getWeek();
						String content = vo.getContent();
						String time = vo.getTime();
						String side = vo.getSide();
						String destination = vo.getDestination();
						
						week = URLEncoder.encode(week, "UTF-8");
						content = URLEncoder.encode(content, "UTF-8");
						time = URLEncoder.encode(time, "UTF-8");
						side = URLEncoder.encode(side, "UTF-8");
						destination = URLEncoder.encode(destination, "UTF-8");
					%>
					<td><input type="button" value="삭제" onclick="location.href='deleteBusScheduleProc.jsp?side=<%= side %>&week=<%= week %>&destination=<%= destination %>&content=<%= content %>&time=<%= time %>'"/></td>
				</tr>
				<% } %>
			<tr>
					<td>평일</td>
					<td>잠실행</td>
					<td><input type="hidden" size="20" name="content"/></td>
					<td><input type="text" size="10" name="time"/></td>
					<td><input type="submit" style="height:20pt;" value="등록"/></td>
				</tr>
			</table>
			<input type="hidden" name="side" value="시외"/>
			<input type="hidden" name="destination" value="잠실행"/>
			<input type="hidden" name="week" value="평일"/>
  			</form>
   		</div>
   		<br>
   		<div align="center" style='line-height:170%'>
   		<form method="post" action="insertBusScheduleProc.jsp">
			<table border="1" cellpadding="0" cellspacing="0" width="700">
				<tr>
					<th colspan="3" align="center" bgcolor="ffffe0">평일 영등포행</th>
				</tr>
				<% for(BusScheduleVO vo : bsList6) { %>
				<tr>
					<td width="100"><%= vo.getWeek() %></td>
					<td width="200"><%= vo.getDestination() %></td>
					<td width="250"><%= vo.getContent() %></td>
					<td width="150"><%= vo.getTime() %></td>
					<%
						String week = vo.getWeek();
						String content = vo.getContent();
						String time = vo.getTime();
						String side = vo.getSide();
						String destination = vo.getDestination();
						
						week = URLEncoder.encode(week, "UTF-8");
						content = URLEncoder.encode(content, "UTF-8");
						time = URLEncoder.encode(time, "UTF-8");
						side = URLEncoder.encode(side, "UTF-8");
						destination = URLEncoder.encode(destination, "UTF-8");
					%>
					<td><input type="button" value="삭제" onclick="location.href='deleteBusScheduleProc.jsp?side=<%= side %>&week=<%= week %>&destination=<%= destination %>&content=<%= content %>&time=<%= time %>'"/></td>
				</tr>
				<% } %>
			<tr>
					<td>평일</td>
					<td>영등포행</td>
					<td><input type="hidden" size="20" name="content"/></td>
					<td><input type="text" size="10" name="time"/></td>
					<td><input type="submit" style="height:20pt;" value="등록"/></td>
				</tr>
			</table>
			<input type="hidden" name="side" value="시외"/>
			<input type="hidden" name="destination" value="영등포행"/>
			<input type="hidden" name="week" value="평일"/>
  			</form>
   		</div>
   		<br>
   		<div align="center" style='line-height:170%'>
   		<form method="post" action="insertBusScheduleProc.jsp">
			<table border="1" cellpadding="0" cellspacing="0" width="700">
				<tr>
					<th colspan="3" align="center" bgcolor="ffffe0">평일 성남/분당행</th>
				</tr>
				<% for(BusScheduleVO vo : bsList7) { %>
				<tr>
					<td width="100"><%= vo.getWeek() %></td>
					<td width="200"><%= vo.getDestination() %></td>
					<td width="250"><%= vo.getContent() %></td>
					<td width="150"><%= vo.getTime() %></td>
					<%
						String week = vo.getWeek();
						String content = vo.getContent();
						String time = vo.getTime();
						String side = vo.getSide();
						String destination = vo.getDestination();
						
						week = URLEncoder.encode(week, "UTF-8");
						content = URLEncoder.encode(content, "UTF-8");
						time = URLEncoder.encode(time, "UTF-8");
						side = URLEncoder.encode(side, "UTF-8");
						destination = URLEncoder.encode(destination, "UTF-8");
					%>
					<td><input type="button" value="삭제" onclick="location.href='deleteBusScheduleProc.jsp?side=<%= side %>&week=<%= week %>&destination=<%= destination %>&content=<%= content %>&time=<%= time %>'"/></td>
				</tr>
				<% } %>
			<tr>
					<td>평일</td>
					<td>성남/분당행</td>
					<td><input type="hidden" size="20" name="content"/></td>
					<td><input type="text" size="10" name="time"/></td>
					<td><input type="submit" style="height:20pt;" value="등록"/></td>
				</tr>
			</table>
			<input type="hidden" name="side" value="시외"/>
			<input type="hidden" name="destination" value="성남/분당행"/>
			<input type="hidden" name="week" value="평일"/>
  			</form>
   		</div>
   		<br>
   		<div align="center" style='line-height:170%'>
   		<form method="post" action="insertBusScheduleProc.jsp">
			<table border="1" cellpadding="0" cellspacing="0" width="700">
				<tr>
					<th colspan="3" align="center" bgcolor="ffffe0">평일 일산행</th>
				</tr>
				<% for(BusScheduleVO vo : bsList8) { %>
				<tr>
					<td width="100"><%= vo.getWeek() %></td>
					<td width="200"><%= vo.getDestination() %></td>
					<td width="250"><%= vo.getContent() %></td>
					<td width="150"><%= vo.getTime() %></td>
					<%
						String week = vo.getWeek();
						String content = vo.getContent();
						String time = vo.getTime();
						String side = vo.getSide();
						String destination = vo.getDestination();
						
						week = URLEncoder.encode(week, "UTF-8");
						content = URLEncoder.encode(content, "UTF-8");
						time = URLEncoder.encode(time, "UTF-8");
						side = URLEncoder.encode(side, "UTF-8");
						destination = URLEncoder.encode(destination, "UTF-8");
					%>
					<td><input type="button" value="삭제" onclick="location.href='deleteBusScheduleProc.jsp?side=<%= side %>&week=<%= week %>&destination=<%= destination %>&content=<%= content %>&time=<%= time %>'"/></td>
				</tr>
				<% } %>
			<tr>
					<td>평일</td>
					<td>일산행</td>
					<td><input type="hidden" size="20" name="content"/></td>
					<td><input type="text" size="10" name="time"/></td>
					<td><input type="submit" style="height:20pt;" value="등록"/></td>
				</tr>
			</table>
			<input type="hidden" name="side" value="시외"/>
			<input type="hidden" name="destination" value="일산행"/>
			<input type="hidden" name="week" value="평일"/>
  			</form>
   		</div>
   		<br>
   		<div align="center" style='line-height:170%'>
   		<form method="post" action="insertBusScheduleProc.jsp">
			<table border="1" cellpadding="0" cellspacing="0" width="700">
				<tr>
					<th colspan="3" align="center" bgcolor="ffffe0">평일 인천행</th>
				</tr>
				<% for(BusScheduleVO vo : bsList9) { %>
				<tr>
					<td width="100"><%= vo.getWeek() %></td>
					<td width="200"><%= vo.getDestination() %></td>
					<td width="250"><%= vo.getContent() %></td>
					<td width="150"><%= vo.getTime() %></td>
					<%
						String week = vo.getWeek();
						String content = vo.getContent();
						String time = vo.getTime();
						String side = vo.getSide();
						String destination = vo.getDestination();
						
						week = URLEncoder.encode(week, "UTF-8");
						content = URLEncoder.encode(content, "UTF-8");
						time = URLEncoder.encode(time, "UTF-8");
						side = URLEncoder.encode(side, "UTF-8");
						destination = URLEncoder.encode(destination, "UTF-8");
					%>
					<td><input type="button" value="삭제" onclick="location.href='deleteBusScheduleProc.jsp?side=<%= side %>&week=<%= week %>&destination=<%= destination %>&content=<%= content %>&time=<%= time %>'"/></td>
				</tr>
				<% } %>
			<tr>
					<td>평일</td>
					<td>인천행</td>
					<td><input type="hidden" size="20" name="content"/></td>
					<td><input type="text" size="10" name="time"/></td>
					<td><input type="submit" style="height:20pt;" value="등록"/></td>
				</tr>
			</table>
			<input type="hidden" name="side" value="시외"/>
			<input type="hidden" name="destination" value="인천행"/>
			<input type="hidden" name="week" value="평일"/>
  			</form>
   		</div>
   		<br>
   		<div align="center" style='line-height:170%'>
   		<form method="post" action="insertBusScheduleProc.jsp">
			<table border="1" cellpadding="0" cellspacing="0" width="700">
				<tr>
					<th colspan="3" align="center" bgcolor="ffffe0">평일 안양행</th>
				</tr>
				<% for(BusScheduleVO vo : bsList10) { %>
				<tr>
					<td width="100"><%= vo.getWeek() %></td>
					<td width="200"><%= vo.getDestination() %></td>
					<td width="250"><%= vo.getContent() %></td>
					<td width="150"><%= vo.getTime() %></td>
					<%
						String week = vo.getWeek();
						String content = vo.getContent();
						String time = vo.getTime();
						String side = vo.getSide();
						String destination = vo.getDestination();
						
						week = URLEncoder.encode(week, "UTF-8");
						content = URLEncoder.encode(content, "UTF-8");
						time = URLEncoder.encode(time, "UTF-8");
						side = URLEncoder.encode(side, "UTF-8");
						destination = URLEncoder.encode(destination, "UTF-8");
					%>
					<td><input type="button" value="삭제" onclick="location.href='deleteBusScheduleProc.jsp?side=<%= side %>&week=<%= week %>&destination=<%= destination %>&content=<%= content %>&time=<%= time %>'"/></td>
				</tr>
				<% } %>
			<tr>
					<td>평일</td>
					<td>안양행</td>
					<td><input type="hidden" size="20" name="content"/></td>
					<td><input type="text" size="10" name="time"/></td>
					<td><input type="submit" style="height:20pt;" value="등록"/></td>
				</tr>
			</table>
			<input type="hidden" name="side" value="시외"/>
			<input type="hidden" name="destination" value="안양행"/>
			<input type="hidden" name="week" value="평일"/>
  			</form>
   		</div>
   		<br>
   		<div align="center" style='line-height:170%'>
   		<form method="post" action="insertBusScheduleProc.jsp">
			<table border="1" cellpadding="0" cellspacing="0" width="700">
				<tr>
					<th colspan="3" align="center" bgcolor="ffffe0">평일 강북행</th>
				</tr>
				<% for(BusScheduleVO vo : bsList11) { %>
				<tr>
					<td width="100"><%= vo.getWeek() %></td>
					<td width="200"><%= vo.getDestination() %></td>
					<td width="250"><%= vo.getContent() %></td>
					<td width="150"><%= vo.getTime() %></td>
					<%
						String week = vo.getWeek();
						String content = vo.getContent();
						String time = vo.getTime();
						String side = vo.getSide();
						String destination = vo.getDestination();
						
						week = URLEncoder.encode(week, "UTF-8");
						content = URLEncoder.encode(content, "UTF-8");
						time = URLEncoder.encode(time, "UTF-8");
						side = URLEncoder.encode(side, "UTF-8");
						destination = URLEncoder.encode(destination, "UTF-8");
					%>
					<td><input type="button" value="삭제" onclick="location.href='deleteBusScheduleProc.jsp?side=<%= side %>&week=<%= week %>&destination=<%= destination %>&content=<%= content %>&time=<%= time %>'"/></td>
				</tr>
				<% } %>
			<tr>
					<td>평일</td>
					<td>강북행</td>
					<td><input type="hidden" size="20" name="content"/></td>
					<td><input type="text" size="10" name="time"/></td>
					<td><input type="submit" style="height:20pt;" value="등록"/></td>
				</tr>
			</table>
			<input type="hidden" name="side" value="시외"/>
			<input type="hidden" name="destination" value="강북행"/>
			<input type="hidden" name="week" value="평일"/>
  			</form>
   		</div>
   		<input type="button" style="width:20%; height:20pt;" value="메인으로" onclick="location.href='main.jsp'"/>
	</div>
</body>
</html>