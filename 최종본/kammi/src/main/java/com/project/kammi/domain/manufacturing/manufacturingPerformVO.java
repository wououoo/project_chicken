package com.project.kammi.domain.manufacturing;

import lombok.Data;

import java.util.Date;

@Data
public class manufacturingPerformVO {
    public int instruction_Id;
    public int perform_Id;
    public int recipe_Id;
    public int output;
    public int salineDI;
    public int seasoningDI;
    public int cookingDI;
    public int packagingDI;
    public int rn;              // rownum
    public int ALLAMOUNT;

    public String manufacturing_Line;
    public String perform_Employee;
    public String recipe_Name;

    public Date start_Date;
    public Date end_Date;
    public Date saline;
    public Date seasoning;
    public Date cooking;
    public Date packaging;

}
