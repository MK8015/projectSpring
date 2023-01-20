package com.project.spring.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.spring.vo.OrderVo;

@Repository
public class OrderDao {
	
	private final String NAME_SPACE="mappers.order.";
	
	@Autowired
	SqlSession sqlSession;
	
	// 방금(최근) 구매한 개인 주문목록만 조회
	public List<OrderVo> recentOrderList(int orderCount, String member_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("orderCount", orderCount);
		map.put("member_id", member_id);
		List<OrderVo>list= sqlSession.selectList(NAME_SPACE + "recentOrderList", map);	
		return list;
	}
	
	// 목록 조회
	public List<OrderVo> orderList() {
	List<OrderVo>list= sqlSession.selectList(NAME_SPACE + "orderList");	
		return list;
	}
	
	public List<OrderVo> myOrder(String member_id) {
		List<OrderVo>list= sqlSession.selectList(NAME_SPACE + "myOrder", member_id);	
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
		int count = sqlSession.delete(NAME_SPACE+"deleteOrder", order_no);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
	public boolean updateOrder(OrderVo orderVo) {
		int count = sqlSession.update(NAME_SPACE+"updateOrder", orderVo);
		if(count>0) {
			return true;
		}
		return false;
	}

	public List<OrderVo> orderListBymemId(String member_id) {
		List<OrderVo>list= sqlSession.selectList(NAME_SPACE + "orderListBymemId", member_id);
		return list;
	}
	
	public boolean updatePoint(String member_id, int nowHavePoint) {
		Map<Object, Object>map=new HashMap<>();
		map.put("member_id", member_id);
		map.put("nowHavePoint", nowHavePoint);
		int count = sqlSession.update(NAME_SPACE+"updatePoint",map);
		if(count>0) {
			return true;
		}
		return false;
	}
	
	public int nowPoint(String member_id) {
		int now_point=sqlSession.selectOne(NAME_SPACE+"nowPoint", member_id);
		return now_point;
	}
	
	public boolean checkBuyer(String member_id, String product_id) {
		Map<Object, Object> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("product_id", product_id);
		int count = sqlSession.selectOne(NAME_SPACE+"checkBuyer", map);
		if(count>0) {
			return true;
		}
		return false;
	}
}
