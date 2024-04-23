package com.project.kammi.config.auth;

import com.project.kammi.domain.login.MemberVO;
import com.project.kammi.mapper.login.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class SpringSecPrincipalDetailsService implements UserDetailsService {

    @Autowired
    private MemberMapper memberMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        MemberVO memberVO = memberMapper.selectByUserName(username);
        if (memberVO == null) {
            throw new UsernameNotFoundException("사용자를 찾을수 없습니다.");
        }
//        if (memberVO == null) {
//            return null;
//        }

        return new SpringSecPrincipalDetails(memberVO);
    }
}
