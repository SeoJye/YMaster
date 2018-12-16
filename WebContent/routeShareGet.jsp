<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.dao.RouteShareDAO" %>
<%@ page import="ymaster.vo.RouteShareVO" %>
<%@ page import="ymaster.vo.MemberVO" %>
<%@ page import="java.util.List" %>    
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
<title>getrouteshare</title>
</head>
<body>
<div align="right">
		<h4><%= mvo.getName()%>  <a href="logoutProc.jsp">logout</a> </h4>
	</div>
	<div align="center">
	<h2>경로 마스터</h2><hr>
		<h2> 상세보기 </h2>
		
		<hr>
		<form action="routeShareUpdate.jsp" method="post">
		<input type ="hidden" name= "seq" value ="<%=share.getSeq() %>"/>
		<table border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td>제목</td>
				<td align="left"><input name="title" type="text" value="<%=share.getTitle() %>"/></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td align="left"><%=share.getWriter() %></td>
			</tr>
			<tr>
				<td>내용</td>
				<td align="left">
				<textarea  name="content" cols="40" rows="10">
				<%=share.getContent() %>
				</textarea>
				</td>
			</tr>
			<tr>
				<td>등록일</td>
				<td align="left"><%=share.getRegdate() %></td>
			</tr>
			<tr>
				<td>조회수</td>
				<td align="left"><%=share.getCnt() %></td>
			</tr>
			<tr>
				<td colspan="2" align="center"> <input type="submit" value="수정" />
				<input type="button" style="height:20pt;" value="삭제" onclick="location.href='routeShareDelete.jsp?seq=<%= share.getSeq() %>'"/></td>
				<%= share.getSeq() %>
			</tr>
			
		</table>
		</form>
		<hr>
		
		<input type="button" style="height:20pt;" value="뒤로가기" onclick="location.href='routeShareList.jsp'"/>
	</div>

</body>


</html>