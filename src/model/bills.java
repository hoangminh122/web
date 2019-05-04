package model;

import java.sql.Date;

import com.sun.jmx.snmp.Timestamp;

public class bills {
	private int id;
	private int id_customer;
	private Date date_order;
	private float total;
	private String payment;
	private String note;
	private Timestamp create_at;
	private Timestamp updated_at;
	public bills(int id, int id_customer, Date date_order, float total, String payment, String note,
			Timestamp create_at, Timestamp updated_at) {
		super();
		this.id = id;
		this.id_customer = id_customer;
		this.date_order = date_order;
		this.total = total;
		this.payment = payment;
		this.note = note;
		this.create_at = create_at;
		this.updated_at = updated_at;
	}
	public bills() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_customer() {
		return id_customer;
	}
	public void setId_customer(int id_customer) {
		this.id_customer = id_customer;
	}
	public Date getDate_order() {
		return date_order;
	}
	public void setDate_order(Date date_order) {
		this.date_order = date_order;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
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
