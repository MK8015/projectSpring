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

	// �� ���
	public List<BoardVo> listArticle() {
		List<BoardVo> list = sqlSession.selectList(NAME_SPACE + "listArticle");
		return list;
	}
	
	// �� ��ȣ ����
	public BoardVo selectByBno(int bno) {
		BoardVo boardVo = sqlSession.selectOne(
				NAME_SPACE + "selectByBno", bno);
		return boardVo;
	}
	
	// �� ����
	public boolean updateArticle(BoardVo boardVo) {
		int count = sqlSession.update(NAME_SPACE + "updateArticle", boardVo);
		if (count > 0) {
			return true;
		}
		return false;
	}
	
	// �� ����
	public boolean deleteArticle(int bno) {
		int count = sqlSession.delete(NAME_SPACE + "deleteArticle", bno);
		if (count > 0) {
			return true;
		}
		return false;
	}
	
	// ��ȸ�� ����
	public void updateViewcnt(int bno) {
		sqlSession.update(NAME_SPACE + "updateViewcnt", bno);
	}
	
	
	
	
}
