package com.project.kammi.service.purchase;

import com.project.kammi.domain.purchase.*;

import java.util.List;

public interface purchaseService {
    public List<materialssupplierVO> materialssupplierRead();
    public List<materialsVO> materialListRead();
    public List<materialsVO> materialListRead(int pageNum);
    public List<materialsVO> materialsRead(String part);
    public void materialInsert(materialsVO vo);
    public List<materialssupplierVO> supplierRead(String part);
    public materialsVO materialRead(String part);
    public void purchaseListInsert(purchaseListVO vo);
    public void materialPurchaseInsert(List<materialPurchaseVO> vo);
    public List<purchaseListVO> purchaseListRead();
    public List<materialPurchaseVO> materialPurchaseRead(int purchaseid);
    public void materialDelete(int materialid);
    public List<categoryVO> categoryRead(String category);
    public int pageCount();
    public int purchasePageCount();

}
