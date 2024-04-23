package com.project.kammi.mapper.login;

import com.project.kammi.domain.login.MemberVO;

public interface MemberMapper {
    int insertMember(MemberVO memberVO);

    int checkDuplicateId(String username);

    MemberVO selectByUserName(String username);

    void updateUser(MemberVO memberVO);
}

