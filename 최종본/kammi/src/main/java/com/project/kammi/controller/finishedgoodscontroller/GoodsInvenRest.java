package com.project.kammi.controller.finishedgoodscontroller;

import com.project.kammi.domain.finishedgoods.FinishedGoodsVO;
import com.project.kammi.domain.finishedgoods.GoodsInvenVO;
import com.project.kammi.domain.paging.PagingVO;
import com.project.kammi.service.finishedgoods.InvenService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/invenrest")
@AllArgsConstructor
public class GoodsInvenRest {
    private InvenService invenService;
    @GetMapping(value = "/goods",produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<FinishedGoodsVO>> readyGoodsList(){
        return new ResponseEntity<>(invenService.goodsList(), HttpStatus.OK);
    }

    @GetMapping(value = "/storage/{goodsnum}/page/{page}/pagesize/{pagesize}",produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<GoodsInvenVO>> availableStorage(@PathVariable("goodsnum") int goodsnum,
                                                               @PathVariable("page") int page,
                                                               @PathVariable("pagesize") int pagesize){
        GoodsInvenVO goodsInvenVO = new GoodsInvenVO();
        goodsInvenVO.setFinishedgoodsinventory_goods_id(goodsnum);
        PagingVO pagingVO = new PagingVO();
        pagingVO.setPageNum(page);
        pagingVO.setPageSize(pagesize);

        return new ResponseEntity<>(invenService.availableStorage(pagingVO,goodsInvenVO), HttpStatus.OK);
    }

    @GetMapping(value="/{goodsnum}/{pagesize}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<Integer>countInvenModal(@PathVariable("goodsnum")int goodsNum,
                                                  @PathVariable("pagesize")int pageSize){

        GoodsInvenVO goodsInvenVO = new GoodsInvenVO();
        goodsInvenVO.setFinishedgoodsinventory_goods_id(goodsNum);

        int count = invenService.countInvenModal(goodsInvenVO);
        int totalPage = (int)(Math.ceil((double)count/pageSize));

        return new ResponseEntity<>(totalPage, HttpStatus.OK);
    }

    @GetMapping(value = "/inven/division/{division}/goods/{goods}/page/{page}/pagesize/{pagesize}",produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<GoodsInvenVO>> invenTable(@PathVariable("division") String division,
                                                         @PathVariable("goods") String goods,
                                                         @PathVariable("page") int page,
                                                         @PathVariable("pagesize") int pagesize){
        if(division.equals("전체")){
            division="";
        }
        if(goods.equals("없음")){
            goods="";
        }

        GoodsInvenVO goodsInvenVO = new GoodsInvenVO();
        goodsInvenVO.setFinishedgoodsinventory_goods_name(goods);
        goodsInvenVO.setFinishedgoodsinventory_division(division);
        PagingVO pagingVO = new PagingVO();
        pagingVO.setPageNum(page);
        pagingVO.setPageSize(pagesize);

        return new ResponseEntity<>(invenService.invenTable(pagingVO,goodsInvenVO), HttpStatus.OK);
    }

    @GetMapping(value="/{division}/{goods}/{pagesize}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<Integer>maxCountPage(@PathVariable("division")String division,
                                               @PathVariable("goods")String goods,
                                               @PathVariable("pagesize")int pageSize){
        if(division.equals("전체")){
            division="";
        }
        if(goods.equals("없음")){
            goods="";
        }

        GoodsInvenVO goodsInvenVO = new GoodsInvenVO();
        goodsInvenVO.setFinishedgoodsinventory_goods_name(goods);
        goodsInvenVO.setFinishedgoodsinventory_division(division);
        int count = invenService.invenMaxCount(goodsInvenVO);
        int totalPage = (int)(Math.ceil((double)count/pageSize));

        return new ResponseEntity<>(totalPage, HttpStatus.OK);
    }

    @PostMapping(value = "/add", consumes = "application/json",produces={MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> outterInsert(@RequestBody GoodsInvenVO goodsInvenVO){

        invenService.invenOuter(goodsInvenVO);
        return new ResponseEntity<>("입력됨", HttpStatus.OK);
    }
}

