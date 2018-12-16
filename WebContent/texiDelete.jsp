<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.dao.TaxiDAO" %>
<%@ page import="ymaster.vo.TaxiVO" %>
<%@ page import = "java.io.PrintWriter" %>
<%

	request.setCharacterEncoding("UTF-8");
	String seq=request.getParameter("seq");
	
	TaxiVO vo = new TaxiVO();
	vo.setSeq(seq);
	TaxiDAO dao = new TaxiDAO();
	
	dao.deleteTaxi(vo);
		
	PrintWriter script = response.getWriter();

	script.println("<script>");
	script.println("alert('삭제 되었습니다.')");
	script.println("location.href='taxiList.jsp'");
	script.println("</script>");
	
	
	
	//response.sendRedirect("routeShareList.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>taxidelete</title>
</head>
<body>

</body>
</html>