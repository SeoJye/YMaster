<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.dao.RouteShareDAO" %>
<%@ page import="ymaster.vo.RouteShareVO" %>
<%@ page import = "java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String seq = request.getParameter("seq");
	String content=request.getParameter("content");

	RouteShareVO vo = new RouteShareVO();
	vo.setTitle(title);
	vo.setSeq(seq);
	vo.setContent(content);
	
	RouteShareDAO shareDao = new RouteShareDAO();
	
	shareDao.updateRouteShare(vo);
/*
	if(vo.setTitle(title)==null){
	  	PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('제목을 써주세요')");
		script.println("history.back()");
		script.println("</script>");
	}else if(vo.setContent(content)==null){
	  	PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('내용을 써주세요')");
		script.println("history.back()");
		script.println("</script>");
	}else{
	   	PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('수정되었습니다')");
		script.println("location.href='routeShareList.jsp'");
		script.println("</script>");
	}
*/
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('수정 되었습니다.')");
	script.println("location.href='routeShareList.jsp'");
	script.println("</script>");
//response.sendRedirect("routeShareList.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>routeshareupdatePROC</title>
</head>

</body>
</html>