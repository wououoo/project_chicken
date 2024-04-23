package com.project.kammi.controller.finishedgoodscontroller;

import com.project.kammi.domain.finishedgoods.FinishedGoodsVO;
import com.project.kammi.domain.finishedgoods.StorageVO;
import com.project.kammi.service.finishedgoods.FinishedGoodsService;
import com.project.kammi.service.finishedgoods.StorageService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/finishedgoods")
@AllArgsConstructor
public class FinishedGoodsController {
    private FinishedGoodsService service;
    private StorageService storageService;

    @GetMapping("/goodsmanagement")
    public String managementpage(Model model){
        List<FinishedGoodsVO> recipelist =service.selectRecipe();
        model.addAttribute("recipelist",recipelist);

        List<FinishedGoodsVO> recipeNum = service.recipeNum();
        for(int i=0;i<recipeNum.size();i++){
            service.insertGoods(recipeNum.get(i));
            System.out.println(1+"번 실행 됨");
        }
        service.deleteGoods();

        List<FinishedGoodsVO> goodsId = service.goodsId();
        for(int i=0;i<goodsId.size();i++){
            service.goodsQuantity(goodsId.get(i));
        }

        List<StorageVO> storageNum = storageService.storageId();
        for(int i=0;i<storageNum.size();i++){
            storageService.storageAmountUpdate(storageNum.get(i));
        }

        return "/finishedgoods/goodsmanagement";
    }
}