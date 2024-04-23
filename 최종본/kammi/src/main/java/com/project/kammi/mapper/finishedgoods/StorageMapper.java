package com.project.kammi.mapper.finishedgoods;

import com.project.kammi.domain.finishedgoods.StorageVO;
import com.project.kammi.domain.paging.PagingVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StorageMapper {
    public void storageInsert(StorageVO storageVO);
    public List<StorageVO> storageSelect(@Param("paging") PagingVO paging, @Param("storage") StorageVO storage);

    public int storageMaxCount(@Param("storage") StorageVO storageVO);
    public void storageDelete(StorageVO storageVO);
    public void storageUpdate(StorageVO storageVO);

    public List<StorageVO> storageIdSelect();

    public void storageAmountUpdate(StorageVO storageVO);
}
