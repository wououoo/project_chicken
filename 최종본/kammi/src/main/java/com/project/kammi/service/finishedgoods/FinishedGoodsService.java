package com.project.kammi.service.finishedgoods;

import com.project.kammi.domain.finishedgoods.FinishedGoodsVO;
import com.project.kammi.domain.paging.PagingVO;
import com.project.kammi.domain.manufacturing.fileVO;

import java.util.List;

public interface FinishedGoodsService {
    public List<FinishedGoodsVO> selectGoods(PagingVO paging, FinishedGoodsVO finishedGoodsVO);

    public List<FinishedGoodsVO> selectRecipe();

    public int updateGoods(FinishedGoodsVO goods);

    public void deleteGoods();

    public int maxCount(FinishedGoodsVO finishedGoodsVO);

    public void insertGoods(FinishedGoodsVO finishedGoodsVO);

    public List<FinishedGoodsVO> recipeNum();

    public List<FinishedGoodsVO> goodsId();

    public void goodsQuantity(FinishedGoodsVO finishedGoodsVO);

    public List<fileVO> mainFileImage();
}
