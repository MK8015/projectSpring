package com.project.spring.order;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.spring.vo.MemberVo;
import com.project.spring.vo.OrderVo;

@Controller
@RequestMapping("/order/*")
public class OrderController { 
	
	@Autowired
	OrderService orderService;

	//개인 주문리스트
	@RequestMapping(value = "/myOrder",method = RequestMethod.GET)
	public String myOrder(Model model, String arr_cart_no,HttpSession session) { 
		
		MemberVo memberVo = (MemberVo)session.getAttribute("loginMemberVo");
		List<OrderVo>list=orderService.myOrder(memberVo.getMember_id());
		model.addAttribute("list", list);
		return "order/orderList";
	}
	

	@RequestMapping(value = "/insertOrder", method = RequestMethod.POST)
	public String order(String list, Model model, HttpSession session, OrderVo vo) {
		JSONArray array = new JSONArray(list);
		MemberVo memberVo = (MemberVo)session.getAttribute("loginMemberVo");
		List<OrderVo> orderList = new ArrayList<>(); 
		for(Object obj: array) {
			JSONObject jsonObject = (JSONObject)obj;
//			System.out.println(jsonObject.get("product_id"));
//			System.out.println(jsonObject.get("cart_amount"));
			OrderVo orderVo = new OrderVo();
			orderVo.setMember_id(memberVo.getMember_id());
			orderVo.setProduct_id(String.valueOf(jsonObject.get("product_id")));
			orderVo.setOrder_amount((int)(jsonObject.get("cart_amount")));
			orderVo.setOrder_address(vo.getOrder_address());
			orderVo.setOrder_address_detail(vo.getOrder_address_detail());
			orderVo.setOrder_phonenum(vo.getOrder_phonenum());
			orderList.add(orderVo);	
			orderService.insertOrder(orderVo);
	}
	model.addAttribute("orderList",orderList);
	
	return "redirect:/order/myOrder";
	}
  
}
