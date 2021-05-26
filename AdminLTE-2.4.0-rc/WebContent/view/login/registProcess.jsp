<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String memberID = request.getParameter("email");
	String password= request.getParameter("pwd");
	String pwdchk= request.getParameter("pwdchk");
	String name = request.getParameter("name");
	String email = request.getParameter("email");

	if (password.equals(pwdchk) || password == pwdchk) {
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
	
		try {
			String jdbcDriver = "jdbc:mysql://localhost:3306/chap14?" +
								"useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
			String dbUser = "jspexam";
			String dbPass = "jsppw";
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement("insert into MEMBERS values (?, ?, ?, ?)");
			pstmt.setString(1, memberID);
			pstmt.setString(2, password);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			
			pstmt.executeUpdate();
			response.sendRedirect("../login/login.jsp");
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}else{
		%>
		<script>
		alert("비밀번호 확인이 일치하지 않습니다.");
		history.back();
		</script>	
		<%
	}
%>
<html>
<head>
<title>회원가입 확인</title>
</head>
<body>