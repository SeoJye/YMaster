<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="ymaster.dao.RestaurantDAO" %>
<%@ page import="ymaster.vo.RestaurantVO" %>
<%@ page import="ymaster.dao.CommentsDAO" %>
<%@ page import="ymaster.vo.CommentsVO" %>
<%@ page import="ymaster.vo.MemberVO" %>
<%
	if(session.getAttribute("memberVO") == null) {
		response.sendRedirect("login.jsp");
	}

	MemberVO mvo = (MemberVO) session.getAttribute("memberVO");

	RestaurantDAO dao = new RestaurantDAO();
	List<RestaurantVO> rList = dao.getRestaurantList();
	
	CommentsDAO comd = new CommentsDAO(); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>용인마스터</title>
</head>
<body>
	<div align="right">
		<h4><%= mvo.getName()%>  <a href="logoutProc.jsp">logout</a> </h4>
	</div>
	<div align="center">
	<h2>맛집 마스터</h2><hr>

		<% for(RestaurantVO vo : rList) { %>
		<form action="insertCommentProc.jsp?seq=<%=vo.getSeq() %>" method="post">
			<table border="1" cellpadding="4" cellspacing="0" width="700">
				<tr height="15" align="center">
					<th bgcolor="#ccffcc" width="50">종류</th>
					<th bgcolor="#ccffcc" width="120">위치</th>
					<th bgcolor="#ccffcc" width="280">가게 이름</th>
					<th bgcolor="#ccffcc" width="100">평점(0~10)</th>
					<th bgcolor="#ccffcc" width="150">작성자</th>
				</tr>
				<tr height="25" align="center">
					<td><%= vo.getType() %></td>
					<td><%= vo.getLocate() %></td>
					<td><%= vo.getName() %></td>
					<td><%= vo.getRate() %></td>
					<td><%= vo.getWriter() %></td>
				</tr>
				<tr height="15" align="center">
					<th bgcolor="#ccffcc" colspan="3">상세 위치</th>
					<th bgcolor="#ccffcc">가격대</th>
					<th bgcolor="#ccffcc">작성일</th>
				</tr>
				<tr height="25" align="center">
					<td colspan="3"><%= vo.getAddress() %></td>
					<td><%= vo.getPrice() %></td>
					<td><%= vo.getRegdate() %></td>
				</tr>
				<tr height="15" align="center">
					<th bgcolor="#ccffcc" colspan="5">내용</th>
				</tr>
				<tr height="150">
					<td colspan="5"><%= vo.getContent() %></td>
				</tr>
				<tr height="20">
					<td align="center" colspan="5">
				   			<input type="button" style="height:20pt;" value="수정" onclick="location.href='updateRestaurant.jsp?seq=<%= vo.getSeq() %>'"/>
				   			<input type="button" style="height:20pt;" value="삭제" onclick="location.href='deleteRestaurantProc.jsp?seq=<%= vo.getSeq() %>'"/>
				   	</td>
				</tr>
				<tr height="1">
					<td colspan="5"></td>
				</tr>
				<tr height="30" align="center">
					<th colspan="5" bgcolor="#ccffcc">댓글</th>
				</tr>
				<% List<CommentsVO> cList = comd.getCommentList(vo.getSeq());
				   for(CommentsVO cvo : cList) { %>
				   	<tr height="40">

				   		<td colspan="3"><%= cvo.getWriter() %></td>
				   		<td><%= cvo.getRegdate() %></td>
				   		<td align="center">
				   			<input type="button" style="width:100%; height:20pt;" value="삭제" onclick="location.href='deleteCommentProc.jsp?comSeq=<%= cvo.getComSeq() %>'"/>
				   		</td>

				   	</tr>
				   	<tr height="80">
				   		<td colspan="5"><%= cvo.getContent() %></td>
				   	</tr>
				<% } %>
				<tr>
					<td colspan="4"><textarea name="content" cols="72%" rows="4"></textarea></td>
					<td align="center"><input type="submit" value="댓글 쓰기" height="100%"/></td>
				</tr>
			</table>
		</form>
		<br>
		<% } %>
		
		<br>
		<input type="button" style="width:20%; height:20pt;" value="새글 등록" onclick="location.href='insertRestaurant.jsp'"/>
		<input type="button" style="width:20%; height:20pt;" value="메인으로" onclick="location.href='adminMain.jsp'"/>
	</div>
</body>
</html>