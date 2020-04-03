package dto;

import java.io.Serializable;

public class BookDTO implements Serializable {
    String	isbn;
    String	book_m_category;
    String	book_s_category;
    String	book_subject;
    String	book_writer;
    String	book_pday;
    String	book_summary;
    String	book_filename;
    int	book_filesize;
    int	book_price;

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
        return "BookDTO{" +
                "isbn='" + isbn + '\'' +
                ", book_m_category='" + book_m_category + '\'' +
                ", book_s_category='" + book_s_category + '\'' +
                ", book_subject='" + book_subject + '\'' +
                ", book_writer='" + book_writer + '\'' +
                ", book_pday='" + book_pday + '\'' +
                ", book_summary='" + book_summary + '\'' +
                ", book_filename='" + book_filename + '\'' +
                ", book_filesize=" + book_filesize +
                ", book_price=" + book_price +
                '}';
    }
}