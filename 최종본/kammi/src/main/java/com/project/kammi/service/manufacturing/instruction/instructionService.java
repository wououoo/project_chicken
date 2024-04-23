package com.project.kammi.service.manufacturing.instruction;

import com.project.kammi.domain.manufacturing.manufacturingInstructionVO;
import com.project.kammi.domain.paging.PagingVO;

import java.util.List;


public interface instructionService {
    List<manufacturingInstructionVO> selectAllInstruction(PagingVO paging, manufacturingInstructionVO manufacturingInstructionVO);

    public int maxpageCount(manufacturingInstructionVO vo);

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