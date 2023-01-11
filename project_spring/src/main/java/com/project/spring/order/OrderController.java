package com.project.spring.order;

import java.util.List;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.spring.vo.OrderVo;

@Controller
@RequestMapping("/order/*")
public class OrderController { 
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping(value = "/orderList",method = RequestMethod.POST)
	public String orderList(Model model, String arr_cart_no) { // cart_no 배열로 받아서 list로 변환
		System.out.println("arr_cart_no"+ arr_cart_no);
		List<Object> cartnoList = new JSONArray(arr_cart_no).toList();
		System.out.println("cartnoList"+ cartnoList);
		
		
		
		List<OrderVo>list=orderService.orderList();
//		List<String>orderProductId= list.stream().map(OrderVo::getPRODUCT_ID).collect(Collectors.toList());
		
		
		
		
		model.addAttribute("list", list);
		System.out.println("list:"+list);
//		return "order/orderList";
		return null;
		
	}
	
	
	
	

}
