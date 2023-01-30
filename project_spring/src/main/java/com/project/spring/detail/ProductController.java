package com.project.spring.detail;

import java.io.FileInputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.spring.like.LikeService;
import com.project.spring.vo.LikeVo;
import com.project.spring.vo.MemberVo;
import com.project.spring.vo.ProductVo;
import com.project.spring.vo.ReviewVo;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	@Autowired
	ProductService productService;
	@Autowired
	ReviewService reviewService;
	@Autowired
	LikeService likeService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String indexList() {
		return "product/list";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(String product_id, HttpServletRequest request,
							ReviewPagingDto pagingDto, HttpSession session, Model model) {
		ProductVo productVo = productService.detail(product_id);
		int reviewCount = reviewService.getCount(product_id);
		if(reviewCount>0) {
			double ratingAvg = reviewService.ratingAvg(product_id);			
			List<ReviewVo> reviewList = reviewService.getList(product_id,pagingDto);
			request.setAttribute("reviewList", reviewList);
			request.setAttribute("ratingAvg", ratingAvg);
		}
		pagingDto.setPagingInfo(pagingDto.getPage(), pagingDto.getPerPage(), reviewCount);
		int likeCount = likeService.getLikeCount(product_id);
		MemberVo memberVo=(MemberVo)session.getAttribute("loginMemberVo");
		
		if (memberVo != null) {
			String member_id =memberVo.getMember_id();
			LikeVo likeVo = new LikeVo();
			likeVo.setProduct_id(product_id);
			likeVo.setMember_id(member_id);
			boolean isLike = likeService.checkLike(likeVo);
			// isLike 안에서
			request.setAttribute("isLike", isLike);	
		}
		request.setAttribute("likeCount", likeCount);
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
