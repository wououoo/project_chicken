package com.project.kammi.config.oauth.provider;

import java.util.Map;

public class KakaoUserInfo implements OAuth2Userlnfo {
    private Map<String, Object> attrs;

    public KakaoUserInfo(Map<String, Object> attrs) {
        this.attrs = attrs;
    }
    @Override
    public String getProviderId() {
        return attrs.get("id").toString();
    }
    @Override
    public String getProvider() {
        return "kakao";
    }

    @Override
    public String getEmail() {
        return "email";
    }

    @Override
    public String getName() {
        return (String)((Map)((Map)attrs.get("kakao_account")).get("profile")).get("nickname");
    }
}