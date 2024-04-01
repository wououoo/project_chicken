package org.zerock.domain;

import lombok.Data;

import java.util.Date;

@Data
public class recipeVO {
    public int recipe_Id;
    public String recipe_Name;
    public int product_Id;
    public Date registration_Date;
    public Date modify_Date;
}
