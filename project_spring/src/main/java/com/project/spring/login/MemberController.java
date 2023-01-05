package com.project.spring.login;

import java.io.FileInputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.spring.vo.MemberVo;
import com.project.spring.vo.ProductVo;
import com.project.spring.vo.ReviewVo;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	
	
	
	//로그인 화면 띄우기
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm() {
		
		return "member/login";
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void loginRun(String member_id, String password) {
		MemberVo memberVo=memberService.loginRun(member_id, password);
		
		if(memberVo ==null) {
			System.out.println("로그인 성공");
		}
		
	}
	
	//회원가입 화면 띄우기
	@RequestMapping(value = "/registerForm", method = RequestMethod.GET)
	public String showRegister() {
		
		return "member/register";
	}
	
	//등록 실행
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerRun(MemberVo memberVo, MultipartFile file, RedirectAttributes rttr) {
		System.out.println("controller memberVo:"+memberVo);
		boolean result=memberService.registerRun(memberVo);
		System.out.println("result:"+result);
		String page="";
		if(result) {
			rttr.addFlashAttribute("login_result","true");
			page="redirect:/member/login";

		}else {
			rttr.addFlashAttribute("login_result","false");
			
			page="redirect:/member/registerForm";

		}
		
			return page;
	}
	
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	@ResponseBody
	public boolean idCheck(String member_id) {
		boolean result= memberService.idCheck(member_id);
		
		System.out.println("controller result"+result);
		return result;
	}

	
}
