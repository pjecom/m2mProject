package com.m2m.fo.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.m2m.fo.login.mapper.LoginMapper;
import com.m2m.fo.login.model.LoginVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LoginServiceImpl implements LoginService {
    
    @Autowired
    private LoginMapper loginMapper;
    
    @Override
    public LoginVO memberLogin(LoginVO loginVO) {
        String memberId = loginVO.getBidMberId();
        String inputPassword = loginVO.getBidMberSecretNo();

        // 사용자 정보 가져오기
        LoginVO fetchedUser = loginMapper.searchId(memberId);

        if (fetchedUser != null) {
            // DB에 저장된 암호화된 비밀번호
            String hashedPassword = fetchedUser.getBidMberSecretNo();

            // 입력된 비밀번호와 DB의 암호화된 비밀번호 비교
            BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            if (passwordEncoder.matches(inputPassword, hashedPassword)) {
                return fetchedUser; // 로그인 성공
            }
        }
        
        return null; // 로그인 실패
    }
}
