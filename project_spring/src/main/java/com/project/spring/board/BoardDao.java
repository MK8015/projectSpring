package com.project.spring.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	// 占쏙옙 占쏙옙占
	public List<BoardVo> listArticle(BoardPagingDto boardPagingDto) {
		
		Map<String, String>map=new HashMap<>();
		map.put("startRow", String.valueOf(boardPagingDto.getStartRow()));
		map.put("endRow", String.valueOf(boardPagingDto.getEndRow()));
		System.out.println("map:"+map);
		List<BoardVo> list = sqlSession.selectList(NAME_SPACE + "listArticle",map);
		
		return list;
	}
	
	// 占쏙옙 占쏙옙호 占쏙옙占쏙옙
	public BoardVo selectByBno(int bno) {
		BoardVo boardVo = sqlSession.selectOne(
				NAME_SPACE + "selectByBno", bno);
		return boardVo;
	}
	
	// 占쏙옙 占쏙옙占쏙옙
	public boolean updateArticle(BoardVo boardVo) {
		int count = sqlSession.update(NAME_SPACE + "updateArticle", boardVo);
		if (count > 0) {
			return true;
		}
		return false;
	}
	
	// 占쏙옙 占쏙옙占쏙옙
	public boolean deleteArticle(int bno) {
		int count = sqlSession.delete(NAME_SPACE + "deleteArticle", bno);
		if (count > 0) {
			return true;
		}
		return false;
	}
	
	// 占쏙옙회占쏙옙 占쏙옙占쏙옙
	public void updateViewcnt(int bno) {
		sqlSession.update(NAME_SPACE + "updateViewcnt", bno);
	}
	
	// bno.nextval
	public int getNextVal() {
		int nextVal = sqlSession.selectOne(NAME_SPACE + "getNextVal");
		return nextVal;
	}

	// 占쌉시깍옙 占쌜쇽옙
	public boolean insertArticle(BoardVo boardVo) {
		int count = sqlSession.insert(NAME_SPACE + "insertArticle", boardVo);
		if (count > 0) {
			return true;
		}
		return false;
	}
	
	// 답글 작성
	public boolean insertReply(BoardVo boardVo) {
		int count = sqlSession.insert(NAME_SPACE + "insertReply", boardVo);
		if (count > 0) {
			return true;
		}
		return false;
	}
	
	// 출력 순서 업데이트
	public void updateReSeq(BoardVo boardVo) {
		sqlSession.update(NAME_SPACE + "updateReSeq", boardVo);
	}


	// 占쏙옙 占쏙옙호 占쏙옙占쏙옙
	public BoardVo selectByRegroup(int re_group) {
		BoardVo boardVo = sqlSession.selectOne(
				NAME_SPACE + "selectByRegroup", re_group);
		return boardVo;

	// 비밀번호 체크
	public boolean checkPassword(BoardVo boardVo) {
		int count = sqlSession.selectOne(NAME_SPACE + "checkPassword", boardVo);
		if (count > 0) {
			return true;
		}
		return false;

	}
	public int getCount() {
		
		int count=sqlSession.selectOne(NAME_SPACE+"getCount");
		return count;
	}
	
	

	
	
	
}
