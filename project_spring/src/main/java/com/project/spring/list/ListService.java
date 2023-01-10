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
	
	// ��ü ���� ��ȸ (��������)
	public List<ProductVo> getProductList(PagingDto pagingDto) {
		return listDao.getProductList(pagingDto);
	}
	
	// ī�װ���, �˻��� ī��Ʈ ������
	public int getCount(String category, PagingDto pagingDto) {
		return listDao.getCount(category, pagingDto);
	}
	
	// ī�װ��� ���� ��ȸ (��������)
	public List<ProductVo> getListByCategory(String category, PagingDto pagingDto){
		return listDao.getListByCategory(category, pagingDto);
	}
}
