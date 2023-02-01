package com.project.spring.main;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.spring.like.LikeService;
import com.project.spring.vo.MemberVo;
import com.project.spring.vo.ProductVo;


@Controller
@RequestMapping("/main/*")
public class MainController {
	
	@Value("${kakao.apikey}")
	private String KAKAOAPIKEY;
	
	@Value("${naver.apikey}")
	private String NAVERAPIKEY;
	
	@Autowired
	MainService mainService;
	@Autowired
	LikeService likeService;

	// 메인 리스트
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String indexRun(Model model,HttpSession session) {
		
		MemberVo memberVo=(MemberVo)session.getAttribute("loginMemberVo");
		if(memberVo != null) {
			String member_id= memberVo.getMember_id();
			List<ProductVo>listlike = mainService.getListlike(member_id);			
			model.addAttribute("list", listlike);
		}else {
			List<ProductVo> list = mainService.getList();			
			model.addAttribute("list", list);
		}
		
		return "index/main";
	}
	
	// 이벤트 띄우기
	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public String runEvent(Model model) {
		return "index/event";
	}
	
	// about 창 띄우기
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String runAbout(Model model) {
		model.addAttribute("KAKAOAPIKEY",KAKAOAPIKEY);
		return "index/about";
	}
}
