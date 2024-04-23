package com.project.kammi.domain.login;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {
    private int mno;
    private String username;
    private String password;
    private String korName;
    private String phone;
    private String email;
    private String role;
    private Timestamp createDate;
    private String provider;    // OAuth 지원 회사
    private String providerId;  // OAuth 지원 회사에서 사용하는 ID

    @Builder
    public MemberVO(String username, String password, String korName, String phone, String email, String role, Timestamp createDate, String provider, String providerId) {
        this.username = username;
        this.password = password;
        this.korName = korName;
        this.phone = phone;
        this.email = email;
        this.role = role;
        this.createDate = createDate;
        this.provider = provider;
        this.providerId = providerId;
    }
}
