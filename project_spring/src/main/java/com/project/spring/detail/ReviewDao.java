package com.project.spring.detail;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.spring.vo.ProductVo;
import com.project.spring.vo.ReviewVo;

@Repository
public class ReviewDao {
	
	private final String NAME_SPACE = "mappers.review.";
	
	@Autowired
	SqlSession sqlSession;
	
	public List<ReviewVo> getList(String product_id,PagingDto pagingDto) {
		Map<String, Object> map = new HashMap<>();
		map.put("product_id", product_id);
		map.put("startRow", pagingDto.getStartRow());
		map.put("endRow", pagingDto.getEndRow());
		return sqlSession.selectList(NAME_SPACE+"getList",map);
	}
	
	public int getCount(String product_id) {
		return sqlSession.selectOne(NAME_SPACE+"getCount",product_id);
	}
	
	public double ratingAvg(String product_id) {
		return sqlSession.selectOne(NAME_SPACE+"ratingAvg",product_id);
	}
}
