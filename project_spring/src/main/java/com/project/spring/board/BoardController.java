package com.project.spring.board;

import java.io.FileInputStream;
import java.net.http.HttpRequest;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.spring.login.MyFileUploader;


import com.project.spring.vo.BoardVo;
import com.project.spring.vo.MemberVo;
import com.project.spring.vo.PagingDto;
import com.project.spring.vo.ProductVo;


@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Autowired
	BoardService boardService;
	
//	BoardPagingDto boardPagingDto=new BoardPagingDto();
	
	
	
	// 占쏙옙 占쏙옙占 占쏙옙占쏙옙
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listArticle(Model model,BoardPagingDto boardPagingDto) {
		List<BoardVo> list = boardService.listArticle(boardPagingDto);
		boardPagingDto.setPagingInform(boardPagingDto.getPage(),boardPagingDto.getPerPage(), boardService.getCount());
//		BoardPagingDto.setPagingInform(BoardPagingDto. , boardPagingDto.getPerPage(), boardService.getCount());
		System.out.println("boardPagingDto:"+boardPagingDto);
		model.addAttribute("list", list);
		model.addAttribute("BoardPagingDto", boardPagingDto);
		return "board/list";
	}
	
	// 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String getArticle(int bno, Model model, HttpSession session) {
		BoardVo boardVo = boardService.selectByBno(bno);
		model.addAttribute("boardVo", boardVo);
		return "board/detail";
	}
	

	// 占쏙옙 占쏙옙占쏙옙
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyArticle(BoardVo boardVo) {
		boardService.updateArticle(boardVo);
		return "redirect:/board/detail" +
				"?bno=" + boardVo.getBno();
	}
	
		// 글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String remove(int bno) {
		boardService.deleteArticle(bno);
		return "redirect:/board/list";
	}
	

	// 占쏙옙 占쏙옙占
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String registerForm() {
		return "board/write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String addArticle(BoardVo boardVo, RedirectAttributes rttr, 
								HttpSession session, MultipartFile file) {

		// 사진 넣기
		System.out.println("file:" + file);
		String originalFilename = file.getOriginalFilename();
		System.out.println("originalFilename:" + originalFilename);
		
		if (originalFilename != null & !originalFilename.equals("")) {
			long size = file.getSize();
			System.out.println("size:" + size);
			String name = file.getName();
			System.out.println("name:" + name);
			try {
				String pic = MyFileUploader.uploadfile(
						"//192.168.0.233/userpics/", originalFilename, file.getBytes());
				boardVo.setPic(pic);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		String loginMember = (String)session.getAttribute("loginMember");
		boardVo.setWriter(loginMember);
		boolean result = boardService.insertArticle(boardVo);
		rttr.addFlashAttribute("register_result", result);
		return "redirect:/board/list";
	}
	

	 //답글 등록

	@RequestMapping(value = "/reply", method = RequestMethod.GET)
	public String reply(int re_group, HttpServletRequest request) {
		request.setAttribute("re_group", re_group);
		return "board/reply";
	}
	
	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	public String reply(BoardVo boardVo, RedirectAttributes rttr, HttpSession session) {
		String loginMember = (String)session.getAttribute("loginMember");
		boardVo.setWriter(loginMember);
		boolean result = boardService.insertReply(boardVo);
		rttr.addFlashAttribute("reply_result", result);
		return "redirect:/board/list";
	}
	


	// 사진 보기

	@RequestMapping(value = "/displayImage", method = RequestMethod.GET)
	@ResponseBody 
	public byte[] displayImage(String pic) {
		if (pic != null && !pic.equals("")) {
			FileInputStream fis = null;
			try {
				String filePath = "//192.168.0.233/userpics/" + pic; 
				fis = new FileInputStream(filePath);
				byte[] bytes = IOUtils.toByteArray(fis);
				return bytes;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {fis.close();} catch (Exception e) { }
			}
		}
		return null;
	}
	
	// 비밀번호 체크
	@RequestMapping(value = "/checkPassword", method = RequestMethod.POST)
	@ResponseBody
	public String checkPassword(BoardVo boardVo) {
		boolean result = boardService.checkPassword(boardVo);
		return String.valueOf(result);
	}
	

	// 글 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyArticle(int bno, Model model) {
		BoardVo boardVo = boardService.selectByBno(bno);
		model.addAttribute("boardVo", boardVo);
		return "board/modify";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String updateArticle(BoardVo boardVo, MultipartFile file) {
		// 사진 넣기
		System.out.println("file:" + file);
		String originalFilename = file.getOriginalFilename();
		System.out.println("originalFilename:" + originalFilename);
	
		if (originalFilename != null & !originalFilename.equals("")) {
			long size = file.getSize();
			System.out.println("size:" + size);
			String name = file.getName();
			System.out.println("name:" + name);
			try {
				String pic = MyFileUploader.uploadfile(
						"//192.168.0.233/userpics/", originalFilename, file.getBytes());
				boardVo.setPic(pic);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		boardService.updateArticle(boardVo);
		return "redirect:/board/detail" +
				"?bno=" + boardVo.getBno();
	}
	

	
	
	
	
}
