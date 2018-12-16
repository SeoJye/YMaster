<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.dao.TaxiDAO" %>
<%@ page import="ymaster.vo.TaxiVO" %>
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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updatetaxi</title>
</head>
<body>
<div align="right">
		<h4><%= mvo.getName()%>  <a href="logoutProc.jsp">logout</a> </h4>
	</div>
	<div align="center">
	<h2>택시 마스터</h2><hr>
		<h2> 글수정 </h2>
		
		<hr>
		<form action="taxiUpdateProc.jsp" method="post">
		<input type ="hidden" name= "seq" value ="<%=taxi.getSeq() %>"/>
		<table border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td>제목</td>
				<td align="left"><input name="title" type="text" value="<%=taxi.getTitle() %>" /></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td align="left"><%=taxi.getWriter() %>
				</td>
			</tr>
			<tr>
				<td>출발지</td>
				<td>
					<select name ="destination">
						<option value="시청">시청</option>
						<option value="명지대사거리">명지대 사거리</option>
						<option value="이약국">이약국</option>
						<option value="CGV">CGV</option>
						<option value="터미널">터미널</option>
						<option value="학교">학교</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>목적지</td>
				<td>
					<select name ="starting">
						<option value="시청">시청</option>
						<option value="명지대사거리">명지대 사거리</option>
						<option value="이약국">이약국</option>
						<option value="CGV">CGV</option>
						<option value="터미널">터미널</option>
						<option value="학교">학교</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>시간</td>
				<td> <select name ="time"> <option value="am">AM</option><option value="pm">PM</option></select>
				<select name ="timeHour"> <option value="07">07</option><option value="08">08</option></select>시
				<select name ="timeMinute"> <option value="00">00</option><option value="08">01</option></select>분</td>
			</tr>
			<tr>
				<td>내용</td>
				<td align="left"><textarea  name="content" cols="40" rows="10">
				<%=taxi.getContent()%></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"> <input type="submit" value="확인" />
				<input type="button" style="height:20pt;" value="취소" onclick="location.href='taxiList.jsp'"/></td>
				
			</tr>
			
		</table>
		</form>
		<hr>
		
		<a href="taxiList.jsp">글목록</a>
	</div>

</body>
</html>