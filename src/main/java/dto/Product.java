package dto;
import java.io.Serializable;
//usebean을 사용하기 위해서는
//1. 패키지화 할 것(default 제외)
//2. 기본 생성자를 추가할 것
//3. 멤버변수를 private으로 선언할 것
//4. getter setter을 public으로 선언할 것 

public class Product {

	private static final long serialVersionUID = -4274700572038677000L;
	
	private String productId;		//상품 아이디
	private String pname;			//상품명
	private Integer unitPrice;		//상품 가격
	private String description;		//상품 설명 
	private String manufacturer;	//제조사
	private String category;		//분류
	private long unitsInStock;		//재고 수
	private String condition;		// 신상품 or 중고품 or 재생품 
	private String filename;		//이미지 파일명
	private int quantity;			//장바구니에 담은 개수
	
	//기본 생성자를 추가해 준다.
	public Product() {
		super();
	}

	//상품 아이디 , 이름 , 가격을 설정할 수 있는 생성자를 만든다.
	public Product(String productId, String pname, Integer unitPrice) {
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
	}

	//오른쪽 , source에서 getter 와 setter를 추가해준다.
	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}
	
	public String getFilename() {
		return filename;
	}
	
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}