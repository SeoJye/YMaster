<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.dao.CommentsDAO" %>
<%@ page import="ymaster.vo.CommentsVO" %>
<%@ page import="ymaster.vo.MemberVO" %>
<%
	request.setCharacterEncoding("UTF-8");
	String seq = request.getParameter("seq");
	String content = request.getParameter("content");
	
	MemberVO member = new MemberVO();
	member = (MemberVO) session.getAttribute("memberVO");
	String writer = member.getName();

	CommentsVO vo = new CommentsVO();
	vo.setBorSeq(seq);
	vo.setWriter(writer);
	vo.setContent(content);

	String str = vo.getBorSeq().toString().substring(0, 1);
	
	CommentsDAO dao = new CommentsDAO();
	dao.insertComment(vo);
	
	if(str.equals("R"))	response.sendRedirect("restaurant.jsp");
	else if(str.equals("D")) response.sendRedirect("delivery.jsp");
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