<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dto.Product" %>
<%@ page import = "dao.ProductRepository" %>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.multipart.*" %>
<%@ page import = "java.util.*" %>

<%
	//multipart/form-data로 받기위해선 request와 방식이 다르다.
	String filename="";
	String realFolder = request.getRealPath("resources/images");  
	int maxsize = 5 * 1024 * 1024;     //최대업로드 파일크기 5MB
	String enctype = "utf-8";
	
	//request는 내장객체라 객체생성이 필요없었지만, multi로 받게 될 경우 객체생성이 필요
	//new DefaultFileRenamePolicy() : 중복된 파일이름에 자동으로 1,2,3을붙여주는거 
	MultipartRequest multi = new MultipartRequest(request, realFolder, 
					maxsize, enctype, new DefaultFileRenamePolicy());
			
	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	//가격을 Integer로 선언 
	Integer price;
	//가격 부분이 비어있을 시 가격을 0 으로 설정하고 아니라면 , price에 integer형으로 변환시켜준 
	//unitPrice값을 넣어준다.
	if(unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);
	
	//재소를 long형으로 선언
	long stock;
	
	if(unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);
	
	//Enumeration : Iterator과 비슷한 개념 , 데이터를 하나씩 불러들여 마지막 데이터까지 가져옴
	//getFileNames()로 ,multi안의 파일데이터를 files에 넣어줌
	Enumeration files = multi.getFileNames();
	//첫번째 요소를 fname에 넣고 커서를 다음칸으로 이동
	String fname = (String) files.nextElement();
	//업로드 된 파일이름(변경될 수 있음) 을 fileName에 넣어줌
	String fileName = multi.getFilesystemName(fname);
	
	ProductRepository dao = ProductRepository.getInstance();
	
	//Product형의 인스턴스인 newProduct를 생성하여 데이터를 넘겨준다.
	Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	//업로드 된 파일이름을 넣어줌
	newProduct.setFilename(fileName);
	//=======================================================
	dao.addProduct(newProduct);
	
	//다시 상품목록 페이지로 돌아간다.
	response.sendRedirect("products.jsp");
%>
