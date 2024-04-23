package com.project.kammi.domain.manufacturing;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class fileVO {
    public int file_Id;
    public int recipe_Id;
    public String fileName;
    public String filePath;
    public String recipe_Name;
}
