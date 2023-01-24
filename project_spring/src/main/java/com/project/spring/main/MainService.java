package com.project.spring.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.spring.vo.ProductVo;

@Service
public class MainService {
	
	@Autowired
	MainDao mainDao;
	
	public List<ProductVo> getList() {
		return mainDao.getList();
	}
	
	public List<ProductVo> getListlike(String member_id) {
		return mainDao.getListlike(member_id);
	}
	
	
}
