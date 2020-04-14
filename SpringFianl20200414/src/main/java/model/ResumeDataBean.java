package model;

import java.io.Serializable;

public class ResumeDataBean implements Serializable{
	private String id;
	private String isbn;
	private String pagenum;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getPagenum() {
		return pagenum;
	}
	public void setPagenum(String pagenum) {
		this.pagenum = pagenum;
	}
	
	public ResumeDataBean(String id, String isbn, String pagenum) {
		this.id = id;
		this.isbn = isbn;
		this.pagenum=pagenum;
	}
	
	public ResumeDataBean(){
	}
	
	
	@Override
	public String toString() {
		return "ResumeDataBean [id=" + id + ", isbn=" + isbn + ", pagenum=" + pagenum + "]";
	}
	
	
	

}
