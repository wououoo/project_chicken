package com.project.kammi.service.manufacturing.instruction;

import com.project.kammi.domain.manufacturing.manufacturingInstructionVO;
import com.project.kammi.domain.paging.PagingVO;
import com.project.kammi.mapper.manufacturing.instruction.instructionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class instructionServiceImpl implements instructionService{

    @Autowired
    private instructionMapper mapper;

    @Override
    public List<manufacturingInstructionVO> selectAllInstruction(PagingVO paging, manufacturingInstructionVO manufacturingInstructionVO) {
        return mapper.selectAllInstruction(paging,manufacturingInstructionVO);
    }

    @Override
    public int maxpageCount(manufacturingInstructionVO vo) {
        return mapper.maxpageCount(vo);
    }

    @Override
    public List<manufacturingInstructionVO> selectRecipeName() {
        return mapper.selectRecipeName();
    }

    @Override
    public int insertInstruction(String recipe_Name,
                                 int output,
                                 String instruction_Employee){

        return mapper.insertInstruction(recipe_Name, output, instruction_Employee);
    }

    @Override
    public int updateInstruction(int output,
                                 int instruction_Id){
        return mapper.updateInstruction(output, instruction_Id);
    }

    @Override
    public manufacturingInstructionVO selectRowClickInstruction(int instruction_Id){
        return mapper.selectRowClickInstruction(instruction_Id);
    }
    @Override
    public int deleteInstruction(int instruction_Id){
        return mapper.deleteInstruction(instruction_Id);
    }
    public List<manufacturingInstructionVO> selectInstructionForInsertPerform(){
        return mapper.selectInstructionForInsertPerform();
    }
    @Override
    public int updateInstructionRemainingProduction(int remainingProduction, int instruction_Id){
        return mapper.updateInstructionRemainingProduction(remainingProduction, instruction_Id);
    }
    @Override
    public int updateInstructionRemainingProductionInPerform(int instruction_Id, int remainingProduction){
        return mapper.updateInstructionRemainingProductionInPerform(instruction_Id, remainingProduction);
    }
    @Override
    public manufacturingInstructionVO selectOutputAndRemainingProduction(int instruction_Id){
        return mapper.selectOutputAndRemainingProduction(instruction_Id);
    }
    @Override
    public int updateInstructionStatus(int instruction_Id){
        return mapper.updateInstructionStatus(instruction_Id);
    }
}
