package model;

import com.sun.jmx.snmp.Timestamp;

public class customer {
	private int id;
	private String name;
	private String gender;
	private String email;
	private String address;
	private String phone_number;
	private String note;
	private Timestamp create_at;
	private Timestamp update_at;
	
	
	public customer() {
		super();
	}


	public customer(int id, String name, String gender, String email, String address, String phone_number, String note,
			Timestamp create_at, Timestamp update_at) {
		super();
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.email = email;
		this.address = address;
		this.phone_number = phone_number;
		this.note = note;
		this.create_at = create_at;
		this.update_at = update_at;
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


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getPhone_number() {
		return phone_number;
	}


	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
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


	public Timestamp getUpdate_at() {
		return update_at;
	}


	public void setUpdate_at(Timestamp update_at) {
		this.update_at = update_at;
	}
	
	
}
