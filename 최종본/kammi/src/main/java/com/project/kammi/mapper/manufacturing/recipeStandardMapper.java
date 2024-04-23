package com.project.kammi.mapper.manufacturing;

import com.project.kammi.domain.manufacturing.recipeStandardVO;
import com.project.kammi.domain.paging.PagingVO;

import java.util.List;

public interface recipeStandardMapper {

    // 레시피 기준 정보입력
    int insertRecipeStandardList(List<recipeStandardVO> recipeStandardList);
    List<recipeStandardVO> selectRecipeStandardInfoForUpdate(PagingVO paging, int recipe_Id);
    int autoUpdateStandardRecipe(int recipe_Id,
                                 String recipe_Name);

    int updateAllStandardRecipe(recipeStandardVO vo);

    int deleteAllStandardRecipe(int standard_Id);

    int deleteStandardRecipe(int recipe_Id);

}
