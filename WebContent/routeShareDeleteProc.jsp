<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.dao.RouteShareDAO" %>
<%@ page import="ymaster.vo.RouteShareVO" %>
<%@ page import = "java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	String password = request.getParameter("password");
	String seq=request.getParameter("seq");
	
	System.out.println("string pw"+password);
	System.out.println("Seq="+seq);
	
	RouteShareVO vo = new RouteShareVO();
	vo.setPassword(Integer.parseInt(password));
	vo.setSeq(seq);
	
	RouteShareDAO dao = new RouteShareDAO();
	
	int check = dao.check(Integer.parseInt(password), seq);
	
	System.out.println("pw"+Integer.parseInt(password));
	System.out.println("Seq="+seq);
	
	
	System.out.println(password + seq + ", "+ check);
	if(check==1){
		
		dao.deleteRouteShare(vo);
		System.out.println(vo.getSeq());
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('삭제 되었습니다.')");
		script.println("location.href='routeShareList.jsp'");
		script.println("</script>");
	}else if(check == 0) {
	  	PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('잘못 입력하였습니다.')");
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

	
	
	//response.sendRedirect("routeShareList.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sharedeltePROC</title>
</head>
<body>

</body>
</html>