<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.vo.RestaurantVO" %>
<%@ page import="ymaster.dao.RestaurantDAO" %>
<%@ page import="ymaster.vo.MemberVO" %>
<%
	if(session.getAttribute("memberVO") == null) {
		response.sendRedirect("login.jsp");
	}

	MemberVO mvo = (MemberVO) session.getAttribute("memberVO");

	String seq = (String) request.getParameter("seq");
	
	RestaurantDAO dao = new RestaurantDAO();
	RestaurantVO vo = dao.getRestaurant(seq);
	
	String searcht = vo.getType();
	String searchl = vo.getLocate();
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
		<h2>글 수정</h2>
		<br>
		<form action="updateRestaurantProc.jsp?seq=<%= vo.getSeq() %>" method="post">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<th bgcolor="#ccffcc" width="120">가게 이름</th>
					<td align="left"><input style="width:99%" name="name" type="text" value="<%=vo.getName() %>" /></td>
				</tr>
				<tr>
					<th bgcolor="#ccffcc">종류</th>
					<td align="left">
						<select name="type">
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
				</tr>
				<tr>
					<th bgcolor="#ccffcc">위치</th>
					<td align="left">
						<select name="locate">
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
				<tr>
					<th bgcolor="#ccffcc">상세 위치</th>
					<td align="left"><input style="width:99%" name="address" type="text" value="<%=vo.getAddress() %>"/></td>
				</tr>
				<tr>
					<th bgcolor="#ccffcc">가격</th>
					<td align="left"><input style="width:30%" name="price" type="text" value="<%=vo.getPrice() %>"/></td>
				</tr>
				<tr>
					<th bgcolor="#ccffcc">평점 (0 ~ 10)</th>
					<td align="left"><input style="width:10%" name="rate" type="text" value="<%=vo.getRate() %>"/></td>
				</tr>
				<tr>
					<th bgcolor="#ccffcc">내용</th>
					<td align="left"><textarea name="content" cols="40" rows="10"><%=vo.getContent() %></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="글 수정" /></td>
				</tr>
			</table>
		
		</form>
		<hr>
		<a href="restaurant.jsp">글목록</a>
	</div>
</body>
</html>