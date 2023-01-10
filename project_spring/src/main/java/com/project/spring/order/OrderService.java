package com.project.spring.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.spring.vo.OrderVo;
import com.project.spring.vo.ProductVo;

@Service
public class OrderService {

	@Autowired
	OrderDao orderDao;
	
	public List<OrderVo> orderList() {
	
		List<OrderVo>list=orderDao.orderList();
		
		return list;
	}
	
//	public List<String> getProductInfo(){
//		return ProductInfo; 
//	}
}
