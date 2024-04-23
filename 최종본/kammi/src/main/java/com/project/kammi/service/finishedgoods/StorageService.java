package com.project.kammi.service.finishedgoods;

import com.project.kammi.domain.finishedgoods.StorageVO;
import com.project.kammi.domain.paging.PagingVO;

import java.util.List;

public interface StorageService {
    public void storageInsert(StorageVO storageVO);
    public List<StorageVO> storageSelect(PagingVO pagingVO, StorageVO storageVO);

    public int storageMaxCount(StorageVO storageVO);
    public void storageRemove(StorageVO storageVO);
    public void storageChange(StorageVO storageVO);

    public List<StorageVO> storageId();
    public void storageAmountUpdate(StorageVO storageVO);
}