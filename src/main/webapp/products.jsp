<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "dto.Product" %>
<%@ page import = "dao.ProductRepository" %>
<!-- useBean은 요약하자면 클래스를 불러와 , id로 사용을 하는것이다.
 불러올 클래스는 ProductRepository클래스이고 , id는 productDAO이다. scope는 범위를 의미한다. -->
<jsp:useBean id = "productDAO" class = "dao.ProductRepository" scope = "session"/>
<link rel = "stylesheet" href = "./recources/css/bootstrap.min.css"/>

<!DOCTYPE html>
<html>
<head>

<link rel = "stylesheet"
	href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/
	bootstrap.min.css">
	
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>
	
	<!-- menu.jsp 파일을 포함시켜준다.(menu안에는 welcome과 footer이 포함되어있다) -->
	<jsp:include page = "menu.jsp" />
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">상품목록</h1>
		</div>
	</div>
	
	<%
	//서로 같은 주소를 공유하는 getInstance메소드를 이용하여 ProductRepository의 인스턴스를 dao로 생성해준다.
		ProductRepository dao = ProductRepository.getInstance();
	//dao에 담긴 데이터들을 listOfProducts1에 담아준다 . (ArrayList)
		ArrayList<Product> listOfProducts1 = dao.getAllProducts();
	%>
	
	<div class = "container">
		<div class = "row" align = "center">
				<%
					//listOfProducts1의 i번째 데이터를 Product타입의 product에 담아준다.
					//참고로 ArrayList도 배열의 일종이며 데이터가 순서대로 저장된다.
					for(int i = 0; i < listOfProducts1.size(); i++){
						Product product = listOfProducts1.get(i);
				%>
				<!-- 상품의 이름 , 설명 , 가격을 출력한다 -->
				<div class = "col-md-4">
					<img src="./resources/images/<%=product.getFilename()%>" style = "width:100%">
					<h3><%=product.getPname()%></h3>
					<p><%=product.getDescription()%>
					<p><%=product.getUnitPrice() %>
					
					<!-- 상세정보를 클릭하면 a href의 링크로 이동하게 된다. &raquo; 는 << 를 의미. -->
					<!-- product.jsp?id=부분은 상세정보를 클릭했을 때 url을 자세히 보면 , 저런형식으로 되어있음을 알 수 있다.
					id 가 product.getProductId()인 상품의 상세정보를 본다는 의미다. -->
					<p> <a href = "./product.jsp?id=<%=product.getProductId()%>"
						class = "btn btn-secondary" role = "button">상세정보 &raquo;></a>
				</div>
				<%
					//for문 종료.
					}
				%>
			</div>
			<hr>
		</div>
		<jsp:include page = "footer.jsp" />
</body>
</html>