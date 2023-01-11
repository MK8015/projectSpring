package com.project.spring.main;

import java.io.FileInputStream;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.spring.vo.ProductVo;


@Controller
@RequestMapping("/main/*")
public class MainController {
	@Autowired
	MainService mainService;
	

	// ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Ìµï¿½(ï¿½ï¿½ï¿½ ï¿½Ê¿ï¿½ X, ï¿½ì¼± ï¿½×³ï¿½ ï¿½Ö¾ï¿½ï¿½)
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String indexRun(Model model) {

		List<ProductVo> list = mainService.getList();
		System.out.println("MainController, list" + list);
		model.addAttribute("list", list);
		
		return "index/main";
	}
	

	// ï¿½ï¿½ï¿½Î¿ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getList(Model model) {
		
		List<ProductVo> list = mainService.getList();
		System.out.println("MainController, list" + list);
		model.addAttribute("list", list);
		
		return "index/main";
	}
	

	// ¸ÞÀÎ¿¡¼­ ¸ñ·Ï º¸±â
	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public String runEvent(Model model) {
		return "index/event";
	}
	
}
