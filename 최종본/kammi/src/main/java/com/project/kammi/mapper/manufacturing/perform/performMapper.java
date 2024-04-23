package com.project.kammi.mapper.manufacturing.perform;

import com.project.kammi.domain.manufacturing.manufacturingPerformVO;
import com.project.kammi.domain.manufacturing.performPagingVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface performMapper {
    public List<manufacturingPerformVO> selectAllPerform(@Param("paging") performPagingVO paging, @Param("manufacturingPerformVO") manufacturingPerformVO vo);

    public int maxpagePerformCount(@Param("manufacturingPerformVO") manufacturingPerformVO vo);

    public manufacturingPerformVO selectRowClickPerform(int perform_Id);

    public int insertPerform(String manufacturing_Line, int instruction_Id, int output, String perform_Employee);

    public List<manufacturingPerformVO> selectLineAndEmployee();

    public List<manufacturingPerformVO> selectRecipeNameSelectMaterials(int output, int instruction_Id);
    public int updatePerform(String manufacturing_Line, int output, String perform_Employee, int perform_Id);

    public List<manufacturingPerformVO> selectStartDateForUpdate();
    public manufacturingPerformVO selectStartDate(int perform_Id);

    public int deletePerform(int perform_Id);
    public int updateMaterialAllAmount(int output, String recipe_Name);

    public manufacturingPerformVO selectRecipeName(int instruction_Id);
    public manufacturingPerformVO selectPerformAllTime(int perform_Id);
    public int updatePerformTimeStatus(int perform_Id);
    public int updatePerformTimeStatus2(int perform_Id);
    public int updatePerformTimeStatus3(int perform_Id);
    public int updatePerformTimeStatus4(int perform_Id);
    public int updatePerformTimeStatus5(int perform_Id);
    public int updatePerformTimeStatus6(int perform_Id);

    public int updateFinishedGoodsQuantity(int output, String recipe_Name);
}

