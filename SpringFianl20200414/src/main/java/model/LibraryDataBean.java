package model;

import java.io.Serializable;

public class LibraryDataBean implements Serializable{
	private String isbn;
	private String id;	
	private String book_subject;
	
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

	public LibraryDataBean(String isbn, String id, String book_subject) {
		this.isbn = isbn;
		this.id = id;
		this.book_subject=book_subject;
	}
	
	public LibraryDataBean(){
	}
	
	@Override
	public String toString() {
		return "LibraryDataBean [isbn=" + isbn + ", id=" + id + ", book_subject=" + book_subject + "]";
	}
		
}
