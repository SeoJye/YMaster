<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.dao.RouteShareDAO" %>
<%@ page import="ymaster.vo.MemberVO" %>
<%@ page import="ymaster.vo.RouteShareVO" %>
<%
	if(session.getAttribute("memberVO") == null) {
		response.sendRedirect("login.jsp");
	}

	MemberVO mvo = (MemberVO) session.getAttribute("memberVO");
	String seq = request.getParameter("seq");
	RouteShareVO vo = new RouteShareVO();
	vo.setSeq(seq);
	RouteShareDAO shareDao = new RouteShareDAO();
	RouteShareVO share = shareDao.getRouteShare(vo);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>routeSharedelete</title>
</head>
<body>
<div align="right">
		<h4><%= mvo.getName()%>  <a href="logoutProc.jsp">logout</a> </h4>
	</div>
	<div align="center">
	<h2>경로 마스터</h2><hr>
	<form action="routeShareDeleteProc.jsp" method="post">
	<input type ="hidden" name= "seq" value ="<%=share.getSeq() %>"/>
	<table border="1" cellpadding="0" cellspacing="0">
		<tr><td>비밀번호 네자리를 입력해주세요</td></tr>
		<tr><td><input name="password" type="text"/></td></tr>
		<tr><td align="center"><input type="submit" value="확인" />
		<input type="button" value="취소" onclick="location.href='routeShareList.jsp'" ></td></tr>
	</table>
	</form>
	
</div>
</body>
</html>