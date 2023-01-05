package com.project.spring.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.spring.vo.BoardVo;
import com.project.spring.vo.ProductVo;

@Service
public class BoardService {
	
	@Autowired
	BoardDao boardDao;
	
	// �� ��� ����
	public List<BoardVo> listArticle() {
		return boardDao.listArticle();
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
	
	
	
}
