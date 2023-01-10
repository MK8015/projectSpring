package com.project.spring.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.spring.vo.BoardVo;
import com.project.spring.vo.ProductVo;

@Service
public class BoardService {
	
	@Autowired
	BoardDao boardDao;
	
	// �� ��� ����
	public List<BoardVo> listArticle(BoardPagingDto boardPagingDto) {
		return boardDao.listArticle(boardPagingDto);
	}

	// �� ��ȣ ����
	public BoardVo selectByBno(int bno) {
		boardDao.updateViewcnt(bno); //��ȸ��
		BoardVo boardVo = boardDao.selectByBno(bno);
		return boardVo;
	}
	
	// �� ����
	public boolean updateArticle(BoardVo boardVo) {
		return boardDao.updateArticle(boardVo);
	}
	
	// �� ����
	public boolean deleteArticle(int bno) {
		return boardDao.deleteArticle(bno);
	}
	
	
	// �� �ۼ�
	@Transactional
	public boolean insertArticle(BoardVo boardVo) {
		int nextVal = boardDao.getNextVal();
		boardVo.setBno(nextVal);
		return boardDao.insertArticle(boardVo);
	}
	

	@Transactional
	public boolean insertReply(BoardVo boardVo) {
		boardDao.updateReSeq(boardVo);
		return boardDao.insertReply(boardVo);
	}
	


	// �� ��ȣ ����
	public BoardVo selectByRegroup(int re_group) {
		BoardVo boardVo = boardDao.selectByRegroup(re_group);
		return boardVo;
	}
	public int getCount() {
		int count=boardDao.getCount();
		return count;
	}
	
	
}
