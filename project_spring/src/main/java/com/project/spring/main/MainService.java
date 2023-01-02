package com.project.spring.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.spring.vo.ProductVo;
@Service
public class MainService {
	
	@Autowired
	MainDao mainDao;
	
	
}
