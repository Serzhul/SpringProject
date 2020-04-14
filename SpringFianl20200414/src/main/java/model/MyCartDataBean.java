package model;

import java.io.Serializable;

public class MyCartDataBean implements Serializable{
	private String isbn;
	private String id;	
	private String book_subject;
	private int book_price;
	
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
	public String getBook_subject() {
		return book_subject;
	}
	public void setBook_subject(String book_subject) {
		this.book_subject = book_subject;
	}
	public int getBook_price() {
		return book_price;
	}
	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}
	
	public MyCartDataBean(String isbn, String id, String book_subject, int book_price) {
		this.isbn = isbn;
		this.id = id;
		this.book_subject=book_subject;
		this.book_price=book_price;
	}
	
	public MyCartDataBean(){
	}
	
	@Override
	public String toString() {
		return "MyCartDataBean [isbn=" + isbn + ", id=" + id + ", book_subject=" + book_subject + ", book_price="
				+ book_price + "]";
	}		
}
