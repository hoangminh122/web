package model;

public class slide {
	private int id;
	private String link;
	private String image;
	public slide() {
		super();
	}
	public slide(int id, String link, String image) {
		super();
		this.id = id;
		this.link = link;
		this.image = image;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
}
