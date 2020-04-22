package model;

public class GraphDataBean {

    String graph_category;
    String rank;
    String isbn;
    String con;//count-> 해당 isbn이 등록된 개수를 말하며 판매량을 말하게 된다.

    public String getGraph_category() {
        return graph_category;
    }

    public void setGraph_category(String graph_category) {
        this.graph_category = graph_category;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getCon() {
        return con;
    }

    public void setCon(String con) {
        this.con = con;
    }

    @Override
    public String toString() {
        return "GraphDataBean{" +
                "graph_category='" + graph_category + '\'' +
                ", rank='" + rank + '\'' +
                ", isbn='" + isbn + '\'' +
                ", con='" + con + '\'' +
                '}';
    }
}
