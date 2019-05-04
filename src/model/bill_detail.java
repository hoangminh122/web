package model;

import com.sun.jmx.snmp.Timestamp;

public class bill_detail {
	private int id;
	private int id_bill;
	private int id_product;
	private int quantity;
	private double unit_price;
	private Timestamp create_at;
	private Timestamp updated_at;
	
	
	public bill_detail() {
		super();
	}
	public bill_detail(int id, int id_bill, int id_product, int quantity, double unit_price, Timestamp create_at,
			Timestamp updated_at) {
		super();
		this.id = id;
		this.id_bill = id_bill;
		this.id_product = id_product;
		this.quantity = quantity;
		this.unit_price = unit_price;
		this.create_at = create_at;
		this.updated_at = updated_at;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_bill() {
		return id_bill;
	}
	public void setId_bill(int id_bill) {
		this.id_bill = id_bill;
	}
	public int getId_product() {
		return id_product;
	}
	public void setId_product(int id_product) {
		this.id_product = id_product;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getUnit_price() {
		return unit_price;
	}
	public void setUnit_price(double unit_price) {
		this.unit_price = unit_price;
	}
	public Timestamp getCreate_at() {
		return create_at;
	}
	public void setCreate_at(Timestamp create_at) {
		this.create_at = create_at;
	}
	public Timestamp getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(Timestamp updated_at) {
		this.updated_at = updated_at;
	}
	
}
