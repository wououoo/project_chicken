package com.project.kammi.service.manufacturing;

import com.project.kammi.domain.manufacturing.fileVO;
import com.project.kammi.domain.manufacturing.recipeStandardVO;
import com.project.kammi.domain.manufacturing.recipeVO;
import com.project.kammi.domain.paging.PagingVO;
import com.project.kammi.mapper.manufacturing.fileMapper;
import com.project.kammi.mapper.manufacturing.recipeMapper;
import com.project.kammi.mapper.manufacturing.recipeStandardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class manufacturingServiceImpl implements manufacturingService{
    @Autowired
    private recipeMapper mapper;

    @Autowired
    private com.project.kammi.mapper.manufacturing.fileMapper fileMapper;

    @Autowired
    private recipeStandardMapper standardMapper;

    @Override
    public List<recipeVO> getRecipeList(){
        return mapper.recipeList();
    }

    @Override
    public boolean insertRecipeAndFile(recipeVO recipe, fileVO file) {
        try {
            int recipeCount = mapper.insertRecipe(recipe);
            fileMapper.insertFile(file);
            if(recipeCount==0){
                return false; // 데이터 삽입 실패
            }

            return true; // 데이터 삽입 성공
        } catch (Exception e) {
            e.printStackTrace();
            return false; // 데이터 삽입 실패
        }
    }
    @Override
    public int insertRecipe(recipeVO recipe) {
        return mapper.insertRecipe(recipe);
    }

    @Override
    public String selectChickenPhoto(int recipe_Id) {
        return fileMapper.selectChickenPhoto(recipe_Id);
    }

    @Override
    public int insertRecipeStandardList(List<recipeStandardVO> recipeStandardList) {
        return standardMapper.insertRecipeStandardList(recipeStandardList);
    }

    // 사진 눌렀을 때 나오는 모달창 select (규격정보 제외)
    @Override
    public recipeVO selectAllRecipeInfoForUpdate(int recipe_Id) {
        return mapper.selectAllRecipeInfoForUpdate(recipe_Id);
    }

    @Override
    public List<recipeStandardVO> selectRecipeStandardInfoForUpdate(PagingVO paging, int recipe_Id) {
        return standardMapper.selectRecipeStandardInfoForUpdate(paging, recipe_Id);
    }

    @Override
    public int updateRecipe(int recipe_Id,
                            String recipe_Name) {
        return mapper.updateRecipe(recipe_Id,recipe_Name);
    }
    @Override
    public int autoUpdateStandardRecipe(int recipe_Id,
                                        String recipe_Name){
        return standardMapper.autoUpdateStandardRecipe(recipe_Id,recipe_Name);
    }

    @Override
    public int updateFileRecipe(int recipe_Id, String fileName) {
        return fileMapper.updateFileRecipe(recipe_Id, fileName);
    }
    @Override
    public int updateAllStandardRecipe(recipeStandardVO vo){
        return standardMapper.updateAllStandardRecipe(vo);
    }
    @Override
    public int deleteAllStandardRecipe(int standard_Id){
        return standardMapper.deleteAllStandardRecipe(standard_Id);
    }

    @Override
    public String deleteRecipeAndStandard(int recipe_Id) {
        standardMapper.deleteStandardRecipe(recipe_Id);
        mapper.deleteRecipe(recipe_Id);
        return "성공";
    }
}

