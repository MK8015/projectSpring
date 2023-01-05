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
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, PagingDto pagingDto, String category) {
		pagingDto.setPagingInfo(pagingDto.getPage()
								, pagingDto.getPerPage()
								, listService.getCount(pagingDto));
		System.out.println("category:" + category);
		List<ProductVo> list = listService.getProductList(pagingDto);
		if (category == null || category.equals("")) { // 카테고리가 없는경우 : 전체조회
			list = listService.getProductList(pagingDto);
		} else {
			list = listService.getListByCategory(category, pagingDto);
			System.out.println("list:"+ list);
		}
		model.addAttribute("list", list);
		model.addAttribute("pagingDto", pagingDto);
		return "product/list";
	}
	
}
