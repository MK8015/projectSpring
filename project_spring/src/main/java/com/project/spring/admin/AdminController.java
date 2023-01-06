package com.project.spring.admin;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.spring.main.MainService;
import com.project.spring.vo.ProductVo;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	

	@Autowired
	MainService mainService;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Model model) {
		return "admin/index";
	}
	
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String order(Model model) {
		return "admin/order";
	}
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String member(Model model) {
		return "admin/member";
	}
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String product(Model model) {
		return "admin/product";
	}
}
