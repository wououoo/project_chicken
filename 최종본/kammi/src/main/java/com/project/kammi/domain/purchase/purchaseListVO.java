package com.project.kammi.domain.purchase;

import lombok.Data;

import java.util.Date;

@Data
public class purchaseListVO {
    private int purchaseList_id;
    private String purchaseList_subject;
    private String purchaseList_content;
    private Date purchaseList_date;
}
