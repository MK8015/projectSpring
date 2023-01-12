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
	
	@RequestMapping(value = "/orderList",method = RequestMethod.GET)
	public String orderList(Model model, String arr_cart_no) { 

		List<OrderVo>list=orderService.orderList();
		model.addAttribute("list", list);
		
		return "order/orderList";
		
		
	}
}
