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
	
	<div align="center">
	<h2>배달 마스터</h2><hr>
		<h2>글 등록</h2>
		<br>
		<form action="insertDeliveryProc.jsp" method="post">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<th bgcolor="#ccccff" width="120">가게 이름</th>
					<td align="left"><input style="width:99%" name="name" type="text" /></td>
				</tr>
				<tr>
					<th bgcolor="#ccccff">종류</th>
					<td align="left">
						<select name="kind">
							<option value="k1">치킨</option>
							<option value="k2">피자</option>
							<option value="k3">떡볶이</option>
							<option value="k4">돈까스,일식</option>
							<option value="k5">중식</option>
							<option value="k6">한식</option>
							<option value="k7">기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<th bgcolor="#ccccff">전화 번호</th>
					<td align="left"><input style="width:60%" name="call" type="text" /></td>
				</tr>
				<tr>
					<th bgcolor="#ccccff">위치</th>
					<td align="left"><input style="width:99%" name="locate" type="text" /></td>
				</tr>
				<tr>
					<th bgcolor="#ccccff">가격</th>
					<td align="left"><input style="width:60%" name="price" type="text" /></td>
				</tr>
				<tr>
					<th bgcolor="#ccccff">평점 (0 ~ 10)</th>
					<td align="left"><input style="width:10%" name="rate" type="text" /></td>
				</tr>
				<tr>
					<th bgcolor="#ccccff">배달 시간</th>
					<td align="left"><input style="width:60%" name="deliveryTime" type="text" /></td>
				</tr>
				<tr>
					<th bgcolor="#ccccff">배달비(가격만 숫자로 입력)</th>
					<td align="left"><input style="width:10%" name="deliveryPay" type="text" /></td>
				</tr>
				<tr>
					<th bgcolor="#ccccff">내용</th>
					<td align="left"><textarea name="content" cols="40" rows="10"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="새글등록" /></td>
				</tr>
			</table>
		
		</form>
		<hr>
		<a href="delivery.jsp">글목록</a>
	</div>
</body>
</html>