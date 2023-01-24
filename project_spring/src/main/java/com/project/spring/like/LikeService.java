package com.project.spring.like;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.spring.vo.LikeVo;


@Service
public class LikeService {
	
	@Autowired
	LikeDao likeDao;

	// 좋아요 리스트 불러오기
	public List<LikeVo> getLikeList(String member_id) {
		return likeDao.getLikeList(member_id);
	}
	

	// 좋아요 삭제(하나)
	public boolean deleteLike(String product_id, String member_id) {
		return likeDao.deleteLike(product_id, member_id);
	}
	
	// 좋아요 했는지 체크
	public boolean isAlreadyLike(String product_id, String member_id) {
		return likeDao.isAlreadyLike(product_id, member_id);
	}
	
	// 좋아요 등록
	public boolean insertLike(String product_id, String member_id) {
		return likeDao.insertLike(product_id, member_id);
	}
	
	// 좋아요 취소
	public boolean cancelLike(String product_id, String member_id) {
		return likeDao.cancelLike(product_id, member_id);
	}
	
	// 좋아요 개수 세기
	public int getLikeCount(String product_id) {
		return likeDao.getLikeCount(product_id);
	}
	
	// 좋아요 눌렀나 안 눌렀나 체크
	public boolean checkLike(LikeVo likeVo) {
		int count = likeDao.checkLike(likeVo);
		if (count > 0) {
			return true;
		}
		return false;
	}
	
	// 멤버별 좋아요 카운트 수
	public int memberLikeCount(String member_id) {
		return likeDao.memberLikeCount(member_id);
	}
	
	
	
}
