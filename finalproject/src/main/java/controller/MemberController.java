package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import excep.DuplicateEmailException;
import excep.DuplicateldException;
import excep.InvalidPasswordException;
import excep.LoginFailException;
import excep.MemberNotFoundException;
import model.MemberDataBean;
import mybatis.MybatisMemberDaoImpl;
import service.SignUpService;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	MybatisMemberDaoImpl dbPro;

	@Autowired
	SignUpService service;

	@ModelAttribute
	// 메소드에 이게 있으면 해당되는 메소드의 리턴타입을 리퀘스트로 보낸다?
	// void면 실행은 하지만 보내지 않아
	public void initProcess(HttpServletRequest request) {
		HttpSession session = request.getSession();
	}

	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String member_main() throws Exception {
		return "main/index";
	}

	// 회원가입 페이지 클릭
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String member_joinForm() throws Exception {
		return "member/join_form";
	}

	// produces는 ajax가 데이터 넘겨받을때 깨짐 방지
	@RequestMapping(value = "id_check", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String idCheck(HttpServletRequest request) {

		String id = request.getParameter("id");
		int result = service.idCheck(id);
		return Integer.toString(result);
	}

	// 회원가입 요청
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String member_joinPro(MemberDataBean newMember, Model model, HttpServletRequest req) throws Exception {
		// Model은 내가 아래처림 addAttribute도 해 줘야하고
		// @ModelAttritube는 써 주면 그대로 바로 날라간다.
		System.out.println("1" + newMember.toString());
		Map<String, Boolean> errors = new HashMap<>();
		model.addAttribute("errors", errors);

		newMember.vaildate(errors);

		if (!errors.isEmpty())
			return "member/join_form";

		try {
			MemberDataBean memberId = dbPro.selectById(newMember.getId());
			MemberDataBean memberEmail = dbPro.selectByEmail(newMember.getEmail());
			if (memberId != null)
				throw new DuplicateldException();
			if (memberEmail != null)
				throw new DuplicateEmailException();
			dbPro.insert(newMember);

			MemberDataBean joinUser = new MemberDataBean(newMember.getId(), newMember.getName(), newMember.getAuth());
			req.getSession().setAttribute("member", joinUser);

			model.addAttribute("message", "환영합니다 :D");
			model.addAttribute("url", "main");
			return "alert";

		} catch (DuplicateldException e) {
			errors.put("duplicateId", Boolean.TRUE);
			return "member/joinform";
		} catch (DuplicateEmailException e) {
			errors.put("duplicateEmail", Boolean.TRUE);
			return "member/join_form";
		}
	}

	// 로그인 화면
	@RequestMapping(value = "login")
	public String member_login() throws Exception {
		return "member/login";
	}

	// 로그인 요청
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String member_loginPro(MemberDataBean inputData, Model model, HttpServletRequest req) throws Exception {
		Map<String, Boolean> errors = new HashMap<>();
		model.addAttribute("errors", errors);

		if (inputData.getId() == null || inputData.getId().isEmpty())
			errors.put("id", Boolean.TRUE);
		if (inputData.getPw() == null || inputData.getPw().isEmpty())
			errors.put("pw", Boolean.TRUE);
		if (!errors.isEmpty())
			return "member/login";
		try {
			// 데이터 가져오기
			MemberDataBean member = dbPro.selectById(inputData.getId());
			if (member == null) {
				throw new LoginFailException();
			}
			System.out.println("아이디" + member.getId());
			System.out.println("비밀번호" + member.getPw());
			if (!inputData.matchPassword(member.getPw()))
				throw new LoginFailException();
			MemberDataBean loginUser = new MemberDataBean(member.getId(), member.getName(), member.getAuth());
			req.getSession().setAttribute("member", loginUser);

		} catch (LoginFailException e) {
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return "member/login";
		}
		model.addAttribute("message", "로그인 성공");
		model.addAttribute("url", "main");
		return "redirect:/admin/registered_book_list?page_num=2";
	}

	// 비밀번호 찾기
	@RequestMapping(value = "find_pw", method = RequestMethod.GET)
	public String member_findPw() throws Exception {
		return "member/find_pw";
	}

	// 로그아웃
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String member_logout(HttpServletRequest req, Model model) throws Exception {
		HttpSession session = req.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		
		return "main/index";
	}

	// 회원 탈퇴
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String member_delete(HttpServletRequest req, HttpServletResponse res) throws Exception {
		MemberDataBean loginUser = (MemberDataBean) req.getSession().getAttribute("member");

		try {
			MemberDataBean myInfo = dbPro.selectById(loginUser.getId());

			req.setAttribute("myInfo", myInfo);
			return "member/delete";

		} catch (MemberNotFoundException e) {
			req.getServletContext().log("not login", e);
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return "member/delete";
		}
	}

	// 회월 탈퇴
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String member_deletePro(MemberDataBean inputData, Model model, HttpSession session, RedirectAttributes rttr) throws Exception{
		
		Map<String, Boolean> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		try{
			MemberDataBean deletememberId = dbPro.selectById(inputData.getId());
			System.out.println("이건 DB에 있는 아이디" + deletememberId.getId());
			System.out.println("이건 DB에 있는 패스워드" + deletememberId.getPw());
			//
			System.out.println("이건 히든 입력 값 아이디" + inputData.getId());
			System.out.println("이건 사용자 입력 값 패스워드" + inputData.getPw());		
			if((deletememberId.getId().equals(inputData.getId())) && (deletememberId.getPw().equals(inputData.getPw()))){
				System.out.println("삭제가 될 거에유");
				dbPro.delete(inputData);
				session.invalidate();
				model.addAttribute("message", "안녕히가세요...");
				model.addAttribute("url", "main");
				return "alert";
			} else if(!deletememberId.getPw().equals(inputData.getPw())) {
				System.out.println("비밀번호 에러지롱");
				errors.put("wrongPw", Boolean.TRUE);
				return "member/delete";
			} else if(inputData.getPw() == null){
				errors.put("null", Boolean.TRUE);
			}
			return "alert";			
		} catch (MemberNotFoundException e) {
			errors.put("pwError", Boolean.TRUE);	
			return "member/delete";
		}
	}
	// 비밀번호 변경 페이지 클릭

	@RequestMapping(value = "change_pw")
	public String member_changePw(HttpServletRequest req, HttpServletResponse res) throws Exception {
		MemberDataBean loginUser = (MemberDataBean) req.getSession().getAttribute("member");

		try {
			// MybatisMemberDao memberDao = MybatisMemberDao.getInstance();
			MemberDataBean myInfo = dbPro.selectById(loginUser.getId());

			req.setAttribute("myInfo", myInfo);
			return "member/change_pw";

		} catch (MemberNotFoundException e) {
			req.getServletContext().log("not login", e);
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}

	}

	// 비밀번호 변경
	@RequestMapping(value = "change_pw", method = RequestMethod.POST)
	public String member_changePwPro(MemberDataBean inputData, Model model, HttpServletResponse res) throws Exception {

		Map<String, Boolean> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		
		if (inputData.getPw() == null || inputData.getPw().isEmpty())
			errors.put("curPwd", Boolean.TRUE);
		if (inputData.getNewPw() == null || inputData.getNewPw().isEmpty())
			errors.put("newPwd", Boolean.TRUE);
		if (!errors.isEmpty())
			return "member/change_pw";

		try {
			MemberDataBean member = dbPro.selectById(inputData.getId());
			if (member == null) {
				throw new MemberNotFoundException();
			}
			System.out.println("db에 있는 비밀번호" + member.getPw());
			System.out.println("사용자가 입력한 현재 pw " + inputData.getPw());
			System.out.println("사용자가 입력한 새로운 pw " + inputData.getNewPw());
			
			if (!inputData.getPw().equals(member.getPw())) {
				System.out.println("비밀번호가 맞지 않아유!");
				errors.put("badCurPwd", Boolean.TRUE);
				throw new InvalidPasswordException();
			} else if (inputData.getNewPw().equals(member.getId())){
				errors.put("wrongPw", Boolean.TRUE);
				System.out.println("아이디와 비밀번호가 같을 수 없슈");
				throw new InvalidPasswordException();
			} else if (inputData.getPw().equals(member.getPw())){
				System.out.println("실행된다아아아");
			member.changePassword(inputData.getNewPw());
			System.out.println("위에서 바뀐 데이터 " + member.getPw());
			dbPro.update(inputData);
			}
			model.addAttribute("message", "회원 정보 수정 완료");
			model.addAttribute("url", "main");
			return "alert";
		} catch (InvalidPasswordException e) {
			errors.put("fatalError", Boolean.TRUE);
			return "member/change_pw";
		} catch (MemberNotFoundException e) {
			res.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return "member/main";
		}

	}

	// 아이디 찾기
	@RequestMapping(value = "find_id", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("email") String email, Model model)
			throws Exception {
		model.addAttribute("id", service.findId(response, email));
		return "/member/find_id";
	}

	// 아이디 찾기
	@RequestMapping(value = "find_id_form", method = RequestMethod.GET)
	public String find_id_form() throws Exception {
		return "member/find_id_form";
	}

	// 비밀번호 찾기 폼
	@RequestMapping(value = "find_pw_form")
	public String find_pw_form() throws Exception {
		return "member/find_pw_form";
	}

/*	// 이메일 보내기
	@Autowired
	private MainService mainService;
	@Autowired
	private EmailSender emailSender;
	@Autowired
	private Email email;

	@RequestMapping("sendpw")
	public ModelAndView sendEmailAction(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
		ModelAndView mav;
		String id = (String) paramMap.get("id");
		String e_mail = (String) paramMap.get("email");
		String pw = mainService.getPw(paramMap);
		System.out.println(pw);
		if (pw != null) {
			email.setContent("비밀번호는 " + pw + " 입니다.");
			email.setReciver(e_mail);
			email.setSubject(id + "님 비밀번호 찾기 메일입니다.");
			emailSender.SendEmail(email);
			mav = new ModelAndView("redirect:/login.do");
			return mav;
		} else {
			mav = new ModelAndView("redirect:/logout.do");
			return mav;
		}
	}*/
	
	// 라이브러리
	@RequestMapping(value = "my_library")
	public String my_library() throws Exception {
		return "member/my_library";
	}
}
