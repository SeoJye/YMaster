<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.dao.RouteShareDAO" %>
<%@ page import="ymaster.vo.RouteShareVO" %>
<%@ page import = "java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content=request.getParameter("content");
	String password=request.getParameter("password");
	
	RouteShareVO vo = new RouteShareVO();
	vo.setTitle(title);
	vo.setWriter(writer);
	vo.setContent(content);
	vo.setPassword(Integer.parseInt(password));
	
	RouteShareDAO dao = new RouteShareDAO();
	dao.insertRouteShare(vo);
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('등록 되었습니다.')");
	script.println("location.href='routeShareList.jsp'");
	script.println("</script>");
	//response.sendRedirect("routeShareList.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>routeShareInsertPROC</title>
</head>
<body>

</body>
</html>