package com.project.kammi.domain.finishedgoods;

import lombok.Data;

import java.util.Date;

@Data
public class GoodsInvenVO {
    private int finishedgoodsinventory_id;              //재고 번호
    private int finishedgoodsinventory_goods_id;        //제품 번호
    private String finishedgoodsinventory_goods_name;   //제품 이름
    private int finishedgoodsinventory_quantity;        //재고 수량
    private String finishedgoodsinventory_division;     //재고 구분(입고, 출고)
    private Date finishedgoodsinventory_date;           //재고 날짜
    private int finishedgoodsinventory_storage;         //창고 번호

    //검색용 VO
    private String storage_name;                        //창고 이름
}