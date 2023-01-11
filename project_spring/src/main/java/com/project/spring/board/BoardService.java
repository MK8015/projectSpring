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
	
	// 占쏙옙 占쏙옙占 占쏙옙占쏙옙
	public List<BoardVo> listArticle(BoardPagingDto boardPagingDto) {
		return boardDao.listArticle(boardPagingDto);
	}

	// 占쏙옙 占쏙옙호 占쏙옙占쏙옙
	public BoardVo selectByBno(int bno) {
		boardDao.updateViewcnt(bno); //占쏙옙회占쏙옙
		BoardVo boardVo = boardDao.selectByBno(bno);
		return boardVo;
	}
	
	// 占쏙옙 占쏙옙占쏙옙
	public boolean updateArticle(BoardVo boardVo) {
		return boardDao.updateArticle(boardVo);
	}
	
	// 占쏙옙 占쏙옙占쏙옙
	public boolean deleteArticle(int bno) {
		return boardDao.deleteArticle(bno);
	}
	
	
	// 占쏙옙 占쌜쇽옙
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
	



	// 占쏙옙 占쏙옙호 占쏙옙占쏙옙
	public BoardVo selectByRegroup(int re_group) {
		BoardVo boardVo = boardDao.selectByRegroup(re_group);
		return boardVo;
	}

	// 비밀번호 체크
	public boolean checkPassword(BoardVo boardVo) {
		return boardDao.checkPassword(boardVo);

	}
	public int getCount() {
		int count=boardDao.getCount();
		return count;
	}
	
	
	
	
}
