package com.project.spring.list;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.spring.detail.ReviewService;
import com.project.spring.like.LikeService;
import com.project.spring.vo.MemberVo;
import com.project.spring.vo.PagingDto;
import com.project.spring.vo.ProductVo;

@Controller
@RequestMapping("/list/*")
public class ListController {
	@Autowired
	ListService listService;
	@Autowired
	ReviewService reviewService;
	@Autowired
	LikeService likeService;
	
	// 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, PagingDto pagingDto, String category,HttpSession session) {
	MemberVo memberVo = (MemberVo)session.getAttribute("loginMemberVo");
		String member_id= null;
		if(memberVo != null) {
			member_id = memberVo.getMember_id();
		}
		List<ProductVo> list = null;
		pagingDto.setPagingInfo(pagingDto.getPage()
				, pagingDto.getPerPage()
				, listService.getCount(category, pagingDto));
		
		// 카테고리가 없는경우 : 전체조회 (getProductList)
		if (category == null || category.equals("")) { 
			list = listService.getProductList(pagingDto, member_id);
		} 
		// 카테고리가 있는경우 : 카테고리별 조회 (getListByCategory)
		else {
			list = listService.getListByCategory(category, pagingDto,member_id);
			model.addAttribute("category", category);
		}
		model.addAttribute("list", list);
		model.addAttribute("pagingDto", pagingDto);
		
		return "product/list";
	}
	
}
