package org.zerock.domain;

import lombok.Data;

@Data
public class recipeStandardVO {
    public int standard_Id;
    public int recipe_Id;
    public int material_Id;
    public int recipe_Product_Quantity;
    public String quantity_Units;
    public String usePhase;
}
