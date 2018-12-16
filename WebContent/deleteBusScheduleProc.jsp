<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.dao.BusScheduleDAO" %>
<%@ page import="ymaster.vo.BusScheduleVO" %>
<%
	request.setCharacterEncoding("UTF-8");
	String side = (String) request.getParameter("side");
	String week = (String) request.getParameter("week");
	String destination = (String) request.getParameter("destination");
	String content = (String) request.getParameter("content");
	String time = (String) request.getParameter("time");

	BusScheduleVO vo = new BusScheduleVO();
	vo.setSide(side);
	vo.setWeek(week);
	vo.setDestination(destination);
	vo.setContent(content);
	vo.setTime(time);
	
	System.out.println(side);
	System.out.println(week);
	System.out.println(destination);
	System.out.println(content);
	System.out.println(time);
	
	BusScheduleDAO dao = new BusScheduleDAO();
	dao.deleteBusSchedule(vo);
	
	response.sendRedirect("adminBusSchedule.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>