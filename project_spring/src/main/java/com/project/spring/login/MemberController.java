package com.project.spring.login;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.spring.vo.EmailDto;
import com.project.spring.vo.MemberVo;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	//로그인 화면 띄우기
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm() {
		
		return "member/login";
	}
	
	//로그인 시
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginRun(String member_id, String password,HttpSession session
							,RedirectAttributes rttr,String saveId,HttpServletResponse response) {
		
		MemberVo memberVo=memberService.loginRun(member_id, password);
		String page="";
		
		
		if(memberVo ==null){
			//로그인 실패시
			rttr.addFlashAttribute("isLogin", "fail");
			page="redirect:/member/login";
		}else {
			//로그인 성공시
			//로그인 세션에 넣어둠  
			session.setAttribute("loginMember", memberVo.getMember_id());
			
			
			//쿠키넣기
			Cookie cookie=new Cookie("member_id",member_id);
			if(saveId!=null) {
				cookie.setMaxAge(60*60*24*7);
			}else{
				cookie.setMaxAge(0);
			}
			response.addCookie(cookie);
			page="index/main";
		}
		return page; 
	}
	
	//회원가입 화면 띄우기
	@RequestMapping(value = "/registerForm", method = RequestMethod.GET)
	public String showRegister() {
		
		return "member/register";
	}
	
	
	
	//등록 실행
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerRun(MemberVo memberVo, MultipartFile file, RedirectAttributes rttr) {
		
		String page="";
		String originalFilename=file.getOriginalFilename();
		
		
		//이미지 파일업로드
		try {
		 String member_pic=MyFileUploader.uploadfile("//192.168.0.233/userpics/", originalFilename, file.getBytes());
		 System.out.println("member_pic:"+member_pic);
		 memberVo.setMember_pic(member_pic);
		
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//등록실행
		boolean result=memberService.registerRun(memberVo);
		System.out.println("controller memberVo:"+memberVo);
		if(result) {
			rttr.addFlashAttribute("register_result","true");
			page="redirect:/member/login";

		}else {
			rttr.addFlashAttribute("register_result","false");
			
			page="redirect:/member/registerForm";
		}
			return page;
	}
	
	//비밀번호 찾기 띄우기
	@RequestMapping(value = "/forgot-passwordForm", method = RequestMethod.GET)
	public String showforgotpassword() {
		
		return "member/forgot-password";
	}
	
	//비밀번호 찾기 실행
	@RequestMapping(value = "/forgot-password", method = RequestMethod.POST)
	public String snedPassword(EmailDto emailDto, RedirectAttributes rttr) {
		
		//찾기하는데 제대로 넣지 않은 경우
		if(emailDto.getMember_id()==null ||
		   emailDto.getMember_id().equals("") ||
		   emailDto.getTo()==null ||
		   emailDto.getTo().equals("")){
			rttr.addFlashAttribute("isEmpty", "true");
			return "redirect:/member/forgot-passwordForm";
		}
		
		//아이디하고 이메일이 제대로 있는지
		if(!memberService.isExist(emailDto.getMember_id(),emailDto.getTo())) {
			rttr.addFlashAttribute("isExist","false");
			return "redirect:/member/forgot-passwordForm";
			
		}
		
		//임시비밀번호 생성 및 발송
		String uuid=UUID.randomUUID().toString();
		String uuidsub = uuid.substring(0, uuid.indexOf("-"));
		
		if(memberService.updatePassword(emailDto.getTo(),uuidsub)) {
			
			MimeMessagePreparator preparator=new MimeMessagePreparator() {
				
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					MimeMessageHelper helper=new MimeMessageHelper(
					mimeMessage,
					false,
					"utf-8");
					helper.setFrom(emailDto.getFrom());
					helper.setTo(emailDto.getTo());
					helper.setSubject("임시비밀번호 발송안내");
					helper.setText("새로운 임시 비밀번호는 "+uuidsub+"입니다");
				}
			};
			mailSender.send(preparator);
		}
		return "redirect:/member/forgot-passwordForm";
		
	}
	
	//아이디 체크
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	@ResponseBody
	public boolean idCheck(String member_id) {
		boolean result= memberService.idCheck(member_id);
		
		return result;
	}
	

	
}
