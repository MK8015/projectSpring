package com.project.spring;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.spring.main.MainService;
import com.project.spring.vo.ProductVo;

@Controller
public class HomeController {
	

	@Autowired
	MainService mainService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {

		List<ProductVo> list = mainService.getList();
		System.out.println("MainController, list" + list);
		model.addAttribute("list", list);
		
		
		return "index/main";
	}
	
}
