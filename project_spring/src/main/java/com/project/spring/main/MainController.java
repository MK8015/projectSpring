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
	

	// 메인으로 이동(사실 필요 X, 우선 그냥 넣어둠)
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String indexRun(Model model) {

		List<ProductVo> list = mainService.getList();
		System.out.println("MainController, list" + list);
		model.addAttribute("list", list);
		
		return "index/main";
	}
	

	// 메인에서 목록 보기
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getList(Model model) {
		
		List<ProductVo> list = mainService.getList();
		System.out.println("MainController, list" + list);
		model.addAttribute("list", list);
		
		return "index/main";
	}
	
}
