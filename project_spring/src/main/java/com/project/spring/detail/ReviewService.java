package com.project.spring.detail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.spring.vo.ReviewVo;
@Service
public class ReviewService {
	
	@Autowired
	ReviewDao reviewDao;
	
	public List<ReviewVo> getList(String product_id,ReviewPagingDto pagingDto) {
		return reviewDao.getList(product_id,pagingDto);
	}
	
	public int getCount(String product_id) {
		return reviewDao.getCount(product_id);
	}
	public double ratingAvg(String product_id) {
		return Double.parseDouble(String.format("%.1f",reviewDao.ratingAvg(product_id)));
	}
	
	public boolean insertReview(ReviewVo reviewVo) {
		
		int count = reviewDao.insertReview(reviewVo);
		if(count>0) {
			return true;
		}
		return false;
	}
	public boolean updateReview(ReviewVo reviewVo) {
		int count =  reviewDao.updateReview(reviewVo);
		if(count>0) {
			return true;
		}
		return false;
	}
	public boolean deleteReview(String review_no) {
		int count =  reviewDao.deleteReview(review_no);
		if(count>0) {
			return true;
		}
		return false;
	}
}
