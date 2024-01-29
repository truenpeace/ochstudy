package och08;

// 상속(Inheritance)
// Extends - 클래스 상속 / 싱글 / 추가 메소드 가능, 오버라이딩
// Implements - 인터페이스 구현 / 다중 / 반드시 전부 오버라이딩
public class Book extends Product {
	private String writer;
	private int page;
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
}
