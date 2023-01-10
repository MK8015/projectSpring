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
	
	
	/*
	public boolean sendLike(LikeVo likeVo) {
		int count = sqlSession.insert(NAME_SPACE + "sendLike", likeVo);
		if (count > 0) {
			return true;
		}
		return false;
	}
	*/
}
