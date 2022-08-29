<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<title>배송 정보</title>
<!-- shippingInfo.jsp : 사용자에게 배송정보 입력받아서 처리.(processShippingInfo.jsp) -->
</head>
<body>
	<!-- 메뉴바 + 배송정보 jumbotron -->
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">배송 정보</h1>
		</div>
	</div>
	
	<!-- 배송정보 입력 : processShippingInfo.jsp로 이동 -->
	<div class="container">
		<form action="./processShippingInfo.jsp" class="form-horizontal" method="post">
			<!-- sessionId : input type hidden으로 입력받는것이 아닌 프로그램 내에서 전송시킴 -->
			<input type="hidden" name="cartId" value="<%=request.getParameter("cartId")%>"/>
			
			<!-- 성명 입력란 : name -->
			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control"/>
				</div>
			</div>
			
				<!-- 배송일 입력란 : shippingDate -->
			<div class="form-group row">
				<label class="col-sm-2">배송일</label>
				<div class="col-sm-3">
					<input name="shippingDate" type="text" class="form-control"/>(yyyy/mm/dd)
				</div>
			</div>
			
				<!-- 국가 입력란 : country -->
			<div class="form-group row">
				<label class="col-sm-2">국가명</label>
				<div class="col-sm-3">
					<input name="country" type="text" class="form-control"/>
				</div>
			</div>
			
				<!-- 우편번호 입력란 : zipCode -->
			<div class="form-group row">
				<label class="col-sm-2">우편번호</label>
				<div class="col-sm-3">
					<input name="zipCode" type="text" class="form-control"/>
				</div>
			</div>
			
				<!-- 주소 입력란 : addressName -->
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-5">
					<input name="addressName" type="text" class="form-control"/>
				</div>
			</div>
			
			<div class = "form-group-row">
				<div class="col-sm-offset-2 col-sm-10">
					<!-- 이전 : 다시 장바구니로 돌아감 + cartId -->
					<a href = "./cart.jsp?cartId=<%=request.getParameter("cartId")%>"
						class="btn btn-secondary" role="button"> 이전 </a>
					
					<!-- 제출 : submit + processShippingInfo.jsp로 이동-->	
					<input type = "submit" class="btn btn-primary" value="등록"/>
					
					<!-- 취소 : checkOutCancelled.jsp로 이동 -->
					<a href = "./checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>	
				</div>
			</div>
		</form>
		
	</div>
</body>
</html>