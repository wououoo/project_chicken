package com.project.kammi.controller.manufacturing.perform;

import com.project.kammi.domain.manufacturing.manufacturingPerformVO;
import com.project.kammi.domain.manufacturing.performPagingVO;
import com.project.kammi.service.manufacturing.perform.performService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/perform/rest")
@RestController
@Log4j
@AllArgsConstructor
public class performRestController {
    private performService service;
    @GetMapping(value = "/search/{search}/page/{page}/pagesize/{pagesize}/{manufacturing_Line}",produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<manufacturingPerformVO>> getList(@PathVariable("page")int page,
                                                                    @PathVariable("pagesize")int pagesize,
                                                                    @PathVariable("search")String search,
                                                                    @PathVariable("manufacturing_Line")String manufacturing_Line){
        System.out.println("검색"+search);

        performPagingVO pageing = new performPagingVO();
        pageing.setPageNum(page);
        pageing.setPageSize(pagesize);
        System.out.println("페이지보기" +pageing);

        manufacturingPerformVO performVO = new manufacturingPerformVO();
        if(search.equals("없음")){
            search="";
        }

        performVO.setRecipe_Name(search);
        performVO.setManufacturing_Line(manufacturing_Line);

        return new ResponseEntity<>(service.selectAllPerform(pageing,performVO), HttpStatus.OK);
    }

    @GetMapping(value="/{search}/{manufacturing_Line}/pageSize/{pageSize}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<Integer>maxpageCount(@PathVariable("search")String search,
                                              @PathVariable("manufacturing_Line")String manufacturing_Line,
                                              @PathVariable("pageSize")int pageSize){
        if(search.equals("없음")){
            search="";
        }
        manufacturingPerformVO performVO = new manufacturingPerformVO();
        performVO.setRecipe_Name(search);
        performVO.setManufacturing_Line(manufacturing_Line);

        int count = service.maxpageCount(performVO);
        System.out.println("서비스실행개수 perform" +count);

        int totalPage = (int)(Math.ceil((double)count/pageSize));

        return new ResponseEntity<>(totalPage, HttpStatus.OK);
    }

    @PostMapping("/selectRowClickPerform/{perform_Id}")
    public ResponseEntity<manufacturingPerformVO> selectRowClickInstruction(@PathVariable("perform_Id") int perform_Id){
        return new ResponseEntity<>(service.selectRowClickPerform(perform_Id), HttpStatus.OK);
    }

    @PostMapping("/InsertPerformForControl/{manufacturing_Line}/{instruction_Id}/{output}/{perform_Employee}")
    public String insertPerform(@PathVariable("manufacturing_Line") String manufacturing_Line,
                                @PathVariable("instruction_Id") int instruction_Id,
                                @PathVariable("output") int output,
                                @PathVariable("perform_Employee") String perform_Employee
                                ) {
        try {
            int count = service.insertPerform(manufacturing_Line, instruction_Id, output, perform_Employee);
            return (count + "개");
        } catch (Exception e) {
            e.printStackTrace();
            return "Error occurred: " + e.getMessage();
        }
    }

    @PostMapping("/selectLineAndEmployee")
    public ResponseEntity<List<manufacturingPerformVO>> selectLineAndEmployee(){
        return new ResponseEntity<>(service.selectLineAndEmployee(), HttpStatus.OK);
    }

    @PostMapping("/update/{manufacturing_Line}/{output}/{perform_Employee}/{perform_Id}")
    public ResponseEntity<Integer> updatePerform(
            @PathVariable("manufacturing_Line") String manufacturing_Line,
            @PathVariable("output") int output,
            @PathVariable("perform_Employee") String perform_Employee,
            @PathVariable("perform_Id") int perform_Id
    ){
        return new ResponseEntity<>(service.updatePerform(manufacturing_Line, output, perform_Employee, perform_Id), HttpStatus.OK);
    }

    @PostMapping("/selectIngPerform")
    public ResponseEntity<List<manufacturingPerformVO>> selectStartDateForUpdate(
    ){
        return new ResponseEntity<>(service.selectStartDateForUpdate(), HttpStatus.OK);
    }

    @PostMapping("/selectIngStartDate/{perform_Id}")
    public ResponseEntity<manufacturingPerformVO> selectStartDate(
            @PathVariable("perform_Id") int perform_Id
    ){
        return new ResponseEntity<>(service.selectStartDate(perform_Id), HttpStatus.OK);
    }
    @PostMapping("/deletePerform/{perform_Id}")
    public ResponseEntity<Integer> deletePerform(
            @PathVariable("perform_Id") int perform_Id
    ){
        return new ResponseEntity<>(service.deletePerform(perform_Id), HttpStatus.OK);
    }

    @PostMapping("/updateMaterialAllAmount/{output}/{recipe_Name}")
    public ResponseEntity<Integer> updateMaterialAllAmount(
            @PathVariable("output") int output,
            @PathVariable("recipe_Name") String recipe_Name
    ){
        return new ResponseEntity<>(service.updateMaterialAllAmount(output, recipe_Name), HttpStatus.OK);
    }

    @PostMapping("/selectRecipeName/{instruction_Id}")
    public ResponseEntity<manufacturingPerformVO> selectRecipeName(
            @PathVariable("instruction_Id") int instruction_Id
    ){
        return new ResponseEntity<>(service.selectRecipeName(instruction_Id), HttpStatus.OK);
    }

    @PostMapping("/updatePerformTimeStatus/{perform_Id}")
    public ResponseEntity<Integer> updatePerformTimeStatus(
            @PathVariable("perform_Id") int perform_Id
    ){
        return new ResponseEntity<>(service.updatePerformTimeStatus(perform_Id), HttpStatus.OK);
    }
    @PostMapping("/updatePerformTimeStatus2/{perform_Id}")
    public ResponseEntity<Integer> updatePerformTimeStatus2(
            @PathVariable("perform_Id") int perform_Id
    ){
        return new ResponseEntity<>(service.updatePerformTimeStatus2(perform_Id), HttpStatus.OK);
    }
    @PostMapping("/updatePerformTimeStatus3/{perform_Id}")
    public ResponseEntity<Integer> updatePerformTimeStatus3(
            @PathVariable("perform_Id") int perform_Id
    ){
        return new ResponseEntity<>(service.updatePerformTimeStatus3(perform_Id), HttpStatus.OK);
    }
    @PostMapping("/updatePerformTimeStatus4/{perform_Id}")
    public ResponseEntity<Integer> updatePerformTimeStatus4(
            @PathVariable("perform_Id") int perform_Id
    ){
        return new ResponseEntity<>(service.updatePerformTimeStatus4(perform_Id), HttpStatus.OK);
    }
    @PostMapping("/updatePerformTimeStatus5/{perform_Id}")
    public ResponseEntity<Integer> updatePerformTimeStatus5(
            @PathVariable("perform_Id") int perform_Id
    ){
        return new ResponseEntity<>(service.updatePerformTimeStatus5(perform_Id), HttpStatus.OK);
    }
    @PostMapping("/updatePerformTimeStatus6/{perform_Id}")
    public ResponseEntity<Integer> updatePerformTimeStatus6(
            @PathVariable("perform_Id") int perform_Id
    ){
        return new ResponseEntity<>(service.updatePerformTimeStatus6(perform_Id), HttpStatus.OK);
    }

    @PostMapping("/selectPerformAllTime/{perform_Id}")
    public ResponseEntity<manufacturingPerformVO> selectPerformAllTime(
            @PathVariable("perform_Id") int perform_Id
    ){
        return new ResponseEntity<>(service.selectPerformAllTime(perform_Id), HttpStatus.OK);
    }
    @PostMapping("/selectPerformAllTime/{output}/{recipe_Name}")
    public ResponseEntity<?> updateFinishedGoodsQuantity(
            @PathVariable("output") int output,
            @PathVariable("recipe_Name") String recipe_Name
    ){
        return new ResponseEntity<>(service.updateFinishedGoodsQuantity(output, recipe_Name), HttpStatus.OK);
    }
}
