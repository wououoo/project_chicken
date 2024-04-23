package com.project.kammi.mapper.manufacturing;

import com.project.kammi.domain.manufacturing.fileVO;

public interface fileMapper {
    int insertFile(fileVO file);
    String selectChickenPhoto(int recipe_Id);

    int updateFileRecipe(int recipe_Id,
                         String fileName);
}
