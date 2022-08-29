<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>로그인 페이지</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>
	
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please sign in</h3>
			<!-- 만약 로그인실패시 로그인창에서 메세지 날려줘야해서 먼저 로그인성공여부를 확인 -->
			<%
				String error = request.getParameter("error");
				if(error != null){
					//java코드안의 print부분에서 html코드작성할땐 " " 사이에 작성
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해주세요");
					out.println("</div>");
				}
			%>
			<!-- j_security_check , j_username , j_password는 토씨하나 안틀리고 그대로 작성(tomcat안에서 이미 설정된 값이라서) -->
			<form class="form-signin" action="j_security_check" method="post">
			
				<div class="form-group">
					<!-- ?? label for로 라벨 설정후에 id로 사용하지 않은이유는? label의 쓸모는? id로 넣어줬을때 User Name이 화면에 뜨지 않는 이유는? -->
					<!-- label for은 변수같은 개념이다. 라벨 설정 후 사용은 id에 for로 설정한 이름을 넣어주면된다 -->
					<label for="inputUserName" class="sr-only">User Name</label>
					<input type="text" id = "inputUserName" class="form-control" placeholder="ID" name="j_username" required autofocus>
				</div>
				
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" class="form-control" placeholder="Password" name="j_password" required>
				</div>
				
				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
			</form>
		</div> 
	</div>
</body>
</html>