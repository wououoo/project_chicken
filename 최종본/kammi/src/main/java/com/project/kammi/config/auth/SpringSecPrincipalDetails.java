package com.project.kammi.config.auth;

import com.project.kammi.domain.login.MemberVO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

public class SpringSecPrincipalDetails implements UserDetails, OAuth2User {

    private MemberVO memberVO;

    private Map<String, Object> attrs;

    public SpringSecPrincipalDetails(MemberVO memberVO) {
        this.memberVO = memberVO;
    }

    public SpringSecPrincipalDetails(MemberVO memberVO, Map<String, Object> attrs) {
        this.memberVO = memberVO;
        this.attrs = attrs;
    }
    public MemberVO getMemberVO() {
        return memberVO;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Collection<GrantedAuthority> collect = new ArrayList<>();
        collect.add(() -> {
            return memberVO.getRole();
        });
        return collect;
    }

    @Override
    public String getPassword() {
        return memberVO.getPassword();
    }

    @Override
    public String getUsername() {
        return memberVO.getUsername();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    @Override
    public Map<String, Object> getAttributes() {
        return attrs;
    }

    @Override
    public String getName() {
        return null;
    }
}
