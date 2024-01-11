package com.m2m.fo.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
    
    /* 로그인 */
    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String loginPOST(HttpServletRequest request, LoginVO loginVO,RedirectAttributes rttr) throws Exception{
                
    	HttpSession session = request.getSession();
    	LoginVO lvo = loginService.memberLogin(loginVO);
    	
        if(lvo == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
        	System.out.println("실패!!!!!");
            int result = 0;
            rttr.addFlashAttribute("result", result);
            return "redirect:/login";
        }
        
        session.setAttribute("member", lvo);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
        System.out.println("성공!!!!!");
        return "redirect:/main";
    }
}





