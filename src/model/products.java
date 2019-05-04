package model;

import com.sun.jmx.snmp.Timestamp;

public class products {
	private int id;
	private String name;
	private int id_type;
	private String description;
	private float unit_price;
	private float promotion_price;
	private String image;
	private String unit;
	private int news;
	private Timestamp created_up;
	private Timestamp updated_up;
	public products() {
		super();
	}
	public products(int id, String name, int id_type, String description, float unit_price, float promotion_price,
			String image, String unit, int news, Timestamp created_up, Timestamp updated_up) {
		super();
		this.id = id;
		this.name = name;
		this.id_type = id_type;
		this.description = description;
		this.unit_price = unit_price;
		this.promotion_price = promotion_price;
		this.image = image;
		this.unit = unit;
		this.news = news;
		this.created_up = created_up;
		this.updated_up = updated_up;
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
	public int getId_type() {
		return id_type;
	}
	public void setId_type(int id_type) {
		this.id_type = id_type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public float getUnit_price() {
		return unit_price;
	}
	public void setUnit_price(float unit_price) {
		this.unit_price = unit_price;
	}
	public float getPromotion_price() {
		return promotion_price;
	}
	public void setPromotion_price(float promotion_price) {
		this.promotion_price = promotion_price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public int getNews() {
		return news;
	}
	public void setNews(int news) {
		this.news = news;
	}
	public Timestamp getCreate_up() {
		return created_up;
	}
	public void setCreate_up(Timestamp created_up) {
		this.created_up = created_up;
	}
	public Timestamp getUpdate_up() {
		return updated_up;
	}
	public void setUpdate_up(Timestamp updated_up) {
		this.updated_up = updated_up;
	}
	
	
}
