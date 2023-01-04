package com.project.spring.detail;

import java.io.FileInputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.spring.vo.ProductVo;
import com.project.spring.vo.ReviewVo;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	@Autowired
	ProductService productService;
	@Autowired
	ReviewService reviewService;
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(String product_id,HttpServletRequest request) {
		ProductVo productVo = productService.detail("p_001");
		request.setAttribute("productVo", productVo);
		return "product/detail";
	}
	
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
	public String reviewPaging(String product_id,PagingDto pagingDto,int page) {
		int reviewCount = reviewService.getCount("p_001");
		pagingDto.setPagingInfo(page, pagingDto.getPerPage(), reviewCount);
		List<ReviewVo> reviewList = reviewService.getList("p_001",pagingDto);
		JSONArray jsonArray = new JSONArray();
		for(ReviewVo vo:reviewList) {
			JSONObject jsonObject = new JSONObject(vo);
			System.out.println(jsonObject);
			jsonArray.put(jsonObject);
		}
		return jsonArray.toString();
	}
	
	@RequestMapping(value = "/insertReview", method = RequestMethod.POST)
	@ResponseBody
	public String insertReview(ReviewVo reviewVo) {
		System.out.println(reviewVo);
		boolean result = reviewService.insertReview(reviewVo);
		return String.valueOf(result);
	}
}
