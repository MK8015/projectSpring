package com.project.spring.like;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.spring.vo.LikeVo;


@Service
public class LikeService {
	
	@Autowired
	LikeDao likeDao;

	
	public boolean insertLike(String product_id, String member_id) {
		return likeDao.insertLike(product_id, member_id);
	}
	
	
	/*
	public boolean sendLike(LikeVo likeVo) {
		boolean result = likeDao.sendLike(likeVo);
		return result;
	}
	*/
	
	
}
