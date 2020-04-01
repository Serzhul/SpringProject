package dto;

import java.io.Serializable;

public class BoardDTO implements Serializable {
    String	board_category;
    String	id;
    int	board_number;
    String	board_subject;
    String	board_content;
    String	board_regdate;

    public String getBoard_category() {
        return board_category;
    }

    public void setBoard_category(String board_category) {
        this.board_category = board_category;
    }

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
        return "BoardDTO{" +
                "board_category='" + board_category + '\'' +
                ", id='" + id + '\'' +
                ", board_number=" + board_number +
                ", board_subject='" + board_subject + '\'' +
                ", board_content='" + board_content + '\'' +
                ", board_regdate='" + board_regdate + '\'' +
                '}';
    }
}
