package model;

import java.sql.Timestamp;

public class type_products {
	private int id;
	private String name;
	private String description;
	private String image;
	private Timestamp created_up;
	private Timestamp update_up;
	
	public type_products(){
		super();
	}

	public type_products(int id, String name, String description, String image, Timestamp created_up,
			Timestamp update_up) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.image = image;
		this.created_up = created_up;
		this.update_up = update_up;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Timestamp getCreated_up() {
		return created_up;
	}

	public void setCreated_up(Timestamp created_up) {
		this.created_up = created_up;
	}

	public Timestamp getUpdate_up() {
		return update_up;
	}

	public void setUpdate_up(Timestamp update_up) {
		this.update_up = update_up;
	}
	
}
