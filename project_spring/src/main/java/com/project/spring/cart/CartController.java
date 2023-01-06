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
	
	// 장바구니에 상품 등록
	@RequestMapping(value = "/insertProduct", method = RequestMethod.POST)
	@ResponseBody
	public String insertCart(Model model, String product_id, HttpSession session) {
		System.out.println("insertProductContoller 실행됨");
		String member_id = (String)session.getAttribute("loginMember");
		if (member_id == null || member_id.equals("")) {
			return "notLogin";
		}
		System.out.println("member_id: " + member_id);
		boolean result = cartService.insertProductInCart(product_id, member_id);	// 상품정보 t_cart에 넣기
		return String.valueOf(result);
	}
	
	// 상품아이디로 상품정보 가져오기
	@RequestMapping(value = "/detailProductInfo", method = RequestMethod.GET)
	public ProductVo detailProductInfo(String product_id) {
		ProductVo productVo = productService.detail(product_id);
		return productVo;
	}
}
