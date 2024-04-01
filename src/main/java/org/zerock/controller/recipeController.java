package org.zerock.controller;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.recipeVO;
import org.zerock.service.manufacturingService;

import java.util.List;

@Controller
@Log4j
@RequestMapping("/recipe")
@AllArgsConstructor
public class recipeController {
    private manufacturingService manufacturingService;
    @GetMapping
    public String index(Model model) {
        List<recipeVO> recipeVOList = manufacturingService.getRecipeList();
        model.addAttribute("recipeVOList", recipeVOList);
        log.info("레시피리스트" + recipeVOList);
        return "recipe/recipe";
    }
}
