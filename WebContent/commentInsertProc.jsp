<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.dao.CommentsDAO" %>
<%@ page import="ymaster.vo.CommentsVO" %>
<%@ page import = "java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	String parentseq=request.getParameter("seq");
	String content=request.getParameter("content");
	String writer=request.getParameter("writer");
	
	CommentsVO vo = new CommentsVO();
	vo.setBorSeq(parentseq);
	vo.setContent(content);
	vo.setWriter(writer);
	
	
	CommentsDAO dao = new CommentsDAO();
	dao.insertComment(vo);
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('등록 되었습니다.')");
	script.println("location.href='taxiList.jsp'");
	script.println("</script>");
	
	//response.sendRedirect("taxiList.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>commentsInsertPROC</title>
</head>
<body>
</body>
</html>