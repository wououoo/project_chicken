package com.project.kammi.domain.finishedgoods;

import lombok.Data;

@Data
public class FinishedGoodsVO {
    private int rn;
    private int finishedgoods_id;       //완제품 번호
    private String finishedgoods_name;  //완제품 이름
    private int finishedgoods_quantity; //완제품 총 수량
    private int finishedgoods_price;    //완제품 가격
    private String quantity_units;      //완제품 단위
    private int finishedgoods_status;   //완제품 상태(0=미판매 1=판매중 2=품절)
    private int recipe_id;              //레시피 번호
}
