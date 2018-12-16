<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.dao.DeliveryDAO" %>
<%@ page import="ymaster.vo.DeliveryVO" %>
<%@ page import="ymaster.vo.MemberVO" %>
<%
	if(session.getAttribute("memberVO") == null) {
		response.sendRedirect("login.jsp");
	}

	MemberVO mvo = (MemberVO) session.getAttribute("memberVO");

	String seq = (String) request.getParameter("seq");

	DeliveryDAO dao = new DeliveryDAO();
	DeliveryVO vo = dao.getDelivery(seq);
	
	String search = vo.getKind();
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
		<h2>글 수정</h2>
		<br>
		<form action="updateDeliveryProc.jsp?seq=<%= vo.getSeq() %>" method="post">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<th bgcolor="#ccccff" width="120">가게 이름</th>
					<td align="left"><input style="width:99%" name="name" type="text" value="<%=vo.getName() %>"/></td>
				</tr>
				<tr>
					<th bgcolor="#ccccff">종류</th>
					<td align="left">
						<select name="kind">
						<% if(search.equals("치킨")) { %>
							<option selected value="k1">치킨</option>
							<% } else { %>
							<option value="k1">치킨</option>
							<% } %>
							<% if(search.equals("피자")) { %>
							<option selected value="k2">피자</option>
							<% } else { %>
							<option value="k2">피자</option>
							<% } %>
							<% if(search.equals("떡볶이")) { %>
							<option selected value="k3">떡볶이</option>
							<% } else { %>
							<option value="k3">떡볶이</option>
							<% } %>
							<% if(search.equals("돈가스,일식")) { %>
							<option selected value="k4">돈까스,일식</option>
							<% } else { %>
							<option value="k4">돈까스,일식</option>
							<% } %>
							<% if(search.equals("중식")) { %>
							<option selected value="k5">중식</option>
							<% } else { %>
							<option value="k5">중식</option>
							<% } %>
							<% if(search.equals("한식")) { %>
							<option selected value="k5">한식</option>
							<% } else { %>
							<option value="k6">한식</option>
							<% } %>
							<% if(search.equals("기타")) { %>
							<option selected value="k5">기타</option>
							<% } else { %>
							<option value="k7">기타</option>
							<% } %>
						</select>
					</td>
				</tr>
				<tr>
					<th bgcolor="#ccccff">전화 번호</th>
					<td align="left"><input style="width:60%" name="call" type="text" value="<%=vo.getCall() %>"/></td>
				</tr>
				<tr>
					<th bgcolor="#ccccff">위치</th>
					<td align="left"><input style="width:99%" name="locate" type="text" value="<%=vo.getLocate() %>"/></td>
				</tr>
				<tr>
					<th bgcolor="#ccccff">가격</th>
					<td align="left"><input style="width:60%" name="price" type="text" value="<%=vo.getPrice() %>"/></td>
				</tr>
				<tr>
					<th bgcolor="#ccccff">평점 (0 ~ 10)</th>
					<td align="left"><input style="width:10%" name="rate" type="text" value="<%=vo.getRate() %>"/></td>
				</tr>
				<tr>
					<th bgcolor="#ccccff">배달 시간</th>
					<td align="left"><input style="width:60%" name="deliveryTime" type="text" value="<%=vo.getDeliveryTime() %>"/></td>
				</tr>
				<tr>
					<th bgcolor="#ccccff">배달비(가격만 숫자로 입력)</th>
					<td align="left"><input style="width:10%" name="deliveryPay" type="text" value="<%=vo.getDeliveryPay() %>"/></td>
				</tr>
				<tr>
					<th bgcolor="#ccccff">내용</th>
					<td align="left"><textarea name="content" cols="40" rows="10"><%=vo.getContent() %></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="글 수정" /></td>
				</tr>
			</table>
		
		</form>
		<hr>
		<a href="delivery.jsp">글목록</a>
	</div>
</body>
</html>