<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.dao.CommentsDAO" %>
<%@ page import="ymaster.vo.CommentsVO" %>
<%@ page import="ymaster.vo.MemberVO" %>
<%
	if(session.getAttribute("memberVO") == null) {
		response.sendRedirect("login.jsp");
	}

	MemberVO mvo = new MemberVO();
	mvo = (MemberVO) session.getAttribute("memberVO");
	
	String seq = (String) request.getParameter("comSeq");
	
	CommentsDAO cdao = new CommentsDAO();
	CommentsVO vo = new CommentsVO();
	vo = cdao.getComment(seq);
	
	String str = vo.getBorSeq().toString().substring(0, 1);
	
	cdao.deleteComment(seq);
	
	if(mvo.getRole() == 1) {
		if(str.equals("R"))	response.sendRedirect("adminRestaurant.jsp");
		else if(str.equals("D")) response.sendRedirect("adminDelivery.jsp");
	}
	else {
		if(str.equals("R"))	response.sendRedirect("restaurant.jsp");
		else if(str.equals("D")) response.sendRedirect("delivery.jsp");
	}

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