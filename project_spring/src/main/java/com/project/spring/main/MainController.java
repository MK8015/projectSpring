package com.project.spring.main;

import java.io.FileInputStream;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.spring.like.LikeService;
import com.project.spring.vo.LikeVo;
import com.project.spring.vo.MemberVo;
import com.project.spring.vo.ProductVo;


@Controller
@RequestMapping("/main/*")
public class MainController {
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
	

//	// ���ο��� ��� ����
//	@RequestMapping(value = "/list", method = RequestMethod.GET)
//	public String getList(Model model,HttpSession session) {
//		
//		
//		List<ProductVo> list = mainService.getList();
////		System.out.println("MainController, list" + list);
//		model.addAttribute("list", list);
//		
//		return "index/main";
//	}
//	

	// 이벤트 띄우기
	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public String runEvent(Model model) {
		return "index/event";
	}
	
	
	// about 창 띄우기
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String runAbout(Model model) {
		return "index/about";
	}
}
