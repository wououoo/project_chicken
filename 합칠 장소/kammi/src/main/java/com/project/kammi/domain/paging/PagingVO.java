package com.project.kammi.domain.paging;

import lombok.Data;

@Data
public class PagingVO {
    private int pageNum;
    private int pageSize;

    public PagingVO(){
        this(1,10);
    }
    public PagingVO(int pageNum, int pageSize){
        this.pageNum=pageNum;
        this.pageSize=pageSize;
    }
}
