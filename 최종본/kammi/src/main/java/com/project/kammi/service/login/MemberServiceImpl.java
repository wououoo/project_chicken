package com.project.kammi.service.login;

import com.project.kammi.domain.login.MemberVO;
import com.project.kammi.mapper.login.MemberMapper;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService{
    @Autowired
    private MemberMapper memberMapper;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public int putMember(MemberVO memberVO) {

        String rawPwd = memberVO.getPassword();
        String encrypPwd = bCryptPasswordEncoder.encode(rawPwd);
        memberVO.setPassword(encrypPwd);
        memberVO.setProvider(Strings.EMPTY);
        memberVO.setProviderId(Strings.EMPTY);

        return memberMapper.insertMember(memberVO);
    }

    @Override
    public int checkDuplicateUsername(String username) {
        return memberMapper.checkDuplicateId(username);
    }



    @Override
    @Transactional
    public void updateUser(MemberVO memberVO) {
        memberMapper.updateUser(memberVO);
    }
}
