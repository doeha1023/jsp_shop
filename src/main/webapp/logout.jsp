<%@ page contentType="text/html; charset=utf-8"%>

<%	
	//??로그아웃을 위해 session을 닫는다는 건 로그인 정보(username, password)가 session에 저장된다는 의미인가?
	session.invalidate();
	//addProduct로 가면 로그인을 다시해야함
	response.sendRedirect("addProduct.jsp");
%>