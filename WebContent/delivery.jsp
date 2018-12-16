<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="ymaster.dao.DeliveryDAO" %>
<%@ page import="ymaster.vo.DeliveryVO" %>
<%@ page import="ymaster.dao.CommentsDAO" %>
<%@ page import="ymaster.vo.CommentsVO" %>
<%@ page import="ymaster.vo.MemberVO" %>
<%
	if(session.getAttribute("memberVO") == null) {
		response.sendRedirect("login.jsp");
	}

	MemberVO mvo = (MemberVO) session.getAttribute("memberVO");

	DeliveryDAO dao = new DeliveryDAO();
	List<DeliveryVO> dList = dao.getDeliveryList();
	
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
	<h2>배달 마스터</h2><hr>
		<form action="deliverySearch.jsp" method="post">
			<table border="1" cellpadding="4" cellspacing="0" width="850">
				<tr>
					<td>종류 검색</td>
					<td align="right">
						<select name="searchConditionKind">
							<option value="k0">선택</option>
							<option value="k1">치킨</option>
							<option value="k2">피자</option>
							<option value="k3">떡볶이</option>
							<option value="k4">돈까스,일식</option>
							<option value="k5">중식</option>
							<option value="k6">한식</option>
							<option value="k7">기타</option>
						</select>
					</td>
					<td width="30"><input type="submit" value="검색" width="100%"/></td>
				</tr>
			</table>
		</form>
		<br>
		
		<% for(DeliveryVO vo : dList) { %>
		<form action="insertCommentProc.jsp?seq=<%=vo.getSeq() %>" method="post">
			<table border="1" cellpadding="4" cellspacing="0" width="850">
				<tr height="15" align="center">
					<th bgcolor="#ccccff" width="70">종류</th>
					<th bgcolor="#ccccff" width="300">가게 이름</th>
					<th bgcolor="#ccccff" width="160">전화번호</th>
					<th bgcolor="#ccccff" width="170">가격대</th>
					<th bgcolor="#ccccff" width="150">작성자</th>
				</tr>
				<tr height="25" align="center">
					<td><%= vo.getKind() %></td>
					<td><%= vo.getName() %></td>
					<td><%= vo.getCall() %></td>
					<td><%= vo.getPrice() %></td>
					<td><%= vo.getWriter() %></td>
				</tr>
				<tr height="15" align="center">
					<th bgcolor="#ccccff">평점(0~10)</th>
					<th bgcolor="#ccccff">위치</th>
					<th bgcolor="#ccccff">배달시간</th>
					<th bgcolor="#ccccff">배달비</th>
					<th bgcolor="#ccccff">작성일</th>
				</tr>
				<tr height="25" align="center">
					<td><%= vo.getRate() %></td>
					<td><%= vo.getLocate() %></td>
					<td><%= vo.getDeliveryTime() %></td>
					<td><%= vo.getDeliveryPay() %></td>
					<td><%= vo.getRegdate() %></td>
				</tr>
				<tr height="15" align="center">
					<th bgcolor="#ccccff" colspan="5">내용</th>
				</tr>
				<tr height="150">
					<td colspan="5"><%= vo.getContent() %></td>
				</tr>
				<% if(mvo.getName().equals(vo.getWriter())) { %>
				<tr height="20">
					<td align="center" colspan="5">
				   			<input type="button" style="height:20pt;" value="수정" onclick="location.href='updateDelivery.jsp?seq=<%= vo.getSeq() %>'"/>
				   			<input type="button" style="height:20pt;" value="삭제" onclick="location.href='deleteDeliveryProc.jsp?seq=<%= vo.getSeq() %>'"/>
				   	</td>
				</tr>
				<% } %>
				<tr height="1">
					<td colspan="5"></td>
				</tr>
				<tr height="30" align="center">
					<th colspan="5" bgcolor="#ccccff">댓글</th>
				</tr>
				<% List<CommentsVO> cList = comd.getCommentList(vo.getSeq());
				   for(CommentsVO cvo : cList) { %>
				   	<tr height="40">
				   		<% if(mvo.getName().equals(cvo.getWriter())) { %>
				   		<td colspan="3"><%= cvo.getWriter() %></td>
				   		<td><%= cvo.getRegdate() %></td>
				   		<td align="center">
				   			<input type="button" style="width:100%; height:20pt;" value="삭제" onclick="location.href='deleteCommentProc.jsp?comSeq=<%= cvo.getComSeq() %>'"/>
				   		</td>
				   		<% } else { %>
				   		<td colspan="3"><%= cvo.getWriter() %></td>
				   		<td colspan="2" align="center"><%= cvo.getRegdate() %></td>
				   		<% } %>
				   	</tr>
				   	<tr height="80">
				   		<td colspan="5"><%= cvo.getContent() %></td>
				   	</tr>
				<% } %>
				<tr>
					<td colspan="4"><textarea name="content" cols="90%" rows="4"></textarea></td>
					<td align="center"><input type="submit" value="댓글 쓰기" height="100%"/></td>
				</tr>
			</table>
		</form>
		<br>
		<% } %>
		
		<br>
		<input type="button" style="width:20%; height:20pt;" value="새글 등록" onclick="location.href='insertDelivery.jsp'"/>
		<input type="button" style="width:20%; height:20pt;" value="메인으로" onclick="location.href='main.jsp'"/>
	</div>
</body>
</html>