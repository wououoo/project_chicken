package com.project.kammi.domain.manufacturing;

import lombok.Data;

@Data
public class performPagingVO {
    private int pageNum;
    private int pageSize;

    public performPagingVO(){
        this(1,10);
    }

    public performPagingVO(int pageNum, int pageSize) {
        this.pageNum = pageNum;
        this.pageSize = pageSize;
    }
}
