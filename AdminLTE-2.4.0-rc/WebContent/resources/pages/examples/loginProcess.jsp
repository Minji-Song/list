<%@ page contentType="text/html; charset=utf-8"%>
<%
	String id = request.getParameter("email");
	String pw = request.getParameter("password");

	if (id.equals("hanguk@naver.com") || id == "hanguk@naver.com") {
		request.getSession().setAttribute("id", id);
		response.sendRedirect("../../index.jsp");
		if (pw.equals("1234")) { //방문자가 입력한 pw가 "1234"와 일치할 경우

		} else { //비밀번호가 일치하지 않을 경우
			%>
			<script>
			alert("비밀번호가 틀립니다.");
			history.back();
			</script>	
		<%
		}
	} else { //방문자가 입력한 id가 일치하지 않을 경우
		%>
		<script>
		alert("존재하지 않는 아이디입니다.");
		history.back();
		</script>	
	<%
	}
%>
<html>
<head>
<title>로그인 확인</title>
</head>
<body>