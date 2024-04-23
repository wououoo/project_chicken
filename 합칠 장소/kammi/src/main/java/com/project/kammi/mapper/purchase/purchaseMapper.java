package com.project.kammi.mapper.purchase;

import com.project.kammi.domain.purchase.*;

import java.util.List;

public interface purchaseMapper {
    List<materialssupplierVO> materialssupplierRead();
    List<materialsVO> materialListRead(int offset, int limit);
    List<materialsVO> materialsRead(String part);
    void materialInsert(materialsVO vo);
    List<materialssupplierVO> supplierRead(String part);
    materialsVO materialRead(String part);
    void purchaseListInsert(purchaseListVO vo);
    void materialPurchaseInsert(List<materialPurchaseVO> vo);
    List<purchaseListVO> purchaseListRead();
    List<materialPurchaseVO> materialPurchaseRead(int purchaseid);
    void materialDelete(int materialid);
    List<categoryVO> categoryRead(String category);
    int pageCount(int pageSize);
    int purchasePageCount(int pageSize);
}