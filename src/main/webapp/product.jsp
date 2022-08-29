<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "dto.Product" %>
<%@page import = "dao.ProductRepository" %>

<jsp:useBean id = "productDAO" class = "dao.ProductRepository" scope = "session"/>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet"
	href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/
	bootstrap.min.css">
	
<link rel = "stylesheet" href = "./recources/css/bootstrap.min.css"/>

<meta charset="UTF-8">
<title>상품 상세 정보</title>
<script type = "text/javascript">
	function addToCart(){
	/*confirm : 경고창 표시 */
	if(confirm("상품을 장바구니에 추가하시겠습니까?"))
		/*confirm이 true면 제출(확인버튼 누를 시)*/
		document.addForm.submit();
	else
		document.addForm.reset();
	}
</script>
</head>
<body>	
	<jsp:include page = "menu.jsp"/>
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">상품 정보</h1>
		</div>
	</div>
	
	<%
		String id = request.getParameter("id");
		//productRepository에 있는 getProductById메소드에 id값을 적용하여 해당하는 id
		//의 데이터를 불러와 product에 넣어준다.
		ProductRepository dao = ProductRepository.getInstance();
		Product product = dao.getProductById(id);
	%>
	
	<div class = "container">
		<div class = "row">
			<div class = "col-md-5">
				<img src = "./resources/images/<%=product.getFilename()%>" style = "width: 100%">
			</div>
			<div class = "col-md-6">
				<h3><%=product.getPname() %></h3>
				<p><%=product.getDescription()%>
				<p> <b>상품 코드 : </b><span class = "badge badge-danger">
					<%=product.getProductId() %></span>
				<p> <b>제조사</b> : <%=product.getManufacturer() %>
				<p> <b>분류</b> : <%=product.getCategory() %>
				<p> <b>재고 수</b> : <%=product.getUnitsInStock() %>
				<h4><%=product.getUnitPrice() %>원</h4>
				<p><form name = "addForm" action="./addCart.jsp?id=<%=product.getProductId()%>"
					method="post">
					<!--onclick : 클릭하면 javascript function실행 -->
				    <a href = "#" class = "btn btn-info" onclick="addToCart()">상품 주문 &raquo;</a>
					<a href = "./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
					<a href = "./products.jsp" class = "btn btn-secondary">상품 목록
					&raquo;</a>
				</form>
			</div>
		</div>
		<hr>
	</div>
	
	<jsp:include page = "footer.jsp"/>
</body>
</html>