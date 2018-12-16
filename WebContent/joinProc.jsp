<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.dao.MemberDAO" %>
<%@ page import="ymaster.vo.MemberVO" %>
<%
	MemberVO vo = new MemberVO();
	MemberDAO dao = new MemberDAO();
%>
 <%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>용인마스터</title>
</head>
<body>
	<% String id = request.getParameter("id");
	   String pwd = request.getParameter("password");
	   String name = request.getParameter("name");

	   int log = dao.joinCheck(id);

	   if(log == 0) {
		   vo.setId(id);
		   vo.setPassword(pwd);
		   vo.setName(name);
		   
		   dao.join(vo);

		   response.sendRedirect("login.jsp");
	   }
	   else if(log == 1) {
		  	PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('중복된 아이디 입니다.')");
			script.println("history.back()");
			script.println("</script>");
	   }
	   else {
		   	PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류입니다.')");
			script.println("history.back()");
			script.println("</script>");
	   }
	   %>
</body>
</html>