package com.project.spring.detail;

import java.io.FileInputStream;
import java.util.List;


import org.apache.commons.io.IOUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.spring.order.OrderService;
import com.project.spring.vo.ReviewVo;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	@Autowired
	ProductService productService;
	@Autowired
	ReviewService reviewService;
	@Autowired
	OrderService orderService;
	

	
	@RequestMapping(value = "/getImage", method = RequestMethod.GET)
	@ResponseBody
	public byte[] getImage(String imageName) {
		if (imageName != null && !imageName.equals("")) {
			FileInputStream fis = null;
			try {
				String filePath = "//192.168.0.233/userpics/"+imageName; 
				fis = new FileInputStream(filePath);
				byte[] bytes = IOUtils.toByteArray(fis);
				return bytes;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					fis.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	@RequestMapping(value = "/reviewPaging", method = RequestMethod.GET, produces = "application/text;charset=utf-8")
	@ResponseBody
	public String reviewPaging(String product_id,ReviewPagingDto pagingDto,int page) {
		int reviewCount = reviewService.getCount(product_id);
		pagingDto.setPagingInfo(page, pagingDto.getPerPage(), reviewCount);
		List<ReviewVo> reviewList = reviewService.getList(product_id,pagingDto);
		JSONArray jsonArray = new JSONArray();
		for(ReviewVo vo:reviewList) {
			JSONObject jsonObject = new JSONObject(vo);
			boolean result = orderService.checkBuyer(vo.getMember_id(),product_id);
			jsonObject.append("checkBuyer", result);
			jsonArray.put(jsonObject);
		}
		return jsonArray.toString();
	}
	
	@RequestMapping(value = "/insertReview", method = RequestMethod.POST)
	@ResponseBody
	public String insertReview(ReviewVo reviewVo) {
		boolean result = reviewService.insertReview(reviewVo);
		return String.valueOf(result);
	}
	
	@RequestMapping(value = "/updateReview", method = RequestMethod.POST)
	@ResponseBody
	public String updateReview(ReviewVo reviewVo) {
		boolean result = reviewService.updateReview(reviewVo);
		return String.valueOf(result);
	}
	
	@RequestMapping(value = "/deleteReview", method = RequestMethod.POST)
	@ResponseBody
	public String deleteReview(String review_no) {
		boolean result = reviewService.deleteReview(review_no);
		return String.valueOf(result);
	}
	
	@RequestMapping(value = "/setRating", method = RequestMethod.GET)
	@ResponseBody
	public String setRating(String product_id) {
		
		JSONObject jsonObject = new JSONObject();
		int reviewCount = reviewService.getCount(product_id);
		if(reviewCount>0) {
			double ratingAvg = reviewService.ratingAvg(product_id);
			jsonObject.put("ratingAvg", ratingAvg);
		}else {
			jsonObject.put("ratingAvg", 0);
		}
		jsonObject.put("reviewCount", reviewCount);
		return jsonObject.toString();
	}
}
