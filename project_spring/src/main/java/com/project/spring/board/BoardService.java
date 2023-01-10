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
	
	// 글 목록 보기
	public List<BoardVo> listArticle() {
		return boardDao.listArticle();
	}

	// 글 번호 선택
	public BoardVo selectByBno(int bno) {
		boardDao.updateViewcnt(bno); //조회수
		BoardVo boardVo = boardDao.selectByBno(bno);
		return boardVo;
	}
	
	// 글 수정
	public boolean updateArticle(BoardVo boardVo) {
		return boardDao.updateArticle(boardVo);
	}
	
	// 글 삭제
	public boolean deleteArticle(int bno) {
		return boardDao.deleteArticle(bno);
	}
	
	
	// 글 작성
	@Transactional
	public boolean insertArticle(BoardVo boardVo) {
		int nextVal = boardDao.getNextVal();
		boardVo.setBno(nextVal);
		return boardDao.insertArticle(boardVo);
	}
	
	// 답글 작성
	@Transactional
	public boolean insertReply(BoardVo boardVo) {
		boardDao.updateReSeq(boardVo);
		return boardDao.insertReply(boardVo);
	}
	
	// 비밀번호 체크
	public boolean checkPassword(BoardVo boardVo) {
		return boardDao.checkPassword(boardVo);
	}
	
	
	
}
