package com.project.spring.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.spring.vo.ProductVo;

@Service
public class MainService {
	
	@Autowired
	MainDao mainDao;
	
	// 메인에서 리스트 보기
	public List<ProductVo> getList() {
		return mainDao.getList();
	}
	
	
}
