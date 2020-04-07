package model;

import java.io.Serializable;

public class ReviewLikeDataBean implements Serializable{
	private int num;
	private String isbn;
	private String writer_id;
	private String review_id;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	public String getReview_id() {
		return review_id;
	}
	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}
	
	@Override
	public String toString() {
		return "ReviewLikeDataBean [num=" + num + ", isbn=" + isbn + ", writer_id=" + writer_id + ", review_id="
				+ review_id + "]";
	}
}
