<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ymaster.dao.RestaurantDAO" %>
<%@ page import="ymaster.vo.RestaurantVO" %>
<%@ page import="ymaster.vo.MemberVO" %>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String type = request.getParameter("type");
	String locate = request.getParameter("locate");
	String address = request.getParameter("address");
	String price = request.getParameter("price");
	String rate = request.getParameter("rate");
	String content = request.getParameter("content");
	String seq = (String) request.getParameter("seq");
	
	MemberVO member = new MemberVO();
	member = (MemberVO) session.getAttribute("memberVO");
	String writer = member.getName();
	
	if(type.equals("t1")) type = "밥";
	else if(type.equals("t2")) type = "면";
	else if(type.equals("t3")) type = "고기";
	else if(type.equals("t4")) type = "술";
	else if(type.equals("t5")) type = "기타";
	
	if(locate.equals("l1")) locate = "용인시청";
	else if(locate.equals("l2")) locate = "명지대사거리";
	else if(locate.equals("l3")) locate = "이약국";
	else if(locate.equals("l4")) locate = "용인시내";
	else if(locate.equals("l5")) locate = "용인터미널";
	else if(locate.equals("l6")) locate = "기타";
	
	RestaurantVO vo = new RestaurantVO();
	vo.setName(name);
	vo.setType(type);
	vo.setLocate(locate);
	vo.setAddress(address);
	vo.setPrice(price);
	vo.setRate(Integer.parseInt(rate));
	vo.setContent(content);
	vo.setWriter(writer);
	vo.setSeq(seq);

	RestaurantDAO dao = new RestaurantDAO();
	dao.updateRestaurant(vo);

	if(member.getRole() == 1) response.sendRedirect("adminRestaurant.jsp");
	else response.sendRedirect("restaurant.jsp");
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