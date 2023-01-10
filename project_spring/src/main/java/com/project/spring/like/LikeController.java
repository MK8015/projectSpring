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
import com.project.spring.vo.LikeVo;
import com.project.spring.vo.MemberVo;
import com.project.spring.vo.ProductVo;


@Controller
@RequestMapping("/like/*")
public class LikeController {
	@Autowired
	LikeService likeService;
	
	
	// 좋아요 등록
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
	
	
	/*
	@RequestMapping(value = "/sendLike", method = RequestMethod.POST)
	@ResponseBody
	public String sendLike(String product_id, HttpSession session) {
		String member_id = (String)session.getAttribute("loginMember");
		LikeVo likeVo = new LikeVo();
		likeVo.setMember_id(member_id);
		likeVo.setProduct_id(product_id);
		boolean result = likeService.sendLike(likeVo);
		return String.valueOf(result);
	}
	*/
	
}
