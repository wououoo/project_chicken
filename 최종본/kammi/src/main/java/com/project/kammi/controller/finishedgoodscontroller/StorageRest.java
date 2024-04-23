package com.project.kammi.controller.finishedgoodscontroller;

import com.project.kammi.domain.finishedgoods.StorageVO;
import com.project.kammi.domain.paging.PagingVO;
import com.project.kammi.service.finishedgoods.StorageService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/storagerest")
@AllArgsConstructor
public class StorageRest {
    private StorageService storageService;

    @PostMapping(value = "/add", consumes = "application/json",produces={MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> createStorage(@RequestBody StorageVO storageVO){

        storageService.storageInsert(storageVO);
        return new ResponseEntity<>("입력됨", HttpStatus.OK);
    }

    @GetMapping(value = "/search/{search}/status/{status}/page/{page}/pagesize/{pagesize}",produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<StorageVO>>readStorage(@PathVariable("page")int page,
                                                      @PathVariable("pagesize")int pagesize,
                                                      @PathVariable("search")String search,
                                                      @PathVariable("status")int status){

        System.out.println("검색"+search+"상태"+status);

        PagingVO pageing = new PagingVO();
        pageing.setPageNum(page);
        pageing.setPageSize(pagesize);

        StorageVO storageVO = new StorageVO();
        if(search.equals("없음")){
            search="";
        }
        storageVO.setStorage_name(search);
        storageVO.setStorage_current_amount(status);

        return new ResponseEntity<>(storageService.storageSelect(pageing,storageVO),HttpStatus.OK);
    }

    @GetMapping(value="/{search}/{status}/pageSize/{pageSize}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<Integer>maxStoragePage(@PathVariable("search")String search,
                                                 @PathVariable("status")int status,
                                                 @PathVariable("pageSize")int pageSize){
        if(search.equals("없음")){
            search="";
        }
        StorageVO storageVO = new StorageVO();
        storageVO.setStorage_name(search);
        storageVO.setStorage_current_amount(status);
        int count = storageService.storageMaxCount(storageVO);
        int totalPage = (int)(Math.ceil((double)count/pageSize));

        return new ResponseEntity<>(totalPage, HttpStatus.OK);
    }

    @DeleteMapping(value = "/snum/{snum}",produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> remove(@PathVariable("snum")int snum){

        StorageVO storageVO = new StorageVO();
        storageVO.setStorage_id(snum);
        storageService.storageRemove(storageVO);
        return new ResponseEntity<>("Success",HttpStatus.OK);
    }

    @RequestMapping(method = {RequestMethod.PUT,RequestMethod.PATCH},
            value = "/address/{address}/total/{total}/id/{id}",consumes = "application/json",
            produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> goodsUpdate(@PathVariable("address") String address,@PathVariable("total") int total, @PathVariable("id") int id){
        StorageVO storageVO = new StorageVO();
        storageVO.setStorage_address(address);
        storageVO.setStorage_total_amount(total);
        storageVO.setStorage_id(id);
        storageService.storageChange(storageVO);

        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

}

