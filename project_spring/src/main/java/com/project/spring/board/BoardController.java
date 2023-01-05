package com.project.spring.board;

import java.io.FileInputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.spring.vo.BoardVo;
import com.project.spring.vo.ProductVo;


@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Autowired
	BoardService boardService;
	

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listArticle(Model model) {
		List<BoardVo> list = boardService.listArticle();
		model.addAttribute("list", list);
		return "board/qna";
	}
}
