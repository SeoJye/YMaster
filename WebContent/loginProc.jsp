<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ymaster.dao.MemberDAO" %>
<%@ page import = "ymaster.vo.MemberVO" %>
 <%
 	MemberVO vo = new MemberVO();
	MemberDAO dao = new MemberDAO();
 %>
 <%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% String id = request.getParameter("id");
	   String pwd = request.getParameter("password");

	   int log = dao.login(id, pwd);

	   System.out.println(id + pwd + ", "+ log);
	   
	   if(log == 1) {
		   vo = dao.getMember(id);
		   session.setAttribute("memberVO", vo);
		   if(vo.getRole() == 1) response.sendRedirect("adminMain.jsp");
		   else response.sendRedirect("main.jsp");
	   }
	   else if(log == 0) {
		  	PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호를 잘못 입력하였습니다.')");
			script.println("history.back()");
			script.println("</script>");
	   }
	   else if(log == -1) {
		   	PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
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