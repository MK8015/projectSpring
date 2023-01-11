package com.project.spring.like;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.spring.vo.CartVo;
import com.project.spring.vo.LikeVo;


@Repository
public class LikeDao {
	
	private final String NAME_SPACE = "mappers.like.";
	
	@Autowired
	SqlSession sqlSession;


	public List<LikeVo> getLikeList(String member_id) {
		return sqlSession.selectList(NAME_SPACE + "getLikeList", member_id);
	}
	
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
	

	public boolean cancelLike(String product_id, String member_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("product_id", product_id);
		map.put("member_id", member_id);
		int count = sqlSession.delete(NAME_SPACE + "cancelLike", map);
		if (count > 0) {
			return true;
		}
		return false;
	}
	

	
	public int getLikeCount(String product_id) {
		return sqlSession.selectOne(NAME_SPACE + "getLikeCount", product_id);
	}
	
	public int checkLike(LikeVo likeVo) {
		return sqlSession.selectOne(NAME_SPACE + "checkLike", likeVo);
	}
	

	public int memberLikeCount(String member_id) {
		return sqlSession.selectOne(NAME_SPACE + "memberLikeCount", member_id);
	}
	
	
	
	
	
	
	
	
	
}
