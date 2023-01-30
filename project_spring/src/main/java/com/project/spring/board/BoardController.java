package com.project.spring.board;

import java.io.FileInputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.spring.util.ImageUploader;
import com.project.spring.vo.BoardVo;
import com.project.spring.vo.MemberVo;


@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Autowired
	BoardService boardService;
//	BoardPagingDto boardPagingDto=new BoardPagingDto();
	

	// 전체 글 리스트
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listArticle(Model model,BoardPagingDto boardPagingDto) {

		boardPagingDto.setPagingInform(boardPagingDto.getPage(),boardPagingDto.getPerPage(), boardService.getCount());
		List<BoardVo> list = boardService.listArticle(boardPagingDto);
		// 공지 글 리스트 따로, 그냥 글 리스트 따로
		List<BoardVo> listNotify = boardService.listNotify();
		model.addAttribute("listNotify", listNotify);
		model.addAttribute("list", list);
		model.addAttribute("BoardPagingDto", boardPagingDto);
		return "board/list";
	}
	
	// 디테일로 가기
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String getArticle(int bno, int re_group, Model model, HttpSession session,
								RedirectAttributes rttr) {

		
		MemberVo memberVo =(MemberVo)session.getAttribute("loginMemberVo");
		
		String member_id = null;
		if (memberVo != null) {
			member_id = memberVo.getMember_id();
		} 
		
		BoardVo boardVo = null;
		if (bno == re_group) {
			//원글
			boardVo = boardService.selectByBno(bno);
		} else {
			// 답글일 때
			boardVo = boardService.checkOriginalWriter(member_id, bno, re_group);
			// 답글인데 비회원일 때
			
			
			if (member_id == null || member_id.equals("admin")) {
				boardVo = boardService.selectByBno(bno);
				model.addAttribute("boardVo", boardVo);
				return "board/detail";
			}
			if (boardVo == null) {
				rttr.addFlashAttribute("checkOriginalWriter", "fail");
				rttr.addFlashAttribute("bno", bno);
				rttr.addFlashAttribute("re_group", re_group);
				return "redirect:/board/list";
			}
		}
		model.addAttribute("boardVo", boardVo);
		return "board/detail";
	}

	// 비밀번호 체크
	@RequestMapping(value = "/checkPassword", method = RequestMethod.POST)
	@ResponseBody
	public String checkPassword(BoardVo boardVo) {
		boolean result = boardService.checkPassword(boardVo);
		return String.valueOf(result);
	}
	
	// 글쓰기
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String registerForm() {
		return "board/write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String addArticle(BoardVo boardVo, RedirectAttributes rttr, 
								HttpSession session, MultipartFile file) {
		// 사진 넣기
		String originalFilename = file.getOriginalFilename();
		if (originalFilename != null & !originalFilename.equals("")) {
			try {
				String pic = ImageUploader.uploadFile(
						"//192.168.0.233/userpics/", originalFilename, file.getBytes());
				boardVo.setPic(pic);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		MemberVo loginMemberVo = (MemberVo)session.getAttribute("loginMemberVo");
		if (loginMemberVo != null) {
			boardVo.setWriter(loginMemberVo.getMember_id());
		}
		boolean result = boardService.insertArticle(boardVo);
		
		rttr.addFlashAttribute("register_result", result);
		return "redirect:/board/list";
	}

	 //답글 등록
	@RequestMapping(value = "/reply", method = RequestMethod.GET)
	public String reply(int re_group, String password, HttpServletRequest request) {
		request.setAttribute("re_group", re_group);
		request.setAttribute("password", password);
		return "board/reply";
	}
	
	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	public String reply(BoardVo boardVo, RedirectAttributes rttr, HttpSession session) {
		MemberVo memberVo=(MemberVo)session.getAttribute("loginMemberVo");
		String loginMember = memberVo.getMember_id();
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
	
	// 글 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyArticle(int bno, int re_group, Model model) {
		BoardVo boardVo = boardService.selectByBno(bno);
		model.addAttribute("boardVo", boardVo);
		return "board/modify";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String updateArticle(BoardVo boardVo, MultipartFile file) {
		// 사진 넣기
		String originalFilename = file.getOriginalFilename();
		if (originalFilename != null & !originalFilename.equals("")) {
			try {
				String pic = ImageUploader.uploadFile(
						"//192.168.0.233/userpics/", originalFilename, file.getBytes());
				boardVo.setPic(pic);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		boardService.updateArticle(boardVo);
		return "redirect:/board/detail" +
				"?bno=" + boardVo.getBno() +
				"&re_group=" + boardVo.getRe_group();
	}
	
	// 글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String remove(int bno) {
		boardService.deleteArticle(bno);
		return "redirect:/board/list";
	}
}
