package com.project.kammi.service.purchase;

import com.project.kammi.domain.purchase.*;
import com.project.kammi.mapper.purchase.purchaseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class purchaseServiceImpl implements purchaseService{
    @Autowired
    private purchaseMapper mapper;
    @Override
    public List<materialssupplierVO> materialssupplierRead() {
        return mapper.materialssupplierRead();
    }

    @Override
    public void materialInsert(materialsVO vo) {
        mapper.materialInsert(vo);
    }

    @Override
    public List<materialsVO> materialListRead() {
        materialsVO materialsVO = new materialsVO();
        int offset = (materialsVO.getPageNumber() - 1) * materialsVO.getPageSize();

        return mapper.materialListRead(offset,materialsVO.getPageSize());
        
    }

    public List<materialsVO> materialListRead(int pageNum) {
        materialsVO materialsVO = new materialsVO();
        materialsVO.setPageNumber(pageNum);
        int offset = (materialsVO.getPageNumber() - 1) * materialsVO.getPageSize();

        return mapper.materialListRead(offset,materialsVO.getPageSize());

    }

    @Override
    public List<materialsVO> materialsRead(String part) {
        return mapper.materialsRead(part);
    }

	@Override
	public List<materialssupplierVO> supplierRead(String part) {
		return mapper.supplierRead(part);
	}

    @Override
    public materialsVO materialRead(String part) {
        return mapper.materialRead(part);
    }

    @Override
    public void purchaseListInsert(purchaseListVO vo) {
        mapper.purchaseListInsert(vo);
    }

    @Override
    public void materialPurchaseInsert(List<materialPurchaseVO> vo) {
        mapper.materialPurchaseInsert(vo);
    }

    @Override
    public List<purchaseListVO> purchaseListRead() {
        return mapper.purchaseListRead();
    }

    @Override
    public List<materialPurchaseVO> materialPurchaseRead(int purchaseid) {
        return mapper.materialPurchaseRead(purchaseid);
    }

	@Override
	public void materialDelete(int materialid) {
		mapper.materialDelete(materialid);
		
	}

	@Override
	public List<categoryVO> categoryRead(String category) {
		return mapper.categoryRead(category);
	}

    @Override
    public int pageCount() {
        materialsVO materialsVO = new materialsVO();
        return mapper.pageCount(materialsVO.getPageSize());
    }

    @Override
    public int purchasePageCount() {
        materialsVO materialsVO = new materialsVO();
        return mapper.purchasePageCount(materialsVO.getPageSize());
    }
}
