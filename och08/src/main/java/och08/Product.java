package och08;

public class Product {
	private String code;
	private String name;
	private int price;
	
	// 캡슐화(Encapsulation) = 정보은닉, 재사용
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
	
}
