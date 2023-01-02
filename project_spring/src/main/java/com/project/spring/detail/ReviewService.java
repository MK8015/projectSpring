package com.project.spring.detail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.spring.vo.ProductVo;
import com.project.spring.vo.ReviewVo;
@Service
public class ReviewService {
	
	@Autowired
	ReviewDao reviewDao;
	
	public List<ReviewVo> getList(String product_id) {
		return reviewDao.getList(product_id);
	}
}
