package com.project.spring.admin;


import java.util.List;

import org.json.JSONArray;
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
import com.project.spring.order.OrderService;
import com.project.spring.util.ImageUploader;
import com.project.spring.vo.AdminVo;
import com.project.spring.vo.MemberVo;
import com.project.spring.vo.OrderVo;
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
	
	@Autowired
	OrderService orderService;
	
	//관리자 인덱스
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Model model) {
		List<OrderVo> orderList = orderService.getOrderList();
		List<AdminVo> bsList = orderService.getBestSeller();		
		List<AdminVo> chartList = orderService.getChart();
		JSONArray chartArray = new JSONArray(chartList);
		model.addAttribute("orderList",orderList);
		model.addAttribute("bsList",bsList);
		model.addAttribute("chartArray",chartArray);
		
		return "admin/index";
	}
	
	//관리자 주문관리
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String order(Model model) {
		List<OrderVo> list = orderService.orderList();
		model.addAttribute("list",list);
		return "admin/order";
	}
	
	@RequestMapping(value = "/detailOrder", method = RequestMethod.POST, produces = "application/text;charset=utf-8")
	@ResponseBody
	public String detailOrder(String order_no) {
		OrderVo orderVo=orderService.detailOrder(order_no);
		JSONObject jsonObject = new JSONObject(orderVo);
		return jsonObject.toString();
	}
	
	@RequestMapping(value = "/insertOrder", method = RequestMethod.POST)
	public String insertOrder(OrderVo orderVo, RedirectAttributes rttr) {
		boolean result = orderService.insertOrder(orderVo);
		rttr.addFlashAttribute("result",result);
		return "redirect:/admin/order";
	}
	
	@RequestMapping(value = "/deleteOrder", method = RequestMethod.GET)
	public String deleteOrder(String order_no, RedirectAttributes rttr) {
		boolean result = orderService.deleteOrder(order_no);
		rttr.addFlashAttribute("result",result);
		return "redirect:/admin/order";
	}
	
	
	@RequestMapping(value = "/updateOrder", method = RequestMethod.POST)
	public String updateOrder(OrderVo orderVo, RedirectAttributes rttr) {
		boolean result = orderService.updateOrder(orderVo);
		rttr.addFlashAttribute("result",result);
		return "redirect:/admin/order";
	}
	// End: 주문관리
	
	//관리자 회원관리
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String member(Model model) {
		List<MemberVo> list = memberService.getMemberList();
		model.addAttribute("list",list);
		return "admin/member";
	}
	
	@RequestMapping(value = "/memberDetail", method = RequestMethod.POST, produces = "application/text;charset=utf-8")
	@ResponseBody
	public String memberDetail(String member_id) {
		MemberVo memberVo=memberService.memberDetail(member_id);
		JSONObject jsonObject = new JSONObject(memberVo);
		return jsonObject.toString();
	}
	
	@RequestMapping(value = "/deleteMember", method = RequestMethod.GET)
	public String deleteMember(String member_id, RedirectAttributes rttr) {
		boolean result = memberService.deleteMember(member_id);
		rttr.addFlashAttribute("result",result);
		return "redirect:/admin/member";
	}
	
	
	@RequestMapping(value = "/updateMember", method = RequestMethod.POST)
	public String updateMember(MemberVo memberVo, RedirectAttributes rttr,MultipartFile file) {
		String originalFilename = file.getOriginalFilename();
		try {
			String member_pic = ImageUploader.uploadFile("//192.168.0.233/userpics/", originalFilename, file.getBytes());
			memberVo.setMember_pic(member_pic);
			boolean result = memberService.updateMember(memberVo);
			rttr.addFlashAttribute("result",result);
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return "redirect:/admin/member";
	}
	// End: 회원관리
	
	//관리자 상품관리
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
		boolean result = productService.delete(product_id);
		rttr.addFlashAttribute("result",result);
		return "redirect:/admin/product";
	}
	
	@RequestMapping(value = "/productUpdate", method = RequestMethod.POST)
	public String productUpdate(ProductVo productVo, RedirectAttributes rttr,MultipartFile file) {
		String originalFilename = file.getOriginalFilename();
		try {
			String product_image = ImageUploader.uploadFile("//192.168.0.233/userpics/", originalFilename, file.getBytes());
			if(product_image != null) {
				productVo.setProduct_image(product_image);				
			}
			boolean result = productService.update(productVo);
			rttr.addFlashAttribute("result",result);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/product";
	}
	// End: 상품관리
	
}
