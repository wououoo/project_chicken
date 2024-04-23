package com.project.kammi.mapper.manufacturing.instruction;

import com.project.kammi.domain.manufacturing.manufacturingInstructionVO;
import com.project.kammi.domain.paging.PagingVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface instructionMapper {
    public List<manufacturingInstructionVO> selectAllInstruction(@Param("paging") PagingVO paging, @Param("manufacturingInstructionVO") manufacturingInstructionVO vo);

    public int maxpageCount(@Param("manufacturingInstructionVO") manufacturingInstructionVO vo);

    public List<manufacturingInstructionVO> selectRecipeName();

    public int insertInstruction(String recipe_Name,
                                 int output,
                                 String instruction_Employee);

    public int updateInstruction(int output,
                                 int instruction_Id);
    public int deleteInstruction(int instruction_Id);



    public manufacturingInstructionVO selectRowClickInstruction(int instruction_Id);

    public List<manufacturingInstructionVO> selectInstructionForInsertPerform();

    public int updateInstructionRemainingProduction(int remainingProduction, int instruction_Id);

    public int updateInstructionRemainingProductionInPerform(int instruction_Id, int remainingProduction);

    public manufacturingInstructionVO selectOutputAndRemainingProduction(int instruction_Id);

    public int updateInstructionStatus(int instruction_Id);
}

