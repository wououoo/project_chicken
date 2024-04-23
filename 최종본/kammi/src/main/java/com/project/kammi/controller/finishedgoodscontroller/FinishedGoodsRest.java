package com.project.kammi.controller.finishedgoodscontroller;

import com.project.kammi.domain.finishedgoods.FinishedGoodsVO;
import com.project.kammi.domain.paging.PagingVO;
import com.project.kammi.service.finishedgoods.FinishedGoodsService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/goodsrest")
@AllArgsConstructor
public class FinishedGoodsRest {
    private FinishedGoodsService service;

    @RequestMapping(method = {RequestMethod.PUT,RequestMethod.PATCH},
            value = "/name/{name}/price/{price}/units/{units}/status/{status}",consumes = "application/json",
            produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> goodsUpdate(@PathVariable("name") String name, @PathVariable("price") int price, @PathVariable("status") int status, @PathVariable("units") String units){
        FinishedGoodsVO goods = new FinishedGoodsVO();
        goods.setFinishedgoods_name(name);
        goods.setFinishedgoods_price(price);
        goods.setFinishedgoods_status(status);
        goods.setQuantity_units(units);
        return service.updateGoods(goods)==1?
                new ResponseEntity<>("Success", HttpStatus.OK)
                :new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @GetMapping(value = "/search/{search}/status/{status}/page/{page}/pagesize/{pagesize}",produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<FinishedGoodsVO>>getList(@PathVariable("page")int page,
                                                        @PathVariable("pagesize")int pagesize,
                                                        @PathVariable("search")String search,
                                                        @PathVariable("status")int status){

        System.out.println("검색"+search+"상태"+status);

        PagingVO pageing = new PagingVO();
        pageing.setPageNum(page);
        pageing.setPageSize(pagesize);

        FinishedGoodsVO goodsVO = new FinishedGoodsVO();
        if(search.equals("없음")){
            search="";
        }

        goodsVO.setFinishedgoods_name(search);
        goodsVO.setFinishedgoods_status(status);

        return new ResponseEntity<>(service.selectGoods(pageing,goodsVO),HttpStatus.OK);
    }

    @GetMapping(value="/{search}/{status}/pageSize/{pageSize}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<Integer>maxPage(@PathVariable("search")String search,
                                          @PathVariable("status")int status,
                                          @PathVariable("pageSize")int pageSize){
        if(search.equals("없음")){
            search="";
        }
        FinishedGoodsVO finishedGoodsVO = new FinishedGoodsVO();
        finishedGoodsVO.setFinishedgoods_name(search);
        finishedGoodsVO.setFinishedgoods_status(status);
        int count = service.maxCount(finishedGoodsVO);
        int totalPage = (int)(Math.ceil((double)count/pageSize));

        return new ResponseEntity<>(totalPage, HttpStatus.OK);
    }


}
