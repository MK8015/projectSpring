package com.project.spring.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.spring.vo.BoardVo;

@Repository
public class BoardDao {
	
	private final String NAME_SPACE = "mappers.board.";
	
	@Autowired
	SqlSession sqlSession;
	
	// 전체 글 리스트 보기
	public List<BoardVo> listArticle(BoardPagingDto boardPagingDto) {
		Map<String, String>map=new HashMap<>();
		map.put("startRow", String.valueOf(boardPagingDto.getStartRow()));
		map.put("endRow", String.valueOf(boardPagingDto.getEndRow()));
		List<BoardVo> list = sqlSession.selectList(NAME_SPACE + "listArticle", map);
		return list;
	}
	
	// 공지 글 리스트 보기
	public List<BoardVo> listNotify() {
		List<BoardVo> listNotify = sqlSession.selectList(NAME_SPACE + "listNotify");
		return listNotify;
	}
	
	// 글 번호 선택
	public BoardVo selectByBno(int bno) {
		BoardVo boardVo = sqlSession.selectOne(
				NAME_SPACE + "selectByBno", bno);
		return boardVo;
	}
	
	// 비밀번호 체크
	public boolean checkPassword(BoardVo boardVo) {
		int count = sqlSession.selectOne(NAME_SPACE + "checkPassword", boardVo);
		if (count > 0) {
			return true;
		}
		return false;
	}
	
	//원글 작성자 체크
	public BoardVo checkOriginalWriter(String member_id, int bno, int re_group) {
		Map<String, String> map = new HashMap<>();
		map.put("member_id", String.valueOf(member_id));
		map.put("bno", String.valueOf(bno));
		map.put("re_group", String.valueOf(re_group));
		return sqlSession.selectOne(NAME_SPACE + "checkOriginalWriter", map);
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

	// 글 등록
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

	// re_group 선택하기
	public BoardVo selectByRegroup(int re_group) {
		BoardVo boardVo = sqlSession.selectOne(
				NAME_SPACE + "selectByRegroup", re_group);
		return boardVo;
	}
	// 카운트 얻어오기
	public int getCount() {
		int count=sqlSession.selectOne(NAME_SPACE+"getCount");
		return count;
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
}
