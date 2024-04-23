package com.project.kammi.domain.purchase;

import lombok.Data;

import java.util.Date;

@Data
public class materialPurchaseVO {
    private int purchaselist_id;
    private int material_id;
    private int supplier_id;
    private Date purchase_date;
    private Date purchase_fixed_date;
    private int purchase_amount;
    private int purchase_fixed_amount;
}
