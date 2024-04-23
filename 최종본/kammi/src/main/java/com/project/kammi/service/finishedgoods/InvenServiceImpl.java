package com.project.kammi.service.finishedgoods;

import com.project.kammi.domain.finishedgoods.FinishedGoodsVO;
import com.project.kammi.domain.finishedgoods.GoodsInvenVO;
import com.project.kammi.domain.paging.PagingVO;
import com.project.kammi.mapper.finishedgoods.GoodsInvenMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InvenServiceImpl implements InvenService{
    @Autowired
    private GoodsInvenMapper goodsInvenMapper;

    @Override
    public List<FinishedGoodsVO> goodsList() {
        return goodsInvenMapper.readyGoods();
    }

    @Override
    public List<GoodsInvenVO> availableStorage(PagingVO pagingVO, GoodsInvenVO goodsInvenVO) {
        return goodsInvenMapper.invenModalTable(pagingVO, goodsInvenVO);
    }

    @Override
    public int countInvenModal(GoodsInvenVO goodsInvenVO) {
        return goodsInvenMapper.countInvenModal(goodsInvenVO);
    }

    @Override
    public List<GoodsInvenVO> invenTable(PagingVO pagingVO, GoodsInvenVO goodsInvenVO) {
        return goodsInvenMapper.invenTable(pagingVO,goodsInvenVO);
    }

    @Override
    public int invenMaxCount(GoodsInvenVO goodsInvenVO) {
        return goodsInvenMapper.invenMaxCount(goodsInvenVO);
    }

    @Override
    public void invenOuter(GoodsInvenVO goodsInvenVO) {
        goodsInvenMapper.invenOutter(goodsInvenVO);
        goodsInvenMapper.invenOutterUpdate(goodsInvenVO);
    }
}
