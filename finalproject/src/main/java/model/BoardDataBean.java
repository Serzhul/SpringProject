package model;

import java.io.Serializable;

public class BoardDataBean implements Serializable {
    //------ page config data ------
    private int page_num;
    private int total_rows;
    private int rows_on_page;
    private int total_pages;
    private int start_row;
    private int end_row;
    private String	board_category;

    //------ page content data ------
    private String	id;
    private int	board_number;
    private String	board_subject;
    private String	board_content;
    private String	board_regdate;

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

    public String getBoard_category() {
        return board_category;
    }

    public void setBoard_category(String board_category) {
        this.board_category = board_category;
    }

    //------ page content data ------
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getBoard_number() {
        return board_number;
    }

    public void setBoard_number(int board_number) {
        this.board_number = board_number;
    }

    public String getBoard_subject() {
        return board_subject;
    }

    public void setBoard_subject(String board_subject) {
        this.board_subject = board_subject;
    }

    public String getBoard_content() {
        return board_content;
    }

    public void setBoard_content(String board_content) {
        this.board_content = board_content;
    }

    public String getBoard_regdate() {
        return board_regdate;
    }

    public void setBoard_regdate(String board_regdate) {
        this.board_regdate = board_regdate;
    }

    @Override
    public String toString() {
        return "BoardDataBean{" +
                "page_num=" + page_num +
                ", total_rows=" + total_rows +
                ", rows_on_page=" + rows_on_page +
                ", total_pages=" + total_pages +
                ", start_row=" + start_row +
                ", end_row=" + end_row +
                ", board_category='" + board_category + '\'' +
                ", id='" + id + '\'' +
                ", board_number=" + board_number +
                ", board_subject='" + board_subject + '\'' +
                ", board_content='" + board_content + '\'' +
                ", board_regdate='" + board_regdate + '\'' +
                '}';
    }
}
