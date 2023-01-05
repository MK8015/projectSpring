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
	
	// ��ü ���� ��ȸ (��������)
	public List<ProductVo> getProductList(PagingDto pagingDto) {
		return sqlSession.selectList(NAME_SPACE + "getProductList", pagingDto);
	}
	
	// ī�װ���, �˻��� ī��Ʈ ������
	public int getCount(String category, PagingDto pagingDto) {
		Map<String, String> map = new HashMap<>();
		map.put("product_category", category);
		map.put("searchType", pagingDto.getSearchType());
		map.put("keyword", pagingDto.getKeyword());
		int count = sqlSession.selectOne(NAME_SPACE + "getCount", map);
		return count;
	}
	
	public List<ProductVo> getListByCategory(String category, PagingDto pagingDto){
		Map<String, Object> map = new HashMap<>();
		map.put("product_category", category);
		map.put("startRow", pagingDto.getStartRow());
		map.put("endRow", pagingDto.getEndRow());
		map.put("searchType", pagingDto.getSearchType());
		map.put("keyword", pagingDto.getKeyword());
		return sqlSession.selectList(NAME_SPACE + "getListByCategory", map);
	}
}
