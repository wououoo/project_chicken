package com.project.kammi.controller.login;

import com.project.kammi.domain.login.MemberVO;
import com.project.kammi.service.login.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/member")
public class IndexController {
    @Autowired
    private MemberService memberService;

    @Autowired
    private AuthenticationManager authenticationManager;

    @GetMapping("/join")
    public String join() {
        return "/member/join";
    }

    // 회원가입
    @PostMapping("/joinProc")
    public String joinProc(MemberVO memberVO) {
        System.out.println("회원가입 진행: " + memberVO);

        memberService.putMember(memberVO);

        return "redirect:/member/login";
    }

    // 로그인 페이지
    @GetMapping("/login")
    public String login(@RequestParam(value = "error", required = false) String error,
                        @RequestParam(value = "exception", required = false) String exception,
                        Model model) {
        model.addAttribute("error", error);
        model.addAttribute("exception", exception);
        return "/member/login";
    }

    @GetMapping("/mypage")
    public String mypage() {

        return "/admin/mypage";
    }

    @PostMapping("/userupdate")
    public String updateUser(@ModelAttribute MemberVO memberVO) {

        memberService.updateUser(memberVO);

        Authentication authentication = authenticationManager.authenticate
                (new UsernamePasswordAuthenticationToken(memberVO.getUsername(),memberVO.getPassword()));
        SecurityContextHolder.getContext().setAuthentication(authentication);

        return "redirect:/member/mypage";
    }

    // 계정 중복체크
    @ResponseBody
    @GetMapping("/idCheck")
    public int checkDuplicateId(@RequestParam String id) {
        return memberService.checkDuplicateUsername(id);
    }

    // 에러페이지
    @GetMapping("/access-denied")
    public String accessDenied() {
        return "access-denied"; // access-denied.jsp로 이동
    }

}

