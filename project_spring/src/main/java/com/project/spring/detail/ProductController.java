package com.project.spring.detail;

import java.io.FileInputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.spring.vo.ProductVo;
import com.project.spring.vo.ReviewVo;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	@Autowired
	ProductService productService;
	@Autowired
	ReviewService reviewService;
	

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String indexList() {
		return "product/list";
	}
	
	
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(String product_id,HttpServletRequest request,PagingDto pagingDto) {
		ProductVo productVo = productService.detail(product_id);
		int reviewCount = reviewService.getCount(product_id);
		if(reviewCount>0) {
			double ratingAvg = reviewService.ratingAvg(product_id);			
			List<ReviewVo> reviewList = reviewService.getList(product_id,pagingDto);
			request.setAttribute("reviewList", reviewList);
			request.setAttribute("ratingAvg", ratingAvg);
		}
		pagingDto.setPagingInfo(pagingDto.getPage(), pagingDto.getPerPage(), reviewCount);
		System.out.println(pagingDto);
		request.setAttribute("pagingDto", pagingDto);
		request.setAttribute("productVo", productVo);
		request.setAttribute("reviewCount", reviewCount);
		return "product/detail";
	}
	
	@RequestMapping(value = "/getImage", method = RequestMethod.GET)
	@ResponseBody
	public byte[] getImage(String imageName) {
		if (imageName != null && !imageName.equals("")) {
			FileInputStream fis = null;
			try {
				String filePath = "C:/userpics/"+imageName; 
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
	
	
	
}
