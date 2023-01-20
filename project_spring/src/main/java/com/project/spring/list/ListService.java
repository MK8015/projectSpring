package com.project.spring.list;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.spring.vo.PagingDto;
import com.project.spring.vo.ProductVo;
@Service
public class ListService {
	
	@Autowired
	ListDao listDao;
	
	// 목록조회
	public List<ProductVo> getProductList(PagingDto pagingDto, String member_id) {
		return listDao.getProductList(pagingDto, member_id);
	}
	
	// 카운트 조회
	public int getCount(String category, PagingDto pagingDto) {
		return listDao.getCount(category, pagingDto);
	}
	
	// 카테고리별 리스트 조회
	public List<ProductVo> getListByCategory(String category, PagingDto pagingDto, String member_id){
		return listDao.getListByCategory(category, pagingDto, member_id);
	}
}
