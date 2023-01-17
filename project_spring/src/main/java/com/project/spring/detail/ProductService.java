package com.project.spring.detail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.spring.vo.OrderVo;
import com.project.spring.vo.ProductVo;
@Service
public class ProductService {
	
	@Autowired
	ProductDao productDao;
	
	public ProductVo detail(String product_id) {
		return productDao.detail(product_id);
	}
	
	public List<ProductVo> getList(){
		return productDao.getList();
	}
	public boolean insert(ProductVo productVo) {
		return productDao.insert(productVo);
	}
	public boolean delete(String product_id) {
		return productDao.delete(product_id);
	}
	public boolean update(ProductVo productVo) {
		return productDao.update(productVo);
	}
	
	// 재고 차감
	public boolean subInventory(OrderVo orderVo) {
		return productDao.subInventory(orderVo);
	}
}
