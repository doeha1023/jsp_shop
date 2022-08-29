<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "dto.Product" %>
<%@ page import = "dao.ProductRepository" %>

<%
	//1.id 잘 받아왔나 유효성검사
	String id = request.getParameter("id");
	if(id == null || id.trim().equals("")){
		response.sendRedirect("products.jsp");
		return;
	}
	
	//2.dao에서 product잘 받아왔나 유효성검사
	ProductRepository dao = ProductRepository.getInstance();
	
	Product product = dao.getProductById(id);
	if(product == null){
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	//3.장바구니에서 상품 삭제
	ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
	
	Product goodsQnt = new Product();
	for(int i = 0; i < cartList.size(); i++){
		goodsQnt = cartList.get(i);
		//장바구니안의 상품들 중에서 id와 해당하는 상품 삭제
		if(goodsQnt.getProductId().equals(id)){
			cartList.remove(goodsQnt);
		}
	}
	
	response.sendRedirect("cart.jsp");
	
%>