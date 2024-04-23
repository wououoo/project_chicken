package com.project.kammi.controller.login;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyErrorController implements ErrorController {
    @RequestMapping("/")
    public String home() {
        return "redirect:/main";
    }
    @RequestMapping("/error")
    public String handleError(HttpServletRequest request) {
        return "/error/access-denied";
    }
}
