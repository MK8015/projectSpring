package com.project.spring.cart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.spring.detail.ProductService;
import com.project.spring.vo.CartVo;


@Controller
@RequestMapping("/cart/*")
public class CartController {
	@Autowired
	CartService cartService;
	
	@Autowired
	ProductService productService;
	
	// 占쏙옙袂占쏙옙占 占쏙옙占 占쏙옙회 (占쏙옙占싱듸옙)
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, HttpSession session) {
		String member_id = (String)session.getAttribute("loginMember");
		if (member_id == null || member_id.equals("")) {
			return "member/login";
		}
		System.out.println("member_id: " + member_id);
		List<CartVo> cartProductList = cartService.getCartList(member_id);
		model.addAttribute("cartProductList", cartProductList);
		return "shopping/cart";
	}
	
	// 占쏙옙袂占쏙옙臼占 占쏙옙품 占쏙옙占
	@RequestMapping(value = "/insertProduct", method = RequestMethod.POST)
	@ResponseBody
	public String insertCart(Model model, String product_id, HttpSession session) {
		System.out.println("insertProductContoller 占쏙옙占쏙옙占");
		String member_id = (String)session.getAttribute("loginMember");
		if (member_id == null || member_id.equals("")) {
			return "notLogin";
		}
		System.out.println("member_id: " + member_id);
		boolean result = cartService.insertProductInCart(product_id, member_id);	// 占쏙옙품占쏙옙占쏙옙 t_cart占쏙옙 占쌍깍옙
		return String.valueOf(result);
	}
	
	// 카트 占쏙옙占쏙옙
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	@ResponseBody
	public String deleteCart(
			@RequestParam(value="arr_product_id[]") String[] arr_product_id,
			HttpSession session) {
		for (String product_id : arr_product_id) {
			System.out.println(product_id);
		}
		String member_id = (String)session.getAttribute("loginMember");
		boolean result = cartService.deleteCart(arr_product_id, member_id);
		return String.valueOf(result);
	}
	

	// 카트 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public String updateCart(int cart_amount, String product_id, HttpSession session) {
		String member_id = (String)session.getAttribute("loginMember");
		System.out.println("cartupdate실행" + cart_amount + "변경하고자하는 수량 "
				+ "/ 상품:" + product_id + "/ 아이디: " + member_id);
		boolean result = cartService.updateCart(cart_amount, product_id, member_id);
		return String.valueOf(result);

	}
	
	
}
