package com.m2m.fo.signup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.m2m.fo.signup.mapper.SignupMapper;
import com.m2m.fo.signup.model.SignupVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SignupServiceImpl implements SignupService {

    @Autowired
    private SignupMapper signupMapper;

    @Override
    public void insertEntrps(SignupVO signupVO) throws Exception {
        String maxBidEntrpsNo = signupMapper.getMaxBidEntrpsNo();

        int nextSeq = Integer.parseInt(maxBidEntrpsNo.replaceAll("\\D+", "")) + 1;

        String formattedNextSeq = String.format("%04d", nextSeq);
        String generatedBidEntrpsNo = "C" + formattedNextSeq;

        signupVO.setBidEntrpsNo(generatedBidEntrpsNo);

        // 패스워드 암호화
        String rawPassword = signupVO.getBidMberSecretNo();
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String encodedPassword = encoder.encode(rawPassword);

        // 암호화된 패스워드를 VO에 설정
        signupVO.setBidMberSecretNo(encodedPassword);

        signupMapper.insertEntrps(signupVO);
    }
}