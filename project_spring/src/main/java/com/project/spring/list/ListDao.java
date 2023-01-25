package com.project.spring.list;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.spring.vo.PagingDto;
import com.project.spring.vo.ProductVo;

@Repository
public class ListDao {
	
	private final String NAME_SPACE = "mappers.list.";
	
	@Autowired
	SqlSession sqlSession;
	
	// 전체 도서 조회 (페이지별)
	public List<ProductVo> getProductList(PagingDto pagingDto, String member_id) {
		Map<String, Object>map=new HashMap<>();
		map.put("startRow", pagingDto.getStartRow());
		map.put("endRow", pagingDto.getEndRow());
		map.put("searchType", pagingDto.getSearchType());
		map.put("keyword", pagingDto.getKeyword());
		map.put("member_id", member_id);
		return sqlSession.selectList(NAME_SPACE + "getProductList", map);
	}
	
	// 카테고리별, 검색별 카운트 얻어오기
	public int getCount(String category, PagingDto pagingDto) {
		Map<String, String> map = new HashMap<>();
		map.put("product_category", category);
		map.put("searchType", pagingDto.getSearchType());
		map.put("keyword", pagingDto.getKeyword());
		int count = sqlSession.selectOne(NAME_SPACE + "getCount", map);
		return count;
	}
	
	public List<ProductVo> getListByCategory(String category, PagingDto pagingDto,String member_id){
		Map<String, Object> map = new HashMap<>();
		map.put("product_category", category);
		map.put("startRow", pagingDto.getStartRow());
		map.put("endRow", pagingDto.getEndRow());
		map.put("searchType", pagingDto.getSearchType());
		map.put("keyword", pagingDto.getKeyword());
		map.put("member_id", member_id);
		return sqlSession.selectList(NAME_SPACE + "getListByCategory", map);
	}
}
