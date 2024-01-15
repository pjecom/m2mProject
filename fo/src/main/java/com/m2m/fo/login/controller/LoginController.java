package com.m2m.fo.login.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

fhrmimport javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.m2m.fo.login.model.LoginVO;
import com.m2m.fo.login.service.LoginService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {
    @Autowired
    private LoginService loginService;
    
    @PostMapping("/login")
    public ResponseEntity<?> loginV3(@Valid @ModelAttribute LoginVO loginVO, BindingResult bindingResult, RedirectAttributes rttr, HttpServletRequest request) {
        if (bindingResult.hasErrors()) {

        }
        LoginVO lvo = loginService.memberLogin(loginVO);

        if (lvo == null) {
            System.out.println("실패!!!!!");
        	
        }
        System.out.println("성공!!!!!");
        HttpSession session = request.getSession();
        session.setAttribute("member", lvo);
        session.setMaxInactiveInterval(1200);
        
     	// 로그인 여부를 Model에 추가
        
        Map<String,Object> map = new HashMap<String, Object>();
		map.put("result", "inActive");
		map.put("member", lvo);
        return new ResponseEntity<>(map, HttpStatus.OK);
    }
    
    /* 로그아웃 */
    @RequestMapping(value="/logout", method=RequestMethod.POST)
    public String loginPOST(HttpServletRequest request) {
    	HttpSession session = request.getSession(false);
    	if(session != null) {
    		session.invalidate();
    	}
    	return "redirect:/";
    }
    
}





