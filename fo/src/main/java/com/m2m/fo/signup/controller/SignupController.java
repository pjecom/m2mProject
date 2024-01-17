package com.m2m.fo.signup.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.http.HttpStatus;
import com.m2m.fo.signup.model.SignupVO;
import com.m2m.fo.signup.service.SignupService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/signup")
public class SignupController {
	@Autowired
	private SignupService signupService;
	
	//약관확인으로 이동
	@RequestMapping(value = "/signup")
    public String signup( ModelMap model) throws Exception {
		//signupVO.getUseStplatAgreAt();
		
        return "signup/signup";
    }
	
	//정보입력으로 이동
	@RequestMapping(value = "/signupDtl")
	public String signupDtl(@RequestBody SignupVO signupVO,ModelMap model) throws Exception {
		//log.info("getUseStplatAgreAt >>> ::: {}",signupVO.getUseStplatAgreAt());
		
		model.addAttribute("signupVO", signupVO);
		return "signup/signupDtl";
	}
	
	//입찰업체회원가입
	@PostMapping("/insertEntrps")
	@ResponseBody
	public ResponseEntity<?> insertEntrps(@RequestBody SignupVO signupVO, BindingResult bindingResult) throws Exception {
				
		Map<String, Object> returnMap = new HashMap<String, Object>();

		signupService.insertEntrps(signupVO);

		return new ResponseEntity<>(returnMap, HttpStatus.OK);
	}
	
	//회원가입 완료 이동
	@RequestMapping(value = "/signupCmp")
	public String signupCmp( ModelMap model) throws Exception {
		
		return "signup/signupCmp";
	}
	
}
