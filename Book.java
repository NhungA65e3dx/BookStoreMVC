package Model;

public class Book {
	private int id;
	private String name;
	private String author;
	private String introduce;
	private double price;
	private int quantity;
	private double totalPrice;
	public Book(int id, String name, String author, String introduce, double price) {
		super();
		this.id = id;
		this.name = name;
		this.author = author;
		this.introduce = introduce;
		this.price = price;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getTotalPrice() {
		this.totalPrice = quantity * price;
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = quantity * price;
	}
}

