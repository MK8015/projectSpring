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
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(String product_id,HttpServletRequest request) {
		ProductVo productVo = productService.detail("p_001");
		List<ReviewVo> reviewList = reviewService.getList("p_001");
		System.out.println(reviewList);
		request.setAttribute("productVo", productVo);
		request.setAttribute("reviewList", reviewList);
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
}