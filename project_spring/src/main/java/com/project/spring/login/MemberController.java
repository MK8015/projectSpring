package com.project.spring.login;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.spring.cart.CartService;
import com.project.spring.like.LikeService;
import com.project.spring.util.ImageUploader;
import com.project.spring.vo.EmailDto;
import com.project.spring.vo.MemberVo;
import com.project.spring.vo.OrderVo;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Value("${naver.apikey}")
	private String NAVERAPIKEY;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private LikeService likeService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	//처음 로그인 화면
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm() {
		
		return "member/login";
	}
	
	//로그인 화면
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginRun(String member_id, String password,HttpSession session
							,RedirectAttributes rttr,String saveId,String location,HttpServletResponse response) {
		
		MemberVo memberVo=memberService.loginRun(member_id, password);
		String page="";
		
		if(memberVo ==null){	//로그인 실패시 
			
			rttr.addFlashAttribute("isLogin", "fail");
			page="redirect:/member/login";
		} else {	//로그인 성공시
			// 멤버당 좋아요 개수
			int memberLikeCount = likeService.memberLikeCount(member_id);
			memberVo.setMemberLikeCount(memberLikeCount);
			
			// 멤버당 장바구니 개수
			int memberCartCount = cartService.memberCartCount(member_id);
			memberVo.setMemberCartCount(memberCartCount);
			
			//아이디 저장 쿠키 넣기
			Cookie cookie=new Cookie("member_id",member_id);
			if(saveId!=null) {
				cookie.setMaxAge(60*60*24*7);
			}else{
				cookie.setMaxAge(0);
			}
			response.addCookie(cookie);
			
			//로그인 세션에 넣어둠    
			session.setAttribute("loginMemberVo", memberVo);
			String returnURI = (String)session.getAttribute("returnURI");
			if(returnURI == null) {
				if(location.equals("/member/login") || location.equals("")) {
					return "redirect:/main/index";
				}
				returnURI = location;
			}
			session.removeAttribute("returnURI");
			if(memberVo.getMember_id().equals("admin")) {
				return "redirect:/admin/index";
			}
			page = "redirect:"+returnURI;
		}
		return page; 
	}
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate(); //세션이 없을 때
		return "redirect:/member/login";
	}
	
	//등록 띄우기
	@RequestMapping(value = "/registerForm", method = RequestMethod.GET)
	public String showRegister() {
		return "member/register";
	}
	
	//등록 실행
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerRun(MemberVo memberVo, MultipartFile file, RedirectAttributes rttr) {
		
		String page="";
		String originalFilename=file.getOriginalFilename();
		try {
		 String member_pic=ImageUploader.uploadFile("//192.168.0.233/userpics/", originalFilename, file.getBytes());		
		 memberVo.setMember_pic(member_pic);
		
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//등록 결과
		boolean result=memberService.registerRun(memberVo);
		if(result) {
			rttr.addFlashAttribute("register_result","true");
			page="redirect:/member/login";

		}else {
			rttr.addFlashAttribute("register_result","false");
			
			page="redirect:/member/registerForm";
		}
			return page;
	}
	
	//비밀번호 찾기 창 띄우기
	@RequestMapping(value = "/forgot-passwordForm", method = RequestMethod.GET)
	public String showforgotpassword() {
		
		return "member/forgot-password";
	}
	
	//비밀번호 찾기 실행
	@RequestMapping(value = "/forgot-password", method = RequestMethod.POST)
	public String snedPassword(EmailDto emailDto, RedirectAttributes rttr) {
		
		//정보가 하나라도 입력되지 않았을 경우
		if(emailDto.getMember_id()==null ||
		   emailDto.getMember_id().equals("") ||
		   emailDto.getTo()==null ||
		   emailDto.getTo().equals("")){
			rttr.addFlashAttribute("isEmpty", "true");
			return "redirect:/member/forgot-passwordForm";
		}
		
		//아이디,메일이 등록이 되지 않은 경우
		if(!memberService.isExist(emailDto.getMember_id(),emailDto.getTo())) {
			rttr.addFlashAttribute("isExist","false");
			return "redirect:/member/forgot-passwordForm";
			
		}
		
		
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
					helper.setText("새로운 임시비밀번호는 "+uuidsub+"입니다");
				}
			};
			mailSender.send(preparator);
		}
		return "redirect:/member/forgot-passwordForm";
		
	}
	
	//아이디 체크하기
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	@ResponseBody
	public boolean idCheck(String member_id) {
		boolean result= memberService.idCheck(member_id);
		
		return result;
	}
	
	//마이페이지 열기
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/mypage",method = RequestMethod.GET)
	public String MyPage(HttpSession session,Model model) {
		MemberVo loginmemberVo=(MemberVo)session.getAttribute("loginMemberVo");
		 String member_id=loginmemberVo.getMember_id();
		if(member_id==null || member_id.equals("")) {
			return "member/login";
		}
		
		Map<String, Object>map=memberService.getMyInfo(member_id);
		MemberVo memberVo=(MemberVo)map.get("memberVo");
		List<OrderVo>list=(List<OrderVo>)map.get("list");
		System.out.println("controller memberVo:"+memberVo);
		System.out.println("controller list:"+list);
		model.addAttribute("memberVo",memberVo);
		model.addAttribute("list", list);
		return "member/mypage";
	}
	
	//마이페이지 정보 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyInfo(MemberVo memberVo,RedirectAttributes rttr,MultipartFile file) {
		
		String originalFilename=file.getOriginalFilename();
		
		try {
			 String member_pic=ImageUploader.uploadFile("//192.168.0.233/userpics/", originalFilename, file.getBytes());
			 memberVo.setMember_pic(member_pic);
			
			} catch (IOException e) {
				e.printStackTrace();
			}
		
		Boolean result= memberService.modifyInfo(memberVo);
		if(result) {
			rttr.addFlashAttribute("isModify","true");
		}else{
			rttr.addFlashAttribute("isModify","false");
		}
		
		return "redirect:/member/mypage";
	}
	
	
	//프로필 가져오기
	@RequestMapping(value = "/getProfile",method = RequestMethod.GET)
	@ResponseBody
	public byte[] getImage(String profileImage) { 
		if(profileImage !=null && !profileImage.equals("")) {
		   String filePath="//192.168.0.233/userpics/"+profileImage;
			try {
				FileInputStream fis = new FileInputStream(filePath);
				byte[] bytes=IOUtils.toByteArray(fis);
				   return bytes;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	

	
	//네이버 로그인 하기
	@RequestMapping(value="/naverLoginRun", method=RequestMethod.POST)
    public String naverLoginRun(HttpSession session,String loginToken,MemberVo getmemberVo,
    							RedirectAttributes attr,Model model,String naver_id) {
		String page="";
		String naverMember_id=(naver_id.substring(naver_id.length()-5,naver_id.length())).toLowerCase();
		
		MemberVo memberVo= memberService.naverLoginRun(naverMember_id);
		if(memberVo==null||memberVo.equals("")) {
			getmemberVo.setMember_id(naverMember_id);
			getmemberVo.setPassword(naverMember_id);
			model.addAttribute("MemberVo",getmemberVo);
			page="member/naverRegister";
		}else {
			// 멤버당 좋아요 개수
			int memberLikeCount = likeService.memberLikeCount(naverMember_id);
			memberVo.setMemberLikeCount(memberLikeCount);
			
			// 멤버당 장바구니 개수
			int memberCartCount = cartService.memberCartCount(naverMember_id);
			memberVo.setMemberCartCount(memberCartCount);
			
			//로그인 성공시
			//로그인 세션에 넣어둠    
			session.setAttribute("loginMemberVo", memberVo);
			session.setAttribute("loginMember", memberVo.getMember_id());
			session.setAttribute("isNaverLogin", true);
			page= "redirect:/main/index";
		}
		return page;
    }
	
	
	//네이버 로그인 실행 폼
	@RequestMapping(value="/naverLoginForm", method=RequestMethod.GET)
    public String loginPOSTNaver(Model model) {
		model.addAttribute("NAVERAPIKEY",NAVERAPIKEY);
        return "member/naverLoginForm";
    }

	
}
