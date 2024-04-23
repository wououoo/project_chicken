package com.project.kammi.controller.manufacturing.instruction;

import com.project.kammi.domain.manufacturing.manufacturingInstructionVO;
import com.project.kammi.domain.paging.PagingVO;
import com.project.kammi.service.manufacturing.instruction.instructionService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/instruction/rest")
@RestController
@Log4j
@AllArgsConstructor
public class instructionRestController {
    private instructionService service;
    @GetMapping(value = "/search/{search}/page/{page}/pagesize/{pagesize}/{status}",produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<manufacturingInstructionVO>> getList(@PathVariable("page")int page,
                                                                    @PathVariable("pagesize")int pagesize,
                                                                    @PathVariable("search")String search,
                                                                    @PathVariable("status")int status){
        System.out.println("검색"+search);

        PagingVO pageing = new PagingVO();
        pageing.setPageNum(page);
        pageing.setPageSize(pagesize);
        System.out.println("페이지보기" +pageing);

        manufacturingInstructionVO instructionVO = new manufacturingInstructionVO();
        if(search.equals("없음")){
            search="";
        }

        instructionVO.setRecipe_Name(search);
        instructionVO.setManufacturing_Status(status);

        return new ResponseEntity<>(service.selectAllInstruction(pageing,instructionVO), HttpStatus.OK);
    }

    @GetMapping(value="/{search}/{status}/pageSize/{pageSize}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<Integer>maxPage(@PathVariable("search")String search,
                                          @PathVariable("status")int status,
                                          @PathVariable("pageSize")int pageSize){
        if(search.equals("없음")){
            search="";
        }
        manufacturingInstructionVO instructionVO = new manufacturingInstructionVO();
        instructionVO.setRecipe_Name(search);
        instructionVO.setManufacturing_Status(status);

        int count = service.maxpageCount(instructionVO);
        System.out.println("서비스실행개수" +count);

        int totalPage = (int)(Math.ceil((double)count/pageSize));

        return new ResponseEntity<>(totalPage, HttpStatus.OK);
    }


    @PostMapping("/insertInstruction/{recipe_Name}/{output}/{instruction_Employee}")
    public ResponseEntity<?> insertInstruction(
            @PathVariable("output") int output,
            @PathVariable("recipe_Name") String recipe_Name,
            @PathVariable("instruction_Employee") String instruction_Employee
    ) {
        return new ResponseEntity<>(service.insertInstruction(recipe_Name, output, instruction_Employee), HttpStatus.OK);
    }

    @PostMapping("/selectRowClickInstruction/{instruction_Id}")
    public ResponseEntity<manufacturingInstructionVO> selectRowClickInstruction(@PathVariable("instruction_Id") int instruction_ID){
        return new ResponseEntity<>(service.selectRowClickInstruction(instruction_ID), HttpStatus.OK);
    }

    @PostMapping("/updateInstruction/{output}/{instruction_Id}")
    public ResponseEntity<Integer> updateInstruction(
            @PathVariable("output") int output,
            @PathVariable("instruction_Id") int instruction_Id
    ){
        return new ResponseEntity<>(service.updateInstruction(output,instruction_Id), HttpStatus.OK);
    }

    @PostMapping("/deleteInstruction/{instruction_Id}")
    public ResponseEntity<Integer> deleteInstruction(
            @PathVariable("instruction_Id") int instruction_Id
    ){
        return new ResponseEntity<>(service.deleteInstruction(instruction_Id), HttpStatus.OK);
    }

    @PostMapping("/updateInstructionRemainingProduction/{remainingProduction}/{instruction_Id}")
    public ResponseEntity<Integer> updateInstructionRemainingProduction(
            @PathVariable("remainingProduction") int remainingProduction,
            @PathVariable("instruction_Id") int instruction_Id
    ){
        return new ResponseEntity<>(service.updateInstructionRemainingProduction(remainingProduction, instruction_Id), HttpStatus.OK);
    }
    @PostMapping("/deleteRemainingProduction/{instruction_Id}/{remainingProduction}")
    public ResponseEntity<Integer> updateInstructionRemainingProductionInPerform(
            @PathVariable("instruction_Id") int instruction_Id,
            @PathVariable("remainingProduction") int remainingProduction

    ){
        return new ResponseEntity<>(service.updateInstructionRemainingProductionInPerform(instruction_Id, remainingProduction), HttpStatus.OK);
    }


    @PostMapping("/selectOutputAndRemainingProduction/{instruction_Id}")
    public ResponseEntity<manufacturingInstructionVO> selectOutputAndRemainingProduction(
            @PathVariable("instruction_Id") int instruction_Id

    ){
        return new ResponseEntity<>(service.selectOutputAndRemainingProduction(instruction_Id), HttpStatus.OK);
    }

    @PostMapping("/updateInstructionStatus/{instruction_Id}")
    public ResponseEntity<Integer> updateInstructionStatus(
            @PathVariable("instruction_Id") int instruction_Id
    ){
        return new ResponseEntity<>(service.updateInstructionStatus(instruction_Id), HttpStatus.OK);
    }
}
