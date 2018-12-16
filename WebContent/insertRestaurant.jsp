<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.vo.MemberVO" %>
<%
	if(session.getAttribute("memberVO") == null) {
		response.sendRedirect("login.jsp");
	}
	MemberVO mvo = (MemberVO) session.getAttribute("memberVO");	
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
	<h2>맛집 마스터</h2><hr>
	<div align="center">
		<h2>글 등록</h2>
		<br>
		<form action="insertRestaurantProc.jsp" method="post">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="#ccffcc" width="120">가게 이름</td>
					<td align="left"><input style="width:99%" name="name" type="text" /></td>
				</tr>
				<tr>
					<th bgcolor="#ccffcc">종류</th>
					<td align="left">
						<select name="type">
							<option value="t1">밥</option>
							<option value="t2">면</option>
							<option value="t3">고기</option>
							<option value="t4">술</option>
							<option value="t5">기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<th bgcolor="#ccffcc">위치</th>
					<td align="left">
						<select name="locate">
							<option value="l1">용인시청</option>
							<option value="l2">명지대사거리</option>
							<option value="l3">이약국</option>
							<option value="l4">용인시내</option>
							<option value="l5">용인터미널</option>
							<option value="l6">기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<th bgcolor="#ccffcc">상세 위치</th>
					<td align="left"><input style="width:99%" name="address" type="text" /></td>
				</tr>
				<tr>
					<th bgcolor="#ccffcc">가격</th>
					<td align="left"><input style="width:30%" name="price" type="text" /></td>
				</tr>
				<tr>
					<th bgcolor="#ccffcc">평점 (0 ~ 10)</th>
					<td align="left"><input style="width:10%" name="rate" type="text" /></td>
				</tr>
				<tr>
					<th bgcolor="#ccffcc">내용</th>
					<td align="left"><textarea name="content" cols="40" rows="10"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="새글등록" /></td>
				</tr>
			</table>
		
		</form>
		<hr>
		<a href="restaurant.jsp">글목록</a>
	</div>
</body>
</html>