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

	// �� ���
	public List<BoardVo> listArticle(BoardPagingDto boardPagingDto) {
		
		Map<String, String>map=new HashMap<>();
		map.put("startRow", String.valueOf(boardPagingDto.getStartRow()));
		map.put("endRow", String.valueOf(boardPagingDto.getEndRow()));
		System.out.println("map:"+map);
		List<BoardVo> list = sqlSession.selectList(NAME_SPACE + "listArticle",map);
		
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
	
	// bno.nextval
	public int getNextVal() {
		int nextVal = sqlSession.selectOne(NAME_SPACE + "getNextVal");
		return nextVal;
	}

	// �Խñ� �ۼ�
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
	

	// �� ��ȣ ����
	public BoardVo selectByRegroup(int re_group) {
		BoardVo boardVo = sqlSession.selectOne(
				NAME_SPACE + "selectByRegroup", re_group);
		return boardVo;
	}
	public int getCount() {
		
		int count=sqlSession.selectOne(NAME_SPACE+"getCount");
		return count;
	}
	
	
	
	
}
