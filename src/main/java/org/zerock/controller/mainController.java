package org.zerock.controller;

import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.recipeVO;
import org.zerock.service.manufacturingService;

import java.util.List;

@Controller
@RequestMapping("/main")
public class mainController {

    @GetMapping
    public String index() {


        return "admin/index";
    }
}
