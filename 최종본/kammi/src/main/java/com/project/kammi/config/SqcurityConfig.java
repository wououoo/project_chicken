package com.project.kammi.config;

import com.project.kammi.config.auth.CustomAuthFailureHandler;
import com.project.kammi.config.oauth.SpringSecOAuth2PrincipalDetailsService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@RequiredArgsConstructor
@Configuration
@EnableWebSecurity
@EnableMethodSecurity(securedEnabled = true)
public class SqcurityConfig {

    private final AuthenticationFailureHandler customFailureHandler;

    @Autowired
    private CustomAuthFailureHandler customAuthFailureHandler;

    @Autowired
    private SpringSecOAuth2PrincipalDetailsService oAuth2PrincipalDetailsService;

    @Autowired
    private UserDetailsService customUserDetailsService;

    @Bean
    BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration
                                                               authenticationConfiguration) throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }

    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf().disable()
                .authorizeRequests((authorizeHttpRequests) ->
                        authorizeHttpRequests
                                .requestMatchers(new AntPathRequestMatcher("/admin/**"))
                                .hasRole("SALES")
                                .anyRequest().permitAll()
                )
                .formLogin(formLogin ->
                        formLogin.loginPage("/member/login")
                                .failureHandler(customAuthFailureHandler)
                                .defaultSuccessUrl("/main")
                                .permitAll()
                )
                .logout()
                .logoutSuccessUrl("/member/login")
                .invalidateHttpSession(true)
                .and()
                .oauth2Login()
                .loginPage("/member/login")
                .userInfoEndpoint()
                .userService(oAuth2PrincipalDetailsService)
        ;
        return http.build();
    }

    /** UsernameNotFoundException이 작동하지 않는 문제 **/
    @Bean
    public DaoAuthenticationProvider daoAuthenticationProvider() {
        DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
        authenticationProvider.setUserDetailsService(customUserDetailsService);
        authenticationProvider.setPasswordEncoder(bCryptPasswordEncoder());
//        authenticationProvider.setPasswordEncoder(Encoder());
        authenticationProvider.setHideUserNotFoundExceptions(false);
        return authenticationProvider;

    }

    @Bean
    public HttpFirewall defaultHttpFirewall() {
        return new DefaultHttpFirewall();
    }
}

