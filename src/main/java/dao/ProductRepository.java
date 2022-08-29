package dao;
import java.util.ArrayList;
import dto.Product;

public class ProductRepository {
	
	//ArrayList를 사용하여 listOfProducts를 생성해준다. 타입은 Product로 선언해주었으므로
	//Product타입의 데이터들만 추가가 가능하다.
	//추가된 데이터들은 listOfProducts에 순서대로 저장되며 , 중복저장도 가능하다.
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	
	//static 으로 인스턴스를 생성해 줌으로서 아래의 생성자가 실행되게 해준다. 
	private static ProductRepository instance = new ProductRepository();
	
	
	//getInscance메소드를 생성해준다. 이 메소드로 생성해준 인스턴스들은 같은 주소값을 가진다. 즉 같은 집과 가구들을 공유하는것이다.
	public static ProductRepository getInstance() {
		return instance;
	}
	
	//기본 생성자에 인스턴스 Product 클래스의 인스턴스를 추가하게 하여 ProductRepository
	//인스턴스가 생성되자 마자 자동으로 3개의 품목이 추가되도록 한다.
	public ProductRepository() {
		Product phone = new Product("P1234", "iPhone 6s" , 800000 );
		phone.setDescription("4.7inch , 133242Renina HD display, 8-megapixel"
				+ "iSight Camera");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");
		phone.setFilename("P1234.png");
		
		Product notebook = new Product("P1235" , "LG PC 그램" , 1500000);
		notebook.setDescription("13.3-inch , IPS LED display, 5rd Generation"
				+ "Intel Core processors");
		notebook.setCategory("Notebook");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbished");
		notebook.setFilename("P1235.png");
		
		Product tablet = new Product("P1236" , "Galaxy Tab s" , 900000);
		tablet.setDescription("212.8x125 6x6.6mm , Super AMOLED display, Octa-Core processor");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("Samsung");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
		tablet.setFilename("P1236.png");
		
		//ArrayList의 listOfProducts에 3개의 품목을 저장한다.
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
				
	}
	
	//getAllProducts()메소드를 생성해준다. 리턴타입은 ArrayList<Product>형이고,
	//listOfProducts에 담긴 데이터들을 리턴하는 기능이다.
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
	
	//Product타입의 메소드 getProductByID를 생성한다. productId값을 메소드의 매개변수로 넣으면,
	//그 id에 해당하는 데이터를 반환하는 함수
	public Product getProductById(String productId) {
		//Product타입의 변수 productById 에 null값을 넣는다.
		Product productById = null;
		
		//listOfProducts에 담긴 값을 하나하나 비교하며 productId와 일치하는 id를 찾아낸다.
		for(int i = 0; i < listOfProducts.size(); i++) {
			//ArrayList 의 get함수를 이용.
			Product product = listOfProducts.get(i);
			if(product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
					productById = product;
					break;
			}
		}
		//지역변수로 넣어준 id의 값과 일치하는 상품의 데이터를 반환한다.
		return productById;
	}//getProductById 메소드의 끝
	
	//addProduct메소드 : Product타입의 지역변수를 선언하였다. 매개변수의 값을 받아와 상품리스트에 추가한다.
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
}
