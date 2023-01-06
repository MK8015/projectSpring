package com.project.spring.list;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.spring.vo.PagingDto;
import com.project.spring.vo.ProductVo;

@Controller
@RequestMapping("/list/*")
public class ListController {
	@Autowired
	ListService listService;
	
	// 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, PagingDto pagingDto, String category) {
		pagingDto.setPagingInfo(pagingDto.getPage()
								, pagingDto.getPerPage()
								, listService.getCount(category, pagingDto));
		List<ProductVo> list = listService.getProductList(pagingDto);
		System.out.println("list페이지pagingDto:"+pagingDto);
		// 카테고리가 없는경우 : 전체조회 (getProductList)
		if (category == null || category.equals("")) { 
			list = listService.getProductList(pagingDto);
		} 
		// 카테고리가 있는경우 : 각 카테고리별,검색별 목록조회 (getListByCategory)
		else {
			list = listService.getListByCategory(category, pagingDto);
			model.addAttribute("category",category);
		}
		model.addAttribute("list", list);
		model.addAttribute("pagingDto", pagingDto);
		return "product/list";
	}
	
}
