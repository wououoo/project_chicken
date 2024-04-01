package org.zerock.domain;

import lombok.Data;

import java.util.Date;
@Data
public class processTrackingVO {
    public int process_Id;
    public int recipe_Id;
    public String manufacturing_Line;
    public String process_Step;
    public Date soltpond_Date;
    public Date seasoning_Date;
    public Date cooking_Date;
    public Date packaging_Date;
    public Date start_Date;
    public Date end_Date;
    public int soltpond_DefectiveItem;
    public int cooking_DefectiveItem;
    public int packaging_DefectiveItem;
    public int seasoning_DefectiveItem;
    public String completion_Status;


}
