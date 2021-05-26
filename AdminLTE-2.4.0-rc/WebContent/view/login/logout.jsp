<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
		/* 0520 쿠키로그인 
		Cookie user = new Cookie("id", null);
		user.setPath("/");
		user.setMaxAge(0);
		response.addCookie(user); 
		*/
		session.invalidate();//0520 세션로그인		
		response.sendRedirect("login.jsp");
	%>
</body>
</html>