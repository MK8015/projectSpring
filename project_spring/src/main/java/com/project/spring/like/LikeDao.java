package com.project.spring.like;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.spring.vo.LikeVo;


@Repository
public class LikeDao {
	
	private final String NAME_SPACE = "mappers.like.";
	
	@Autowired
	SqlSession sqlSession;

	// 좋아요 리스트 불러오기
	public List<LikeVo> getLikeList(String member_id) {
		return sqlSession.selectList(NAME_SPACE + "getLikeList", member_id);
	}

	// 좋아요 삭제(여러 개)
	public boolean deleteLike(String[] arr_product_id, String member_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("arr_product_id", arr_product_id);
		map.put("member_id", member_id);
		int count = sqlSession.delete(NAME_SPACE + "deleteLike", map);
		if (count > 0) {
			return true;
		}
		return false;
	}
	
	// 좋아요 삭제(하나)
	public boolean deleteLike(String product_id, String member_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product_id", product_id);
		map.put("member_id", member_id);
		int count = sqlSession.delete(NAME_SPACE + "deleteLike", map);
		if (count > 0) {
			return true;
		}
		return false;
	}

	// 좋아요 등록
	public boolean insertLike(String product_id, String member_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("product_id", product_id);
		map.put("member_id", member_id);
		int count = sqlSession.insert(NAME_SPACE + "insertLike", map);
		if (count > 0) {
			return true;
		}
		return false;
	}

	// 좋아요 개수 세기
	public int getLikeCount(String product_id) {
		return sqlSession.selectOne(NAME_SPACE + "getLikeCount", product_id);
	}
	
	// 좋아요 되어 있나 안 되어 있나 확인
	public boolean checkLike(LikeVo likeVo) {
		int count = sqlSession.selectOne(NAME_SPACE + "checkLike", likeVo);
		if (count > 0) {
			return true;
		}
		return false;
	}
	

	public int memberLikeCount(String member_id) {
		return sqlSession.selectOne(NAME_SPACE + "memberLikeCount", member_id);
	}
	
	
	
	
	
	
	
	
	
}
