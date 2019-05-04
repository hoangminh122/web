package model;

import com.sun.jmx.snmp.Timestamp;

public class users {
	private int id;
	private String full_name;
	private String email;
	private String password;
	private String phone;
	private String address;
	private String remember_token;
	private Timestamp create_up;
	private Timestamp updated_at;
	public users() {
		super();
	}
	public users(int id, String full_name, String email, String password, String phone, String address,
			String remember_token, Timestamp create_up, Timestamp updated_at) {
		super();
		this.id = id;
		this.full_name = full_name;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.address = address;
		this.remember_token = remember_token;
		this.create_up = create_up;
		this.updated_at = updated_at;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFull_name() {
		return full_name;
	}
	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRemember_token() {
		return remember_token;
	}
	public void setRemember_token(String remember_token) {
		this.remember_token = remember_token;
	}
	public Timestamp getCreate_up() {
		return create_up;
	}
	public void setCreate_up(Timestamp create_up) {
		this.create_up = create_up;
	}
	public Timestamp getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(Timestamp updated_at) {
		this.updated_at = updated_at;
	}
	
	
}
