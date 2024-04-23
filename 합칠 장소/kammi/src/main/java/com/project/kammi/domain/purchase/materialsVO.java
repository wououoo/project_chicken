package com.project.kammi.domain.purchase;

import lombok.Data;

@Data
public class materialsVO {
    private int pageSize = 7;
    private int pageNumber = 1;
    private int material_id;
    private String material_name;
    private int material_quantity;
    private int material_units;
    private int material_price;
    private String material_division;
    private String material_category;
    private int amount;
    private int allamount;
}
