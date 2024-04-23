package com.project.kammi.domain.manufacturing;

import lombok.Data;

import java.util.Date;

@Data
public class manufacturingInstructionVO {
    public int instruction_Id;
    public int recipe_Id;
    public int rn;              // rownum
    public int output;
    public int remainingProduction;
    public int manufacturing_Status;
    public Date instruction_Date;
    public Date modify_Date;
    public String instruction_Employee;
    public String recipe_Name;
}