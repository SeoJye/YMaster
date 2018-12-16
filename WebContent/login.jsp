<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>용인마스터</title>
</head>
<body>
	<div align="center" style='line-height:170%'>
		<h3>로그인</h3><hr>
   		<form method="post" action="loginProc.jsp">
 		  	아 이 디 : <input type="text" size="20" name="id"/> <br>
 		 	비밀번호 : <input type="password" size="20" name="password"/> <br>
  	 		<input type="submit" style="height:20pt;" value="로그인"/>
  	 		<input type="button" style="height:20pt;" value="회원가입" onclick="location.href='join.jsp'"/>
  		</form>
	</div>
</body>
</html>