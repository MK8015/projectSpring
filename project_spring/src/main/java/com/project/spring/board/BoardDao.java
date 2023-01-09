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

	// 글 목록
	public List<BoardVo> listArticle() {
		List<BoardVo> list = sqlSession.selectList(NAME_SPACE + "listArticle");
		return list;
	}
	
	// 글 번호 선택
	public BoardVo selectByBno(int bno) {
		BoardVo boardVo = sqlSession.selectOne(
				NAME_SPACE + "selectByBno", bno);
		return boardVo;
	}
	
	// 글 수정
	public boolean updateArticle(BoardVo boardVo) {
		int count = sqlSession.update(NAME_SPACE + "updateArticle", boardVo);
		if (count > 0) {
			return true;
		}
		return false;
	}
	
	// 글 삭제
	public boolean deleteArticle(int bno) {
		int count = sqlSession.delete(NAME_SPACE + "deleteArticle", bno);
		if (count > 0) {
			return true;
		}
		return false;
	}
	
	// 조회수 증가
	public void updateViewcnt(int bno) {
		sqlSession.update(NAME_SPACE + "updateViewcnt", bno);
	}
	
	// bno.nextval
	public int getNextVal() {
		int nextVal = sqlSession.selectOne(NAME_SPACE + "getNextVal");
		return nextVal;
	}

	// 게시글 작성
	public boolean insertArticle(BoardVo boardVo) {
		int count = sqlSession.insert(NAME_SPACE + "insertArticle", boardVo);
		if (count > 0) {
			return true;
		}
		return false;
	}
	

	public boolean insertReply(BoardVo boardVo) {
		int count = sqlSession.insert(NAME_SPACE + "insertReply", boardVo);
		if (count > 0) {
			return true;
		}
		return false;
	}
	
	public void updateReSeq(BoardVo boardVo) {
		sqlSession.update(NAME_SPACE + "updateReSeq", boardVo);
	}
	

	// 글 번호 선택
	public BoardVo selectByRegroup(int re_group) {
		BoardVo boardVo = sqlSession.selectOne(
				NAME_SPACE + "selectByRegroup", re_group);
		return boardVo;
	}
	
	
	
	
}
