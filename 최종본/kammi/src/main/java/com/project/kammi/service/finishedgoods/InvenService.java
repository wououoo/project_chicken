package com.project.kammi.service.finishedgoods;

import com.project.kammi.domain.finishedgoods.FinishedGoodsVO;
import com.project.kammi.domain.finishedgoods.GoodsInvenVO;
import com.project.kammi.domain.paging.PagingVO;

import java.util.List;

public interface InvenService {
    public List<FinishedGoodsVO> goodsList();

    public List<GoodsInvenVO> availableStorage(PagingVO pagingVO, GoodsInvenVO goodsInvenVO);

    public int countInvenModal(GoodsInvenVO goodsInvenVO);

    public List<GoodsInvenVO> invenTable(PagingVO pagingVO, GoodsInvenVO goodsInvenVO);

    public int invenMaxCount(GoodsInvenVO goodsInvenVO);

    public void invenOuter(GoodsInvenVO goodsInvenVO);

}