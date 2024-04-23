package com.project.kammi.controller.manufacturing.instruction;

import com.project.kammi.domain.manufacturing.manufacturingInstructionVO;
import com.project.kammi.service.manufacturing.instruction.instructionService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@Log4j
@RequestMapping("/instruction")
@AllArgsConstructor
public class instructionController {
    private instructionService service;

    @GetMapping
    public String selectRecipe(Model model){
        List<manufacturingInstructionVO> vo = service.selectRecipeName();
        List<manufacturingInstructionVO> vo1 = service.selectInstructionForInsertPerform();
        model.addAttribute("recipe",vo);
        model.addAttribute("insertPerform", vo1);
        return "/manufacturing/instruction";
    }

}
