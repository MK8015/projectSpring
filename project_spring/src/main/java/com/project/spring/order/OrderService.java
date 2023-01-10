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
	
		return orderDao.orderList();
	}
	
	public OrderVo detailOrder(String order_no) {
		return orderDao.detailOrder(order_no);
	}
	
	public boolean insertOrder(OrderVo orderVo) {
		return orderDao.insertOrder(orderVo);
	}
	public boolean deleteOrder(String order_no) {
		return orderDao.deleteOrder(order_no);
	}
	public boolean updateOrder(OrderVo orderVo) {
		return orderDao.updateOrder(orderVo);
	}
	
//	public List<String> getProductInfo(){
//		return ProductInfo; 
//	}
}
