package com.project.spring.cart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.spring.detail.ProductService;
import com.project.spring.vo.CartVo;
import com.project.spring.vo.ProductVo;


@Controller
@RequestMapping("/cart/*")
public class CartController {
	@Autowired
	CartService cartService;
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {
		List<CartVo> cartList = cartService.getCartList();
		model.addAttribute("cartList", cartList);
		return "shopping/cart";
	}
	
	// ��ٱ��Ͽ� ��ǰ ���
	@RequestMapping(value = "/insertProduct", method = RequestMethod.POST)
	@ResponseBody
	public String insertCart(Model model, String product_id, HttpSession session) {
		System.out.println("insertProductContoller �����");
		String member_id = (String)session.getAttribute("loginMember");
		if (member_id == null || member_id.equals("")) {
			return "notLogin";
		}
		System.out.println("member_id: " + member_id);
		boolean result = cartService.insertProductInCart(product_id, member_id);	// ��ǰ���� t_cart�� �ֱ�
		return String.valueOf(result);
	}
	
	// ��ǰ���̵�� ��ǰ���� ��������
	@RequestMapping(value = "/detailProductInfo", method = RequestMethod.GET)
	public ProductVo detailProductInfo(String product_id) {
		ProductVo productVo = productService.detail(product_id);
		return productVo;
	}
}
