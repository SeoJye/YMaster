<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.dao.TaxiDAO" %>
<%@ page import="ymaster.vo.TaxiVO" %>

<%@ page import = "java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	String seq = request.getParameter("seq");
	String title = request.getParameter("title");
	String starting=request.getParameter("starting");
	String destination = request.getParameter("destination");
	String time = request.getParameter("time");
	String timeHour = request.getParameter("timeHour");
	String timeMinute = request.getParameter("timeMinute");
	String content=request.getParameter("content");
	
	TaxiVO vo = new TaxiVO();
	vo.setSeq(seq);
	vo.setTitle(title);
	vo.setStarting(starting);
	vo.setDestination(destination);
	vo.setTime(time);
	vo.setTimeHour(Integer.parseInt(timeHour));
	vo.setTimeMinute(Integer.parseInt(timeMinute));
	vo.setContent(content);
		
	TaxiDAO dao = new TaxiDAO();
	
	dao.updateTaxi(vo);
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('수정 되었습니다.')");
	script.println("location.href='taxiList.jsp'");
	script.println("</script>");
	//response.sendRedirect("taxiList.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>taxiupdatePROC</title>
</head>

</body>
</html>