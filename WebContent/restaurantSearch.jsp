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

	RestaurantDAO dao = new RestaurantDAO();

	String searcht = request.getParameter("searchConditionType");
	String searchl = request.getParameter("searchConditionLocate");
	
	if(searcht.equals("t1")) searcht = "밥";
	else if(searcht.equals("t2")) searcht = "면";
	else if(searcht.equals("t3")) searcht = "고기";
	else if(searcht.equals("t4")) searcht = "술";
	else if(searcht.equals("t5")) searcht = "기타";
	
	if(searchl.equals("l1")) searchl = "용인시청";
	else if(searchl.equals("l2")) searchl = "명지대사거리";
	else if(searchl.equals("l3")) searchl = "이약국";
	else if(searchl.equals("l4")) searchl = "용인시내";
	else if(searchl.equals("l5")) searchl = "용인터미널";
	else if(searchl.equals("l6")) searchl = "기타";
	
	System.out.println(searchl);
	System.out.println(searcht);
	
	List<RestaurantVO> rList = dao.getRestaurantListSearch2(searchl, searcht);
	if(searchl.equals("l0") && !searcht.equals("t0")) rList = dao.getRestaurantListSearchType(searcht);
	else if(!searchl.equals("l0") && searcht.equals("t0")) rList = dao.getRestaurantListSearchLocate(searchl);
	else if(searchl.equals("l0") && searcht.equals("t0")) response.sendRedirect("restaurant.jsp");
	
	MemberVO mvo = (MemberVO) session.getAttribute("memberVO");
	
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
		<form action="restaurantSearch.jsp" method="post">
			<table border="1" cellpadding="0" width="700">
				<tr>
					<td>종류 검색</td>
					<td align="right">
						<select name="searchConditionType">
							<option value="t0">선택</option>
							<% if(searcht.equals("밥")) { %>
							<option selected value="t1">밥</option>
							<% } else { %>
							<option value="t1">밥</option>
							<% } %>
							<% if(searcht.equals("면")) { %>
							<option selected value="t2">면</option>
							<% } else { %>
							<option value="t2">면</option>
							<% } %>
							<% if(searcht.equals("고기")) { %>
							<option selected value="t3">고기</option>
							<% } else { %>
							<option value="t3">고기</option>
							<% } %>
							<% if(searcht.equals("술")) { %>
							<option selected value="t4">술</option>
							<% } else { %>
							<option value="t4">술</option>
							<% } %>
							<% if(searcht.equals("술")) { %>
							<option selected value="t5">기타</option>
							<% } else { %>
							<option value="t5">기타</option>
							<% } %>
						</select>
					</td>
					<td width="30" rowspan="2"><input type="submit" value="검색" width="100%"/></td>
				</tr>
				<tr>
					<td>위치 검색</td>
					<td align="right">
						<select name="searchConditionLocate">
							<option value="l0">선택</option>
							<% if(searchl.equals("용인시청")) { %>
							<option selected value="l1">용인시청</option>
							<% } else { %>
							<option value="l1">용인시청</option>
							<% } %>
							<% if(searchl.equals("명지대사거리")) { %>
							<option selected value="l2">명지대사거리</option>
							<% } else { %>
							<option value="l2">명지대사거리</option>
							<% } %>
							<% if(searchl.equals("이약국")) { %>
							<option selected value="l3">이약국</option>
							<% } else { %>
							<option value="l3">이약국</option>
							<% } %>
							<% if(searchl.equals("용인시내")) { %>
							<option selected value="l4">용인시내</option>
							<% } else { %>
							<option value="l4">용인시내</option>
							<% } %>
							<% if(searchl.equals("용인터미널")) { %>
							<option selected value="l5">용인터미널</option>
							<% } else { %>
							<option value="l5">용인터미널</option>
							<% } %>
							<% if(searchl.equals("기타")) { %>
							<option selected value="l6">기타</option>
							<% } else { %>
							<option value="l6">기타</option>
							<% } %>
						</select>
					</td>
				</tr>
			</table>
		</form>
		<br>
		
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
				<% if(mvo.getName().equals(vo.getWriter())) { %>
				<tr height="20">
					<td align="center" colspan="5">
				   			<input type="button" style="height:20pt;" value="수정" onclick="location.href='updateRestaurant.jsp?seq=<%= vo.getSeq() %>'"/>
				   			<input type="button" style="height:20pt;" value="삭제" onclick="location.href='deleteRestaurantProc.jsp?seq=<%= vo.getSeq() %>'"/>
				   	</td>
				</tr>
				<% } %>
				<tr height="1">
					<td colspan="5"></td>
				</tr>
				<tr height="30" align="center">
					<th colspan="5" bgcolor="#ccffcc">댓글</th>
				</tr>
				<% List<CommentsVO> cList = comd.getCommentList(vo.getSeq());
				   for(CommentsVO cvo : cList) { %>
				   	<tr height="40">
				   		<% if(mvo.getName().equals(cvo.getWriter())) { %>
				   		<td colspan="3"><%= cvo.getWriter() %></td>
				   		<td><%= cvo.getRegdate() %></td>
				   		<td align="center">
				   			<!--<input type="button" style="width:100%; height:20pt;" value="수정" onclick="location.href='updateCommentProc.jspcomSeq=<%= cvo.getComSeq() %>'"/>-->
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
					<td colspan="4"><textarea name="content" cols="72%" rows="4"></textarea></td>
					<td align="center"><input type="submit" value="댓글 쓰기" height="100%"/></td>
				</tr>
			</table>
		</form>
		<br>
		<% } %>
		
		<br>
		<input type="button" style="width:20%; height:20pt;" value="새글 등록" onclick="location.href='insertRestaurant.jsp'"/>
		<input type="button" style="width:20%; height:20pt;" value="메인으로" onclick="location.href='main.jsp'"/>
	</div>
</body>
</html>