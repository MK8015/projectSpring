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
	

	public List<BoardVo> listArticle() {
		return boardDao.listArticle();
	}

	
	
}
