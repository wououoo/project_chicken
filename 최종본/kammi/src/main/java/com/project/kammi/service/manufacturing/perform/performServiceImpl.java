package com.project.kammi.service.manufacturing.perform;

import com.project.kammi.domain.manufacturing.manufacturingPerformVO;
import com.project.kammi.domain.manufacturing.performPagingVO;
import com.project.kammi.mapper.manufacturing.perform.performMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class performServiceImpl implements performService {
    @Autowired
    private performMapper mapper;

    @Override
    public List<manufacturingPerformVO> selectAllPerform(performPagingVO paging, manufacturingPerformVO manufacturingPerformVO) {
        return mapper.selectAllPerform(paging,manufacturingPerformVO);
    }

    @Override
    public int maxpageCount(manufacturingPerformVO vo) {
        return mapper.maxpagePerformCount(vo);
    }

    @Override
    public manufacturingPerformVO selectRowClickPerform(int perform_Id){
        return mapper.selectRowClickPerform(perform_Id);
    }
    @Override
    public int insertPerform(String manufacturing_Line, int instruction_Id,int output, String perform_Employee){
        return mapper.insertPerform(manufacturing_Line, instruction_Id, output, perform_Employee );
    }

    @Override
    public List<manufacturingPerformVO> selectLineAndEmployee(){
        return mapper.selectLineAndEmployee();
    }
    @Override
    public List<manufacturingPerformVO> selectRecipeNameSelectMaterials(int output, int instruction_Id){
        return mapper.selectRecipeNameSelectMaterials(output, instruction_Id);
    }
    @Override
    public int updatePerform(String manufacturing_Line, int output, String perform_Employee, int perform_Id){
        return mapper.updatePerform(manufacturing_Line, output, perform_Employee,perform_Id);
    }
    @Override
    public List<manufacturingPerformVO> selectStartDateForUpdate(){
        return mapper.selectStartDateForUpdate();
    }
    @Override
    public manufacturingPerformVO selectStartDate(int perform_Id){
        return mapper.selectStartDate(perform_Id);
    }
    @Override
    public int deletePerform(int perform_Id){
        return mapper.deletePerform(perform_Id);
    }
    @Override
    public int updateMaterialAllAmount(int output, String recipe_Name){
        return mapper.updateMaterialAllAmount(output, recipe_Name);
    }

    @Override
    public manufacturingPerformVO selectRecipeName(int instruction_Id){
        return mapper.selectRecipeName(instruction_Id);
    }

    @Override
    public manufacturingPerformVO selectPerformAllTime(int perform_Id){
        return mapper.selectPerformAllTime(perform_Id);
    }
    @Override
    public int updatePerformTimeStatus(int perform_Id){
        return mapper.updatePerformTimeStatus(perform_Id);
    }
    @Override
    public int updatePerformTimeStatus2(int perform_Id){
        return mapper.updatePerformTimeStatus2(perform_Id);
    }
    @Override
    public int updatePerformTimeStatus3(int perform_Id){
        return mapper.updatePerformTimeStatus3(perform_Id);
    }
    @Override
    public int updatePerformTimeStatus4(int perform_Id){
        return mapper.updatePerformTimeStatus4(perform_Id);
    }
    @Override
    public int updatePerformTimeStatus5(int perform_Id){
        return mapper.updatePerformTimeStatus5(perform_Id);
    }
    @Override
    public int updatePerformTimeStatus6(int perform_Id){
        return mapper.updatePerformTimeStatus6(perform_Id);
    }
    @Override
    public int updateFinishedGoodsQuantity(int output, String recipe_Name){
        return mapper.updateFinishedGoodsQuantity(output, recipe_Name);
    }
}

