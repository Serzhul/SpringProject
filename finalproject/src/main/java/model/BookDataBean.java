package model;

import java.io.Serializable;

public class BookDataBean implements Serializable{
	//------ page config data ------
	private int page_num;
	private int total_rows;
	private int rows_on_page;
	private int total_pages;
	private int start_row;
	private int end_row;

	//------ page content data ------
	private String isbn;
	private String book_m_category;
	private String book_s_category;
	private String book_subject;
	private String book_writer;
	private String book_pday;
	private String book_summary;
	private String book_filename;
	private int book_filesize;
	private int book_price;
	private String sales;
	private int rk;
	private double avgr;
	private int rm;
	private String keyword;

	//------ page config data ------
	public int getPage_num() {
		return page_num;
	}

	public void setPage_num(int page_num) {
		this.page_num = page_num;
	}

	public int getTotal_rows() {
		return total_rows;
	}

	public void setTotal_rows(int total_rows) {
		this.total_rows = total_rows;
	}

	public int getRows_on_page() {
		return rows_on_page;
	}

	public void setRows_on_page(int rows_on_page) {
		this.rows_on_page = rows_on_page;
	}

	public int getTotal_pages() {
		return total_pages;
	}

	public void setTotal_pages(int total_pages) {
		this.total_pages = total_pages;
	}

	public int getStart_row() {
		return start_row;
	}

	public void setStart_row(int start_row) {
		this.start_row = start_row;
	}

	public int getEnd_row() {
		return end_row;
	}

	public void setEnd_row(int end_row) {
		this.end_row = end_row;
	}

	//------ page content data ------
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public int getRm() {
		return rm;
	}
	public void setRm(int rm) {
		this.rm = rm;
	}
	public double getAvgr() {
		return avgr;
	}
	public void setAvgr(double avgr) {
		this.avgr = avgr;
	}
	
	public void setRk(int rk) {
		this.rk = rk;
	}
	public int getRk() {
		return rk;
	}
	public void setRank(int rk) {
		this.rk = rk;
	}
	
	public String getSales() {
		return sales;
	}
	public void setSales(String sales) {
		this.sales = sales;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getBook_m_category() {
		return book_m_category;
	}
	public void setBook_m_category(String book_m_category) {
		this.book_m_category = book_m_category;
	}
	public String getBook_s_category() {
		return book_s_category;
	}
	public void setBook_s_category(String book_s_category) {
		this.book_s_category = book_s_category;
	}
	public String getBook_subject() {
		return book_subject;
	}
	public void setBook_subject(String book_subject) {
		this.book_subject = book_subject;
	}
	public String getBook_writer() {
		return book_writer;
	}
	public void setBook_writer(String book_writer) {
		this.book_writer = book_writer;
	}
	public String getBook_pday() {
		return book_pday;
	}
	public void setBook_pday(String book_pday) {
		this.book_pday = book_pday;
	}
	public String getBook_summary() {
		return book_summary;
	}
	public void setBook_summary(String book_summary) {
		this.book_summary = book_summary;
	}
	public String getBook_filename() {
		return book_filename;
	}
	public void setBook_filename(String book_filename) {
		this.book_filename = book_filename;
	}
	public int getBook_filesize() {
		return book_filesize;
	}
	public void setBook_filesize(int book_filesize) {
		this.book_filesize = book_filesize;
	}
	public int getBook_price() {
		return book_price;
	}
	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}


	@Override
	public String toString() {
		return "BookDataBean{" +
				"page_num=" + page_num +
				", total_rows=" + total_rows +
				", rows_on_page=" + rows_on_page +
				", total_pages=" + total_pages +
				", start_row=" + start_row +
				", end_row=" + end_row +
				", isbn='" + isbn + '\'' +
				", book_m_category='" + book_m_category + '\'' +
				", book_s_category='" + book_s_category + '\'' +
				", book_subject='" + book_subject + '\'' +
				", book_writer='" + book_writer + '\'' +
				", book_pday='" + book_pday + '\'' +
				", book_summary='" + book_summary + '\'' +
				", book_filename='" + book_filename + '\'' +
				", book_filesize=" + book_filesize +
				", book_price=" + book_price +
				", sales='" + sales + '\'' +
				", rk=" + rk +
				", avgr=" + avgr +
				", rm=" + rm +
				", keyword='" + keyword + '\'' +
				'}';
	}
}
