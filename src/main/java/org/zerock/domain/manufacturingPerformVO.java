package org.zerock.domain;

import lombok.Data;

import java.util.Date;
@Data
public class manufacturingPerformVO {
    public int perform_Id;
    public int recipe_Id;
    public int output;
    public String manufacturing_Line;
    public String perform_Employee;
    public Date start_Date;
    public Date end_Date;
}
