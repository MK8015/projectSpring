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
		System.out.println("실행됨");
	List<OrderVo>list= sqlSession.selectList(NAME_SPACE + "orderList");	
		System.out.println("dao list:"+list);
		return list;
	}
	
//	public List<String>getProductInfo(){
//		List<ProductVo>list=sqlSession.selectList(NAME_SPACE+"getProductInfo");
//		return list;
//	}

}
