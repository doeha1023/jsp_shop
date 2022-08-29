<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.net.URLEncoder" %>

<!-- processShippingInfo : 쿠키를 생성해서 사용자측에 전달 -->
<%
	request.setCharacterEncoding("utf-8");

	//쿠키 객체생성 (key , value)
	//Shipping_cartId / cartId
	Cookie cartId = new Cookie("Shipping_cartId" ,
			URLEncoder.encode(request.getParameter("cartId"),"utf-8"));
	
	Cookie name = new Cookie("Shipping_name" ,
	URLEncoder.encode(request.getParameter("name"),"utf-8"));
	
	Cookie shippingDate = new Cookie("Shipping_shippingDate" ,
	URLEncoder.encode(request.getParameter("shippingDate"),"utf-8"));
	
	Cookie country = new Cookie("Shipping_country" ,
	URLEncoder.encode(request.getParameter("country"),"utf-8"));
	
	Cookie zipCode = new Cookie("Shipping_zipCode" ,
	URLEncoder.encode(request.getParameter("zipCode"),"utf-8"));
	
	Cookie addressName = new Cookie("Shipping_addressName" ,
	URLEncoder.encode(request.getParameter("addressName"),"utf-8"));
	
	//쿠키 수명 설정 : 1일 
	cartId.setMaxAge(24 * 60 * 60);
	name.setMaxAge(24 * 60 * 60);
	zipCode.setMaxAge(24 * 60 * 60);
	country.setMaxAge(24 * 60 * 60);
	addressName.setMaxAge(24 * 60 * 60);
	
	//쿠키 추가해줌 : response로 사용자에게 전달 
	response.addCookie(cartId);
	response.addCookie(name);
	response.addCookie(zipCode);
	response.addCookie(country);
	response.addCookie(addressName);
	response.addCookie(shippingDate);
	
	//주문확인 페이지로 : orderConfirmation.jsp
	response.sendRedirect("orderConfirmation.jsp");
%>