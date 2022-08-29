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
	
	/* //3.id와 일치하는 product를 받아옴(그냥 위쪽의 product써도될듯)
	ArrayList<Product> goodsList = dao.getAllProducts();
	Product goods = new Product();
	for(int i = 0; i < goodsList.size(); i++){
		goods = goodsList.get(i);
		if(goods.getProductId().equals(id)){
			break;
		}
	} */
	
	//4.장바구니 생성
	ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cartlist");
	if(list == null){
		list = new ArrayList<Product>();
		session.setAttribute("cartlist" , list);
	}
	
	//5.장바구니에 상품 추가
	//처음 추가하는 경우를 따로 나눠둔 이유 : 그래야 상품추가는 한번하되, 수량만 늘릴 수 있어서.
	int cnt = 0;
	Product goodsQnt = new Product();
	for(int i = 0; i < list.size(); i++){
		goodsQnt = list.get(i);
		//장바구니에 id와 일치하는 상품이 있는지 확인
		if(goodsQnt.getProductId().equals(id)){
			cnt++;
			//있으면 있던 상품의 수량만 1 늘림
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}
	
	//해당 id의 상품이 처음 장바구니에 추가되는 경우
	if(cnt == 0){
		product.setQuantity(1);
		list.add(product);
	}
	
	response.sendRedirect("product.jsp?id=" + id);
	
%>