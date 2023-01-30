package com.project.spring.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.spring.vo.BoardVo;

@Service
public class BoardService {
	
	@Autowired
	BoardDao boardDao;
	
	// 전체 글 리스트
	public List<BoardVo> listArticle(BoardPagingDto boardPagingDto) {
		return boardDao.listArticle(boardPagingDto);
	}
	
	// 공지 글 리스트
	public List<BoardVo> listNotify() {
		return boardDao.listNotify();
	}

	// 글 번호 선택
	public BoardVo selectByBno(int bno) {
		boardDao.updateViewcnt(bno); //占쏙옙회占쏙옙
		BoardVo boardVo = boardDao.selectByBno(bno);
		return boardVo;
	}

	// 비밀번호 체크
	public boolean checkPassword(BoardVo boardVo) {
		return boardDao.checkPassword(boardVo);
	}
	
	// 작성자 체크
	public BoardVo checkOriginalWriter(String member_id, int bno, int re_group) {
		return boardDao.checkOriginalWriter(member_id, bno, re_group);
	}
	
	// 글 등록
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
	
	// 리그룹 선택하기
	public BoardVo selectByRegroup(int re_group) {
		BoardVo boardVo = boardDao.selectByRegroup(re_group);
		return boardVo;
	}

	// 카운트 얻어오기
	public int getCount() {
		int count=boardDao.getCount();
		return count;
	}
	
	// 글 수정
	public boolean updateArticle(BoardVo boardVo) {
		return boardDao.updateArticle(boardVo);
	}
	
	// 글 삭제
	public boolean deleteArticle(int bno) {
		return boardDao.deleteArticle(bno);
	}
}
