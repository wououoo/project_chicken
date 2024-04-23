package com.project.kammi.service.login;

import com.project.kammi.domain.login.MemberVO;

public interface MemberService {

    int putMember(MemberVO memberVO);

    int checkDuplicateUsername(String username);

    void updateUser(MemberVO memberVO);

}
