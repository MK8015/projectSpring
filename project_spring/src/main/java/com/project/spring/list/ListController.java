package com.project.spring.list;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.spring.detail.ReviewService;
import com.project.spring.like.LikeService;
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
	
	
	
	// 占쏙옙占 占쏙옙회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, PagingDto pagingDto, String category) {
		System.out.println(category);
		
		List<ProductVo> list = null;
		pagingDto.setPagingInfo(pagingDto.getPage()
								, pagingDto.getPerPage()
								, listService.getCount(category, pagingDto));
		System.out.println("list페이지pagingDto:"+pagingDto);
		// 카테고리가 없는경우 : 전체조회 (getProductList)
		if (category == null || category.equals("")) { 
			list = listService.getProductList(pagingDto);
		} 
		// 카占쌓곤옙占쏙옙 占쌍는곤옙占 : 占쏙옙 카占쌓곤옙占쏙옙,占싯삼옙占쏙옙 占쏙옙占쏙옙占싫 (getListByCategory)
		else {
			list = listService.getListByCategory(category, pagingDto);
			model.addAttribute("category",category);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pagingDto", pagingDto);
		System.out.println(pagingDto);
		return "product/list";
	}
	
}
