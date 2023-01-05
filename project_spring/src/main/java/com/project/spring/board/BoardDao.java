package com.project.spring.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.spring.vo.BoardVo;
import com.project.spring.vo.ProductVo;

@Repository
public class BoardDao {
	
	private final String NAME_SPACE = "mappers.board.";
	
	@Autowired
	SqlSession sqlSession;

	public List<BoardVo> listArticle() {
		List<BoardVo> list = sqlSession.selectList(NAME_SPACE + "listArticle");
		return list;
	}
	
}
