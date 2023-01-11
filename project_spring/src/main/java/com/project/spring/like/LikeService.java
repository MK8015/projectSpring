package com.project.spring.like;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.spring.vo.CartVo;
import com.project.spring.vo.LikeVo;


@Service
public class LikeService {
	
	@Autowired
	LikeDao likeDao;


	public List<LikeVo> getLikeList(String member_id) {
		return likeDao.getLikeList(member_id);
	}
	
	
	public boolean insertLike(String product_id, String member_id) {
		return likeDao.insertLike(product_id, member_id);
	}
	

	public boolean cancelLike(String product_id, String member_id) {
		return likeDao.cancelLike(product_id, member_id);
	}
	

	public int getLikeCount(String product_id) {
		return likeDao.getLikeCount(product_id);
	}
	
	public boolean checkLike(LikeVo likeVo) {
		int count = likeDao.checkLike(likeVo);
		if (count > 0) {
			return true;
		}
		return false;
	}
	

	public int memberLikeCount(String member_id) {
		return likeDao.memberLikeCount(member_id);
	}
	
	
}
