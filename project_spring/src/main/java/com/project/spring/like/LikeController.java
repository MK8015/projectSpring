package com.project.spring.like;

import java.io.FileInputStream;
import java.net.http.HttpRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.spring.login.MyFileUploader;
import com.project.spring.vo.BoardVo;
import com.project.spring.vo.CartVo;
import com.project.spring.vo.LikeVo;
import com.project.spring.vo.MemberVo;
import com.project.spring.vo.ProductVo;


@Controller
@RequestMapping("/like/*")
public class LikeController {
	@Autowired
	LikeService likeService;
	
	
	// 좋아요 리스트
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, HttpSession session) {
		String member_id = (String)session.getAttribute("loginMember");
		if (member_id == null || member_id.equals("")) {
			return "member/login";
		}
		System.out.println("member_id: " + member_id);
		List<LikeVo> likeProductList = likeService.getLikeList(member_id);
		model.addAttribute("likeProductList", likeProductList);
		return "shopping/like";
	}
	

	// 좋아요 등록 GET
	@RequestMapping(value = "/insertLike", method = RequestMethod.GET)
	@ResponseBody
	public String insertLike(String product_id, HttpSession session) {
		String member_id = (String)session.getAttribute("loginMember");
		if (member_id == null || member_id.equals("")) {
			return "notLogin";
		}
		boolean result = likeService.insertLike(product_id, member_id);
		return String.valueOf(result);
	}
	
	
	
	// 좋아요 등록 POST
	@RequestMapping(value = "/insertLike", method = RequestMethod.POST)
	@ResponseBody
	public String insertLike(Model model, String product_id, HttpSession session) {
		String member_id = (String)session.getAttribute("loginMember");
		if (member_id == null || member_id.equals("")) {
			return "notLogin";
		}
		boolean result = likeService.insertLike(product_id, member_id);
		return String.valueOf(result);
	}
	
	
	
	// 좋아요 삭제 GET
	@RequestMapping(value = "/cancelLike", method = RequestMethod.GET)
	@ResponseBody
	public String cancelLike(String product_id, HttpSession session) {
		String member_id = (String)session.getAttribute("loginMember");
		if (member_id == null || member_id.equals("")) {
			return "notLogin";
		}
		boolean result = likeService.cancelLike(product_id, member_id);
		return String.valueOf(result);
	}
	
	
	
	
}
