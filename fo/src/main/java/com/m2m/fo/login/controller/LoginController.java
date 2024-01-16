package com.m2m.fo.login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
            return ResponseEntity.badRequest().body("Validation error");
        }

        LoginVO lvo = loginService.memberLogin(loginVO);

        if (lvo == null) {
            System.out.println("실패!!!!!");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Login failed");
        }
        // 로그인 성공 또는 실패에 따른 추가 조건
        if ("01".equals(lvo.getBidMberSttusCode()) && "03".equals(lvo.getBidConfmSttusCode())) {
            //System.out.println("로그인 성공!!!!!"); 
            HttpSession session = request.getSession();
            session.setAttribute("member", lvo);
            session.setMaxInactiveInterval(1200);

            // 로그인 여부를 Model에 추가
            Map<String, Object> map = new HashMap<>();
            map.put("result", "success");
            map.put("message", "정상 로그인 성공");
            map.put("member", lvo);
            return new ResponseEntity<>(map, HttpStatus.OK);
        } else if ("02".equals(lvo.getBidMberSttusCode())) { // 차단 상태 bidMberSttusCode = 02
            //System.out.println("차단 상태입니다.");
            Map<String, Object> map = new HashMap<>();
            map.put("result", "blocked");
            map.put("message", "차단 상태입니다.");
            return new ResponseEntity<>(map, HttpStatus.OK);
        } else if ("02".equals(lvo.getBidConfmSttusCode())) { // 거절 상태 bidConfmSttusCode = 02
            //System.out.println("로그인이 거절되었습니다.");
            Map<String, Object> map = new HashMap<>();
            map.put("result", "denied");
            map.put("message", "로그인이 거절되었습니다.");
            return new ResponseEntity<>(map, HttpStatus.OK);
        } else { // 대기 상태
            //System.out.println("대기상태 입니다.");
            Map<String, Object> map = new HashMap<>();
            map.put("result", "pending");
            map.put("message", "대기상태 입니다.");
            return new ResponseEntity<>(map, HttpStatus.OK);
        }
    }
    
    /* 로그아웃 */
    @RequestMapping(value="/logout", method=RequestMethod.POST)
    public ResponseEntity<?> loginPOST(HttpServletRequest request) {
    	HttpSession session = request.getSession(false);
    	if(session != null) {
    		session.invalidate();
    	}
    	Map<String, Object> map = new HashMap<>();
        map.put("result", "success");
        return new ResponseEntity<>(map, HttpStatus.OK);
    }
    
}





