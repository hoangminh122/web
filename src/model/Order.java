package model;

import java.util.List;

public class Order {
	private int id;
	private List<Item> items;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public List<Item> getItems() {
		return items;
	}
	public void setItems(List<Item> items) {
		this.items = items;
	}
	public Order(int id, List<Item> items) {
		super();
		this.id = id;
		this.items = items;
	}
	public Order() {
		super();
	}
	
}
