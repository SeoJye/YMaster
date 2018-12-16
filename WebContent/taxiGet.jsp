<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.dao.TaxiDAO" %>
<%@ page import="ymaster.vo.TaxiVO" %>
<%@ page import="ymaster.dao.CommentsDAO" %>
<%@ page import="ymaster.vo.CommentsVO" %>
<%@ page import="ymaster.vo.MemberVO" %>
<%@ page import="java.util.List" %>    
<%
	if(session.getAttribute("memberVO") == null) {
		response.sendRedirect("login.jsp");
	}

	MemberVO mvo = (MemberVO) session.getAttribute("memberVO");
	String seq = request.getParameter("seq");
	TaxiVO vo = new TaxiVO();
	vo.setSeq(seq);
	TaxiDAO dao = new TaxiDAO();
	TaxiVO taxi = dao.getTaxi(vo);

	CommentsDAO cdao = new CommentsDAO();
	List<CommentsVO> clist = cdao.getCommentList(seq);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>gettaxi</title>
</head>
<body>
<div align="right">
		<h4><%= mvo.getName()%>  <a href="logoutProc.jsp">logout</a> </h4>
	</div>
	<div align="center">
	<h2>택시 마스터</h2><hr>
		<h2> 상세보기 </h2>
		
		<hr>
		<form action="taxiUpdate.jsp" method="post">
		<input type ="hidden" name= "seq" value ="<%=taxi.getSeq() %>"/>
		<table border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td bgcolor="pink">제목</td>
				<td align="left"><input name="title" type="text" value="<%=taxi.getTitle() %>" /></td>
			</tr>
			<tr>
				<td bgcolor="pink">작성자</td>
				<td align="left"><%=taxi.getWriter() %></td>
			</tr>
			<tr>
				<td bgcolor="pink">출발지</td>
				<td align="left"><%=taxi.getStarting() %></td>
			</tr>
			<tr>

			</tr>
			<tr>
				<td bgcolor="pink">목적지</td>
				<td align="left"><%=taxi.getDestination()%></td>
			</tr>
			<tr>
				<td bgcolor="pink">시간</td>
				<td><%=taxi.getTime() %> <%=taxi.getTimeHour() %>시 <%=taxi.getTimeMinute() %> 분</td> 
			</tr>
			<tr>
				<td bgcolor="pink">내용</td>
				<td align="left"><textarea  name="content" cols="40" rows="10">
				<%=taxi.getContent()%></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"> <input type="submit" value="글수정" />
				<input type="button" style="height:20pt;" value="삭제" onclick="location.href='taxiDelete.jsp?seq=<%= taxi.getSeq() %>'"/></td>
				
			</tr>
			
		</table>
		
		<table border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="4" align="right"><input type="button" style="height:20pt;" value="댓글추가" onclick="location.href='commentsInsert.jsp?seq=<%= taxi.getSeq() %>'"/></td>
			</tr>
			<tr>
			<td bgcolor="pink" align="center" width="200"> 댓글 </td> <td bgcolor="pink" align="center" width="90"> 카톡아이디</td> <td bgcolor="pink" align="center" width="100">등록일</td> 
			</tr>
			<% for(CommentsVO com : clist) { %>
			<tr align="center">
				
				<td width="200"><%= com.getContent() %></td>
				<td width="80"><%= com.getWriter() %></td>
				<td width="130"><%= com.getRegdate() %></td>
			</tr>
			<% } %>

		</table>
	</form>
	<hr>
		<input type="button" style="height:20pt;" value="글목록" onclick="location.href='taxiList.jsp'"/>
</div>

</body>

</html>