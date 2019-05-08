package model;

public class Item {
	private int id;
	private products product;
	private int quantity;
	private float price;
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	
	public products getProduct() {
		return product;
	}

	public void setProduct(products product) {
		this.product = product;
	}

	public Item() {
		super();
	}
	public Item(int id, int quantity, float price,products product) {
		super();
		this.id = id;
		this.quantity = quantity;
		this.price = price;
		this.product=product;
	}
	
}
