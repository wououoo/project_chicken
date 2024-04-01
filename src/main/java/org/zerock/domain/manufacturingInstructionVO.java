package org.zerock.domain;

import lombok.Data;

import java.util.Date;
@Data
public class manufacturingInstructionVO {
    public int instruction_Id;
    public int recipe_Id;

    public int output;

    public Date instruction_Date;
    public String instruction_Employee;

}
