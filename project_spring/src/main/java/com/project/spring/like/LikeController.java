package com.project.spring.like;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.spring.vo.LikeVo;
import com.project.spring.vo.MemberVo;


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
	

	// 좋아요 취소 GET
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

	// 위시 리스트에서 좋아요 삭제
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	@ResponseBody
	public String deleteLike(String product_id, HttpSession session) {
		String member_id = (String)session.getAttribute("loginMember");
		boolean result = likeService.deleteLike(product_id, member_id);
		
		// 세션 다시 넣기
				if (result == true) {
					MemberVo loginMemberVo = (MemberVo)session.getAttribute("loginMemberVo");
					int count = loginMemberVo.getMemberLikeCount();
					loginMemberVo.setMemberLikeCount(count-1);
					session.setAttribute("loginMemberVo", loginMemberVo);
				}
		
		return String.valueOf(result);
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
	public String insertLike(Model model, String product_id,
			HttpSession session,RedirectAttributes rttr) {
		String page="";
		String member_id = (String)session.getAttribute("loginMember");
		if (member_id == null || member_id.equals("")) {
			return "notLogin";
		}
		//좋아요 있는지 체크
		boolean isLike= likeService.isAlreadyLike(product_id,member_id);
		if(isLike) {
			//좋아요가 이미 있다면
			boolean result = likeService.cancelLike(product_id, member_id);
			if(result) {
			MemberVo loginMemberVo = (MemberVo)session.getAttribute("loginMemberVo");
			session.setAttribute("loginMemberVo", loginMemberVo);
			model.addAttribute("isAlreadyLike","true");
			rttr.addFlashAttribute("isLikeDelete", "true");
			}else {
				rttr.addFlashAttribute("isLikeDelete", "true");
				 return "couldntlike-false";
			}
			return "coudntlike-true";
		}else {
			//좋아요가 없다면
			boolean result = likeService.insertLike(product_id, member_id);
			// 세션 다시 넣기
				if (result == true) {
					MemberVo loginMemberVo = (MemberVo)session.getAttribute("loginMemberVo");
					int count = loginMemberVo.getMemberLikeCount();
					loginMemberVo.setMemberLikeCount(count+1);
					session.setAttribute("loginMemberVo", loginMemberVo);
					page=String.valueOf(result);
					model.addAttribute("isAlreadyLike","false");
				}else {
					return "couldlike-flase";
				}
				return "couldlike-true";
		}
		
	}
	
	//라이크 숫자 가져오기
	@RequestMapping(value = "/getLikeCount", method = RequestMethod.POST)
	@ResponseBody
	public int getLikeCount(HttpSession session) {
		MemberVo memberVo=(MemberVo)session.getAttribute("loginMemberVo");
		int likeCount= likeService.memberLikeCount(memberVo.getMember_id());
		return likeCount;
	}
	
}
