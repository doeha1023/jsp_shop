<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- fmt (다국어처리) 에 필요한 소스링크 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet"
	href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/
	bootstrap.min.css">
<meta charset="UTF-8">
<title>상품 등록</title>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message">
	<jsp:include page = "menu.jsp"/>
	<div class = "jumbotron">
		<div class = "container">
			<!-- 다국어 처리가 필요한 부분마다 key로 value값을 불러와 사용 -->
			<h1 class = "display-3"><fmt:message key="title"/></h1>
		</div>
	</div>
	<!-- 언어 선택할 수 있는 링크 만든다 -->
	<div class = "container">
		<div class="text-right">
			<!--?? language en이라는 정보는 request로 가게되는걸까? 
				   링크를 눌렀을 때 language만 바뀌는걸까 아니면 language랑 locale이 같이 바뀌는걸까-->
			<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
			
			<a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
		</div>
		
		<form name = "newProduct" action="./processAddProduct.jsp"
		class = "form-horizontal" method = "post" enctype = "multipart/form-data">
	<!--  name 은 변수같은 개념 , value는 값 같은 개념으로 보면 된다. -->
			<div class = "form-group row">
				<label class = "col-sm-2"><fmt:message key="productId"/></label>
				<div class = "col-sm-3">
					<input type = "text" name = "productId" class = "form-control">
				</div>
			</div>
			<div class = "form-group row">
				<label class = "col-sm-2"><fmt:message key="pname"/></label>
				<div class = "col-sm-3">
					<input type = "text" name = "name" class = "form-control">
				</div>
			</div>
			<div class = "form-group row">
				<label class = "col-sm-2"><fmt:message key="unitPrice"/></label>
				<div class = "col-sm-3">
					<input type = "text" name = "unitPrice" class = "form-control">
				</div>
			</div>
			<div class = "form-group row">
				<label class = "col-sm-2"><fmt:message key="description"/></label>
				<div class = "col-sm-5">
					<textarea name = "description" cols ="50" rows="2"
					 class = "form-control"></textarea>
				</div>
			</div>
			<div class = "form-group row">
				<label class = "col-sm-2"><fmt:message key="manufacturer"/></label>
				<div class = "col-sm-3">
					<input type = "text" name = "manufacturer" class = "form-control">
				</div>
			</div>
			<div class = "form-group row">
				<label class = "col-sm-2"><fmt:message key="category"/></label>
				<div class = "col-sm-3">
					<input type = "text" name = "category" class = "form-control">
				</div>
			</div>
			<div class = "form-group row">
				<label class = "col-sm-2"><fmt:message key="unitsInStock"/></label>
				<div class = "col-sm-3">
					<input type = "text" name = "unitsInStock" class = "form-control">
				</div>
			</div>
			<div class = "form-group row">
				<label class = "col-sm-2"><fmt:message key="condition"/></label>
				<div class = "col-sm-5">
					<label><input type = "radio" name = "condition" value = "New" ><fmt:message key="condition_New"/></label> 
					<label><input type = "radio" name = "condition" value = "Old" ><fmt:message key="condition_Old"/></label>
					<label><input type = "radio" name = "condition" value = "Refurbished" ><fmt:message key="condition_Refurbished"/></label> 
				</div>
			</div>
			<!-- 파일 입력 란은 넣는다. 이름은 productImage -->
			<div class = "form-group row">
				<label class = "col-sm-2"><fmt:message key="productImage"/></label>
				<div class = "col-sm-5">
					<input type = "file" name = "productImage" class = "form-control">
				</div>
			</div>
			<div class = "form-group row">
				<div class = "col-sm-offset-2 col-sm-10" >
					<input type = "submit" class = "btn btn-primary" value = "<fmt:message key="button"/>">
				</div>
			</div>
		</form>
	</div>
	</fmt:bundle>
</body>
</html>