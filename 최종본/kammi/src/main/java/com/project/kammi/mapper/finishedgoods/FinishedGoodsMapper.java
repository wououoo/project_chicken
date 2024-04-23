package com.project.kammi.mapper.finishedgoods;

import com.project.kammi.domain.finishedgoods.FinishedGoodsVO;
import com.project.kammi.domain.paging.PagingVO;
import org.apache.ibatis.annotations.Param;
import com.project.kammi.domain.manufacturing.fileVO;

import java.util.List;

public interface FinishedGoodsMapper {

    public List<fileVO> mainImage();
    public List<FinishedGoodsVO> getGoodsList(@Param("paging") PagingVO paging, @Param("goods") FinishedGoodsVO finishedGoodsVO);
    public List<FinishedGoodsVO> getRecipeList();
    public int goodsUpdate(FinishedGoodsVO goods);

    public int maxpageCount(@Param("goods") FinishedGoodsVO finishedGoodsVO);

    public void goodsDelete();

    public void goodsAdd(FinishedGoodsVO finishedGoodsVO);
    public List<FinishedGoodsVO> recipeId();

    public List<FinishedGoodsVO> goodsIdSelect();
    public void goodsQuantityUpdate(FinishedGoodsVO finishedGoodsVO);
}
