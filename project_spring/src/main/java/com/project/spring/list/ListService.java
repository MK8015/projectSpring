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
	
	// 전체 도서 조회 (페이지별)
	public List<ProductVo> getProductList(PagingDto pagingDto) {
		return listDao.getProductList(pagingDto);
	}
	
	// 카테고리별, 검색별 카운트 얻어오기
	public int getCount(String category, PagingDto pagingDto) {
		return listDao.getCount(category, pagingDto);
	}
	
	// 카테고리별 도서 조회 (페이지별)
	public List<ProductVo> getListByCategory(String category, PagingDto pagingDto){
		return listDao.getListByCategory(category, pagingDto);
	}
}
