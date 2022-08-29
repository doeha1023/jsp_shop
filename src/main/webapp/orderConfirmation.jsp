<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.net.URLDecoder" %>
<%@ page import = "dto.Product" %>
<%@ page import = "dao.ProductRepository" %>

<%
	request.setCharacterEncoding("utf-8");
	
	//cartId : 세션아이디 저장(사용자마다 고유로 가짐)
	String cartId = session.getId();
	
	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_shippingDate = "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_addressName = "";
	
	//cookies([]) : cookie객체들을 담은배열
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null){
		for(int i = 0; i < cookies.length; i++){
			
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			
			if(n.equals("Shipping_cartId"))
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()),"utf-8");
			
			if(n.equals("Shipping_name"))
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()),"utf-8");
			
			if(n.equals("Shipping_shippingDate"))
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()),"utf-8");
			
			if(n.equals("Shipping_country"))
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()),"utf-8");
			
			if(n.equals("Shipping_zipCode"))
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()),"utf-8");
			
			if(n.equals("Shipping_addressName"))
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()),"utf-8");
			
		}
	}
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<title>주문 정보</title>
</head>
</html>