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
	
	public List<ReviewVo> getList(String product_id,PagingDto pagingDto) {
		return reviewDao.getList(product_id,pagingDto);
	}
	
	public int getCount(String product_id) {
		return reviewDao.getCount(product_id);
	}
	public double ratingAvg(String product_id) {
		return Double.parseDouble(String.format("%.1f",reviewDao.ratingAvg(product_id)));
	}
}
