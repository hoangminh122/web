package model;

import com.sun.jmx.snmp.Timestamp;

public class news {
	private int id;
	private String title;
	private String context;
	private String image;
	private Timestamp create_at;
	private Timestamp update_at;
	public news() {
		super();
	}
	public news(int id, String title, String context, String image, Timestamp create_at, Timestamp update_at) {
		super();
		this.id = id;
		this.title = title;
		this.context = context;
		this.image = image;
		this.create_at = create_at;
		this.update_at = update_at;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
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
