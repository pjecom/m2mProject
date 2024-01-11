package com.m2m.fo.login.service;

import org.springframework.beans.factory.annotation.Autowired;
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
        String memberPw = loginVO.getBidMberSecretNo();

        LoginVO fetchedUser = loginMapper.searchId(memberId);

        if (fetchedUser != null && fetchedUser.getBidMberSecretNo().equals(memberPw)) {
            return fetchedUser; // 로그인 성공
        } else {
            return null; // 로그인 실패
        }
    }

}
