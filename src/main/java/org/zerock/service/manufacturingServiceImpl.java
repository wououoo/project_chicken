package org.zerock.service;

import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.recipeVO;
import org.zerock.mapper.recipeMapper;

import java.util.List;
@Log4j
@Service
public class manufacturingServiceImpl implements manufacturingService{
    @Autowired
    private recipeMapper mapper;

    @Override
    public List<recipeVO> getRecipeList(){
        return mapper.recipeList();
    }
}
