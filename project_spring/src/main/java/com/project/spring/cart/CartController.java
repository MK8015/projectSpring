package com.project.spring.cart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.spring.detail.ProductService;
import com.project.spring.order.OrderService;
import com.project.spring.vo.CartVo;
import com.project.spring.vo.OrderVo;
import com.project.spring.vo.MemberVo;
import com.project.spring.vo.OrderVo;



@Controller
@RequestMapping("/cart/*")
public class CartController {
	@Autowired
	CartService cartService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	OrderService orderService;
	
	// 카드 목록 조회
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
	
	// 카트 등록
	@RequestMapping(value = "/insertProduct", method = RequestMethod.POST)
	@ResponseBody

	public String insertCart(Model model, String product_id, HttpSession session) {
		String member_id = (String)session.getAttribute("loginMember");
		if (member_id == null || member_id.equals("")) {
			return "notLogin";
		}
		boolean result = cartService.insertProductInCart(product_id, member_id);	// 占쏙옙품占쏙옙占쏙옙 t_cart占쏙옙 占쌍깍옙
		// 세션 다시 넣기
		if (result == true) {
			MemberVo loginMemberVo = (MemberVo)session.getAttribute("loginMemberVo");
			int count = loginMemberVo.getMemberCartCount();
			loginMemberVo.setMemberCartCount(count+1);
			session.setAttribute("loginMemberVo", loginMemberVo);
		}
		return String.valueOf(result);
	}
	
	// 카트 삭제
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
		// 세션 다시 넣기
		if (result == true) {
			MemberVo loginMemberVo = (MemberVo)session.getAttribute("loginMemberVo");
			int count = loginMemberVo.getMemberCartCount();
			loginMemberVo.setMemberCartCount(count-1);
			session.setAttribute("loginMemberVo", loginMemberVo);
		}
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
	

	// 카트에서 결재로 결재품목만 list 넘기기 (cart_no) & 아이디별 주문 목록
	@RequestMapping(value = "/paymentList",method = RequestMethod.POST)
	public String paymentList(Model model, String arr_cart_no) { // cart_no 배열로 받아서 list로 변환
		JSONArray jsonArray = new JSONArray(arr_cart_no);
		List<Object> cartnoListjson = jsonArray.toList();
		List<CartVo> cartnoList = new ArrayList<CartVo>();
		for (Object cartno : cartnoListjson) {
			int cart_no = Integer.parseInt((String.valueOf(cartno))); // cartno list에서 int로 각각 데이터 꺼내기
			CartVo cartVo = cartService.getCartListByNo(cart_no);
			cartnoList.add(cartVo);
		}

		model.addAttribute("cartnoList",cartnoList);
		
		JSONArray array = new JSONArray(cartnoList);
		model.addAttribute("list",array);
		
		return "shopping/payment";
	}
	
	

  // detail 에서 카트 추가
	@RequestMapping(value = "/insertCart", method = RequestMethod.POST)
	public String insertCart(Model model, String product_id, String cart_amount, HttpSession session) {
		String member_id = (String)session.getAttribute("loginMember");
		if (member_id == null || member_id.equals("")) {
			return "member/login";
		}
		boolean result = cartService.insertCart(product_id, member_id, cart_amount);
		model.addAttribute("result", result);
		List<CartVo> cartProductList = cartService.getCartList(member_id);
		model.addAttribute("cartProductList", cartProductList);
		return "shopping/cart";
	}
	
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public String order(String list, Model model, HttpSession session) {
		JSONArray array = new JSONArray(list);
		MemberVo memberVo = (MemberVo)session.getAttribute("loginMemberVo");
		List<OrderVo> orderList = new ArrayList<>(); 
		for(Object obj: array) {
			JSONObject jsonObject = (JSONObject)obj;
			System.out.println(jsonObject.get("product_id"));
			System.out.println(jsonObject.get("cart_amount"));
			OrderVo orderVo = new OrderVo();
			orderVo.setMember_id(memberVo.getMember_id());
			orderVo.setProduct_id(String.valueOf(jsonObject.get("product_id")));
			orderVo.setOrder_amount((int)(jsonObject.get("cart_amount")));
			orderVo.setOrder_address(memberVo.getAddress());
			orderVo.setOrder_address_detail(memberVo.getAddress_detail());
			orderVo.setOrder_phonenum(memberVo.getPhonenum());
			orderList.add(orderVo);	
			orderService.insertOrder(orderVo);
			
		}
		model.addAttribute("orderList",orderList);
		
		return "order/orderList";
	}
	
	

	
}
