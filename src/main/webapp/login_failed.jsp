<%
	//로그인 실패시 로그인 페이지로 error값을 들고간다
	//(error값을 들고가게되면 error는 null이 아니게됨)
	response.sendRedirect("login.jsp?error=1");
%>