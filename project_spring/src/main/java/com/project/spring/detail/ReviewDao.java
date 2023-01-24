package com.project.spring.detail;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.spring.vo.ReviewVo;

@Repository
public class ReviewDao {
	
	private final String NAME_SPACE = "mappers.review.";
	
	@Autowired
	SqlSession sqlSession;
	
	public List<ReviewVo> getList(String product_id,ReviewPagingDto pagingDto) {
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
	
	public int insertReview(ReviewVo reviewVo) {
		return sqlSession.insert(NAME_SPACE+"insertReview",reviewVo);
	}
	public int updateReview(ReviewVo reviewVo) {
		return sqlSession.update(NAME_SPACE+"updateReview",reviewVo);
	}
	public int deleteReview(String review_no) {
		return sqlSession.delete(NAME_SPACE+"deleteReview",review_no);
	}
}
