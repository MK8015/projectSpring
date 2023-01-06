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
	
	// ��� ��ȸ
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, PagingDto pagingDto, String category) {
		System.out.println(category);
		
		List<ProductVo> list = null;
		pagingDto.setPagingInfo(pagingDto.getPage()
				, pagingDto.getPerPage()
				, listService.getCount(category, pagingDto));
		// ī�װ��� ���°�� : ��ü��ȸ (getProductList)
		if (category == null || category.equals("")) { 
			list = listService.getProductList(pagingDto);
		} 
		// ī�װ��� �ִ°�� : �� ī�װ���,�˻��� �����ȸ (getListByCategory)
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
