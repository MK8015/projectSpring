package com.project.spring.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.spring.vo.OrderVo;
import com.project.spring.vo.ProductVo;

@Repository
public class OrderDao {
	
	private final String NAME_SPACE="mappers.order.";
	
	@Autowired
	SqlSession sqlSession;
	
	public List<OrderVo> orderList() {
	List<OrderVo>list= sqlSession.selectList(NAME_SPACE + "orderList");	
		return list;
	}
	
	public List<OrderVo> myOrder(String member_id) {
		List<OrderVo>list= sqlSession.selectList(NAME_SPACE + "myOrder",member_id);	
			return list;
	}

	public OrderVo detailOrder(String order_no) {
		return sqlSession.selectOne(NAME_SPACE+"detailOrder",order_no);
	}
	
	public boolean insertOrder(OrderVo orderVo) {
		int count = sqlSession.insert(NAME_SPACE+"insertOrder",orderVo);
		if(count>0) {
			return true;
		}
		return false;
	}
	public boolean deleteOrder(String order_no) {
		int count = sqlSession.delete(NAME_SPACE+"deleteOrder",order_no);
		if(count>0) {
			return true;
		}
		return false;
	}
	public boolean updateOrder(OrderVo orderVo) {
		int count = sqlSession.update(NAME_SPACE+"updateOrder",orderVo);
		if(count>0) {
			return true;
		}
		return false;
	}

	public List<OrderVo> orderListBymemId(String member_id) {
		return sqlSession.selectList(NAME_SPACE + "orderListBymemId", member_id);
	}

}
