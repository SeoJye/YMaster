<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.dao.DeliveryDAO" %>
<%@ page import="ymaster.vo.DeliveryVO" %>
<%@ page import="ymaster.vo.MemberVO" %>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String kind = request.getParameter("kind");
	String locate = request.getParameter("locate");
	String call = request.getParameter("call");
	String price = request.getParameter("price");
	String rate = request.getParameter("rate");
	String content = request.getParameter("content");
	String deliveryTime = request.getParameter("deliveryTime");
	String deliveryPay = request.getParameter("deliveryPay");
	
	MemberVO member = new MemberVO();
	member = (MemberVO) session.getAttribute("memberVO");
	String writer = member.getName();
	
	if(kind.equals("k1")) kind = "치킨";
	else if(kind.equals("k2")) kind = "피자";
	else if(kind.equals("k3")) kind = "떡볶이";
	else if(kind.equals("k4")) kind = "돈까스,일식";
	else if(kind.equals("k5")) kind = "중식";
	else if(kind.equals("k6")) kind = "한식";
	else if(kind.equals("k7")) kind = "기타";

	DeliveryVO vo = new DeliveryVO();
	vo.setName(name);
	vo.setKind(kind);
	vo.setLocate(locate);
	vo.setCall(call);
	vo.setPrice(price);
	vo.setRate(Integer.parseInt(rate));
	vo.setContent(content);
	vo.setWriter(writer);
	vo.setDeliveryPay(Integer.parseInt(deliveryPay));
	vo.setDeliveryTime(deliveryTime);

	DeliveryDAO dao = new DeliveryDAO();
	dao.insertDelivery(vo);

	if(member.getRole() == 1) response.sendRedirect("adminDelivery.jsp");
	else response.sendRedirect("delivery.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>