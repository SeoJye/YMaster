<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.dao.TaxiDAO" %>
<%@ page import="ymaster.vo.TaxiVO" %>
<%
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
<title>commentsInsert</title>
</head>
<body>
<div align="center">
		
		<hr>
		<form action="commentInsertProc.jsp" method="post">
		<input type ="hidden" name= "seq" value ="<%=taxi.getSeq() %>"/>
		<table border="1" cellpadding="0" cellspacing="0">
			<tr align="center">
				<td bgcolor="pink" colspan="2"> 댓글 쓰기</td>
			</tr>
			<tr>
				<td>내용</td>
				<td align="left"><textarea  name="content" cols="30" rows="1"></textarea>
				</td>
			</tr>
			<tr>
				<td>카톡아이디</td>
				<td align="left"><textarea  name="writer" cols="30" rows="1"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"> <input type="submit" value="등록" />
				
				<input type="button" value="취소" onclick="location.href='taxiList.jsp'"/></td>
			</tr>
			
		</table>
		</form>
		<hr>
	</div>
</body>

</html>