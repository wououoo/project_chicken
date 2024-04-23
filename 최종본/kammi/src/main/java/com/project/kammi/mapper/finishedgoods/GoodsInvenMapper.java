package com.project.kammi.mapper.finishedgoods;

import com.project.kammi.domain.finishedgoods.FinishedGoodsVO;
import com.project.kammi.domain.finishedgoods.GoodsInvenVO;
import com.project.kammi.domain.paging.PagingVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodsInvenMapper {
    public List<FinishedGoodsVO> readyGoods();

    public List<GoodsInvenVO> invenModalTable(@Param("paging") PagingVO pagingVO, @Param("inven") GoodsInvenVO goodsInvenVO);

    public int countInvenModal(@Param("inven") GoodsInvenVO goodsInvenVO);

    public List<GoodsInvenVO> invenTable(@Param("paging")PagingVO pagingVO, @Param("inven") GoodsInvenVO goodsInvenVO);

    public int invenMaxCount(@Param("inven") GoodsInvenVO goodsInvenVO);

    public void invenOutter(GoodsInvenVO goodsInvenVO);
    public void invenOutterUpdate(GoodsInvenVO goodsInvenVO);
}
