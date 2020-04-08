package model;

import java.io.Serializable;

public class MyCartDataBean implements Serializable{
	private String isbn;
	private String id;	
	
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}	

	public MyCartDataBean(String isbn, String id) {
		this.isbn = isbn;
		this.id = id;
	}
	
	public MyCartDataBean(){
	}
	@Override
	public String toString() {
		return "MyCartDataBean [isbn=" + isbn + ", id=" + id + "]";
	}
	
		
}
