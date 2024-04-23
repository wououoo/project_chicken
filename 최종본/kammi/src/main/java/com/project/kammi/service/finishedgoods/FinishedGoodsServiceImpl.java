package com.project.kammi.service.finishedgoods;

import com.project.kammi.domain.finishedgoods.FinishedGoodsVO;
import com.project.kammi.domain.paging.PagingVO;
import com.project.kammi.mapper.finishedgoods.FinishedGoodsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FinishedGoodsServiceImpl implements FinishedGoodsService{

    @Autowired
    private FinishedGoodsMapper finishedGoodsMapper;
    @Override
    public List<FinishedGoodsVO> selectGoods(PagingVO paging, FinishedGoodsVO finishedGoodsVO){
        List<FinishedGoodsVO> goods = finishedGoodsMapper.getGoodsList(paging,finishedGoodsVO);


        return goods;
    }

    @Override
    public List<FinishedGoodsVO> selectRecipe() {
        return finishedGoodsMapper.getRecipeList();
    }

    @Override
    public int updateGoods(FinishedGoodsVO goods) {
        return finishedGoodsMapper.goodsUpdate(goods);
    }

    @Override
    public void deleteGoods() {
        finishedGoodsMapper.goodsDelete();
    }

    @Override
    public int maxCount(FinishedGoodsVO finishedGoodsVO) {
        return finishedGoodsMapper.maxpageCount(finishedGoodsVO);
    }

    @Override
    public void insertGoods(FinishedGoodsVO finishedGoodsVO) {
        finishedGoodsMapper.goodsAdd(finishedGoodsVO);
    }

    @Override
    public List<FinishedGoodsVO> recipeNum() {
        return finishedGoodsMapper.recipeId();
    }

    @Override
    public List<FinishedGoodsVO> goodsId() {
        return finishedGoodsMapper.goodsIdSelect();
    }

    @Override
    public void goodsQuantity(FinishedGoodsVO finishedGoodsVO) {
        finishedGoodsMapper.goodsQuantityUpdate(finishedGoodsVO);
    }
}
