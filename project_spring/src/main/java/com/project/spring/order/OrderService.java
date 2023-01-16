package com.project.spring.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	public List<OrderVo> orderListBymemId(String member_id){
		return orderDao.orderListBymemId(member_id);
	}
	@Transactional
	public Boolean updatePoint(String member_id,int usePoint) {
		int now_point=orderDao.nowPoint(member_id);
		int nowHavePoint=now_point-usePoint;
		
		return orderDao.updatePoint(member_id,nowHavePoint);
	}
}
