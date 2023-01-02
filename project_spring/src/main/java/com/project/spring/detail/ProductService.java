package com.project.spring.detail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.spring.vo.ProductVo;
@Service
public class ProductService {
	
	@Autowired
	ProductDao productDao;
	
	public ProductVo detail(String product_id) {
		return productDao.detail(product_id);
	}
	
}
