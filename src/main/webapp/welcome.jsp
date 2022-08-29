<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import = "java.util.Date" %>
<!DOCTYPE html>
<html>
<head>

<!--  link속성의 rel은 relationship의 약자로 , href에 작성될 링크와의 관계
	를 의미한다. 여기서 rel은 stylesheet로 링크는 스타일적용에 쓰일거라는 뜻이된다. -->
<link rel = "stylesheet"
	href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/
	bootstrap.min.css">
	
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body>
	<!-- 맨 위쪽에 menu.jsp 파일을 포함시켜준다. -->
	<%@ include file = "menu.jsp" %>
	
	<!-- String으로 greeting과 tagline인삿말을 설정 -->
	<%! String greeting = "웹 쇼핑몰에 오신 것을 환영합니다";
	String tagline = "Welcome to Web Market!"; %>
	
	<!--  jumbotron 은 상자처럼 담아지게 출력이 되고 , container은 요소들을 담는 그릇 정도로 보면 된다.
	 -->
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">
				<%= greeting %>
			</h1>
		</div>
	</div>
	
	
	<!-- main은 문서의 주요한 내용을 담는 태그이다 . -->
	<main role = "main">
	<div class = "container" >
		<div class = "text-center">
			<h3>
				<%= tagline  %>
			</h3>
			
			<!-- welcome to web Market 아래쪽에 현재 시간을 표시 -->
			<%
			//5초마다 새로고침 되는 기능을 추가하여 5초마다 날짜가 바뀌게 한다.
				response.setIntHeader("Refrest" , 5);
			// java.util.Date 클래스를 왼쪽의 day로 넣어 사용
				Date day = new java.util.Date();
				String am_pm;
				int hour = day.getHours();
				int minute = day.getMinutes();
				int second = day.getSeconds();
				if (hour / 12 == 0) {
					am_pm = "AM";
				}else{
					am_pm = "PM";
					hour = hour - 12 ;
				}
				String CT = hour + ":" + minute + ":" + second + " " + am_pm;
				out.println("현재 접속 시각 : " + CT + "\n");
			%>
		</div>
		<hr>
	</div>
	</main>
	
	<!-- 맨 아래쪽에 footer class를 포함시켜준다 -->
	<%@ include file = "footer.jsp" %>
</body>
</html>