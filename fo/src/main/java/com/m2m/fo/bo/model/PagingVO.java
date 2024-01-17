package com.m2m.fo.bo.model;

import lombok.Data;

@Data
public class PagingVO {
    private int pageSize = 10;
    private int totalCount = 0;
    private int totalPage = 0;
    private int currentPage = 1;
    private int startNo = 0;
    private int startPage = 0;

    public void calPaging(int totalCount) {
        this.totalCount = totalCount;
        totalPage = (totalCount - 1) / pageSize + 1;
        currentPage = Math.min(currentPage, totalPage);
        startNo = (currentPage - 1) * pageSize;
        startPage = (currentPage - 1) / pageSize * pageSize + 1;
    }
}
