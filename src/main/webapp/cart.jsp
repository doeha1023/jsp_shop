<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "dto.Product" %>
<%@ page import = "dao.ProductRepository" %>
<html>
<head>
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<%
	String cartId = session.getId();
%>
<title>장바구니</title>
</head>
<body>
	<jsp:include page = "menu.jsp"/>
	
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">장바구니</h1>
		</div>
	</div>
	
	<div class = "container">
		<!-- 주문 / 전체삭제 버튼 -->
		<div class = "row">
			<table width = "100%">
				<tr>
					<td align = "left">
						<a href="./deleteCart.jsp?cartId=<%=cartId %>" class="btn btn-danger">삭제하기</a></td>
					<td align = "right">
						<a href="./shippingInfo.jsp?cartId=<%=cartId %>" class="btn btn-success">주문하기</a></td>
				</tr>
			</table>
		</div>
		
		<!-- 장바구니 상품리스트표 -->
		<div style = "padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				<%	
					int sum = 0; //총가격
					ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
					//장바구니에 추가된 상품이 없을 시
					if(cartList == null)
						cartList = new ArrayList<Product>();
					
					//상품 리스트 : 하나씩 출력하기
					for(int i = 0; i<cartList.size(); i++){
						Product product = cartList.get(i);
						int total = product.getUnitPrice() * product.getQuantity();
						sum = sum + total;
				%>
				<tr>
					<td><%=product.getProductId() %> - <%=product.getPname() %></td>
					<td><%=product.getUnitPrice() %></td>
					<td><%=product.getQuantity() %></td>
					<td><%=total%></td>
					<td><a href="./removeCart.jsp?id=<%=product.getProductId()%>" class="badge badge-danger">삭제</a></td>
				</tr>
				<%
					}
				%>
			</table>	
	</div>
</body>
</html>