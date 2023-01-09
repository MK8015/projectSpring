package com.project.spring.admin;


import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.spring.detail.ProductService;
import com.project.spring.login.MemberService;
import com.project.spring.main.MainService;
import com.project.spring.util.ImageUploader;
import com.project.spring.vo.MemberVo;
import com.project.spring.vo.ProductVo;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	

	@Autowired
	MainService mainService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ProductService productService;
	
	
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
		List<MemberVo> list = memberService.getMemberList();
		model.addAttribute("list",list);
		return "admin/member";
	}
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String product(Model model) {
		List<ProductVo> list = productService.getList();
		model.addAttribute("list",list);
		return "admin/product";
	}
	
	@RequestMapping(value = "/productDetail", method = RequestMethod.POST, produces = "application/text;charset=utf-8")
	@ResponseBody
	public String productDetail(String product_id) {
		ProductVo productVo=productService.detail(product_id);
		JSONObject jsonObject = new JSONObject(productVo);
		return jsonObject.toString();
	}
	
	@RequestMapping(value = "/productInsert", method = RequestMethod.POST)
	public String productInsert(ProductVo productVo, RedirectAttributes rttr,MultipartFile file) {
		String originalFilename = file.getOriginalFilename();
		try {
			String product_image = ImageUploader.uploadFile("//192.168.0.233/userpics/", originalFilename, file.getBytes());
			productVo.setProduct_image(product_image);
			boolean result = productService.insert(productVo);
			rttr.addFlashAttribute("result",result);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/product";
	}
	
	@RequestMapping(value = "/productDelete", method = RequestMethod.GET)
	public String productDelete(String product_id, RedirectAttributes rttr) {
		System.out.println(product_id);
		boolean result = productService.delete(product_id);
		rttr.addFlashAttribute("result",result);
		return "redirect:/admin/product";
	}
	
	
	@RequestMapping(value = "/productUpdate", method = RequestMethod.POST)
	public String productUpdate(ProductVo productVo, RedirectAttributes rttr,MultipartFile file) {
		String originalFilename = file.getOriginalFilename();
		try {
			String product_image = ImageUploader.uploadFile("//192.168.0.233/userpics/", originalFilename, file.getBytes());
			productVo.setProduct_image(product_image);
			boolean result = productService.update(productVo);
			rttr.addFlashAttribute("result",result);
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return "redirect:/admin/product";
	}
	
	
	
}
