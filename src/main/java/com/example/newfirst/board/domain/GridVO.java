package com.example.newfirst.board.domain;

import java.util.List;

public class GridVO {

    private String page;
    private int records;
    private String total;

    public String getPage() {
        return page;
    }

    public int getRecords() {
        return records;
    }

    public void setRecords(int records) {
        this.records = records;
    }

    public void setPage(String page) {
        this.page = page;
    }



    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public List<BoardVO> getRows() {
        return rows;
    }

    public void setRows(List<BoardVO> rows) {
        this.rows = rows;
    }

    private List<BoardVO> rows;

}
