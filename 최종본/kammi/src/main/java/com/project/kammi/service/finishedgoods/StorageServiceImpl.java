package com.project.kammi.service.finishedgoods;

import com.project.kammi.domain.finishedgoods.StorageVO;
import com.project.kammi.domain.paging.PagingVO;
import com.project.kammi.mapper.finishedgoods.StorageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StorageServiceImpl implements StorageService{

    @Autowired
    private StorageMapper storageMapper;
    @Override
    public void storageInsert(StorageVO storageVO) {
        storageMapper.storageInsert(storageVO);
    }

    @Override
    public List<StorageVO> storageSelect(PagingVO pagingVO, StorageVO storageVO) {
        return storageMapper.storageSelect(pagingVO, storageVO);
    }

    @Override
    public int storageMaxCount(StorageVO storageVO) {
        return storageMapper.storageMaxCount(storageVO);
    }

    @Override
    public void storageRemove(StorageVO storageVO) {
        storageMapper.storageDelete(storageVO);
    }

    @Override
    public void storageChange(StorageVO storageVO) {
        storageMapper.storageUpdate(storageVO);
    }

    @Override
    public List<StorageVO> storageId() {
        return storageMapper.storageIdSelect();
    }

    @Override
    public void storageAmountUpdate(StorageVO storageVO) {
        storageMapper.storageAmountUpdate(storageVO);
    }
}
