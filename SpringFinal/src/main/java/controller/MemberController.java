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
import org.springframework.web.bind.annotation.ResponseBody;

import excep.DuplicateEmailException;
import excep.DuplicateldException;
import excep.InvalidPasswordException;
import excep.LoginFailException;
import excep.MemberNotFoundException;
import model.MemberDataBean;
import service.MybatisMemberDao;
import service.SignUpService;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	MybatisMemberDao dbPro;

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
		return "member/main";
	}

	// 회원가입 페이지 클릭
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String member_joinForm() throws Exception {
		return "member/joinForm";
	}

	// produces는 ajax가 데이터 넘겨받을때 깨짐 방지
	@RequestMapping(value = "idCheck", method = RequestMethod.GET, produces = "application/text; charset=utf8")
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
			return "member/joinForm";

		try {
			MemberDataBean memberId = dbPro.selectById(newMember.getId());
			MemberDataBean memberEmail = dbPro.selectByEmail(newMember.getEmail());
			if (memberId != null)
				throw new DuplicateldException();
			if (memberEmail != null)
				throw new DuplicateEmailException();
			dbPro.insert(newMember);

			MemberDataBean joinUser = new MemberDataBean(newMember.getId(), newMember.getName(), newMember.getAuth());
			req.getSession().setAttribute("auth", joinUser);

			model.addAttribute("message", "환영합니다 :D");
			model.addAttribute("url", "main");
			return "alert";

		} catch (DuplicateldException e) {
			errors.put("duplicateId", Boolean.TRUE);
			return "member/joinForm";
		} catch (DuplicateEmailException e) {
			errors.put("duplicateEmail", Boolean.TRUE);
			return "member/joinForm";
		}
	}

	// 로그인 화면
	@RequestMapping(value = "login")
	public String member_login(HttpServletRequest req) throws Exception {
		return "member/login";
	}

	// 로그인 요청
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String member_loginPro(MemberDataBean member, Model model, HttpServletRequest req) throws Exception {

		model.addAttribute("id");
		model.addAttribute("pw");

		Map<String, Boolean> errors = new HashMap<>();
		model.addAttribute("errors", errors);

		if (member.getId() == null || member.getId().isEmpty())
			errors.put("id", Boolean.TRUE);
		if (member.getPw() == null || member.getPw().isEmpty())
			errors.put("pw", Boolean.TRUE);

		if (!errors.isEmpty())
			return "member/login";

		try {

			MemberDataBean member1 = dbPro.selectById(member.getId());
			if (member1 == null) {
				model.addAttribute("message", "존재하지 않는 회원입니다");
				model.addAttribute("url", "member/login");
				return "alert";
			}
			System.out.println("아이디" + member1.getId());
			System.out.println("비밀번호" + member1.getPw());
			if (!member1.matchPassword(member1.getPw()))
				throw new LoginFailException();
			MemberDataBean loginUser = new MemberDataBean(member1.getId(), member1.getName(), member1.getAuth());
			req.getSession().setAttribute("auth", loginUser);

		} catch (LoginFailException e) {
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return "member/login";
		}
		model.addAttribute("message", "로그인 성공");
		model.addAttribute("url", "main");
		return "alert";
	}

	// 아이디 찾기
	@RequestMapping(value = "findId", method = RequestMethod.GET)
	public String member_findId() throws Exception {
		return "member/findId";
	}

	// 비밀번호 찾기
	@RequestMapping(value = "findpw", method = RequestMethod.GET)
	public String member_findPw() throws Exception {
		return "member/findpw";
	}

	// 로그아웃
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String member_logout(HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "member/main";
	}

	// 회원 탈퇴
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String member_delete(HttpServletRequest req, HttpServletResponse res) throws Exception {
		MemberDataBean loginUser = (MemberDataBean) req.getSession().getAttribute("auth");

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

	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String member_deletePro(HttpServletRequest req, HttpServletResponse res) throws Exception {
		MemberDataBean loginUser = (MemberDataBean) req.getSession().getAttribute("auth");

		String pw = req.getParameter("pw");

		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		if (pw == null || pw.isEmpty())
			errors.put("pw", Boolean.TRUE);

		try {
			// MybatisMemberDao memberDao = MybatisMemberDao.getInstance();
			MemberDataBean myInfo = dbPro.selectById(loginUser.getId());
			dbPro.delete(myInfo);
			req.setAttribute("myInfo", myInfo);
			req.setAttribute("message", "다시가입해줘요 ㅜㅜㅜㅜ");
			req.setAttribute("url", "main");
			HttpSession session = req.getSession(false);
			if (session != null) {
				session.invalidate();
			}
			return "alert";

		} catch (MemberNotFoundException e) {
			req.getServletContext().log("not login", e);
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}

	}

	// 비밀번호 변경 페이지 클릭

	@RequestMapping(value = "changePw")
	public String member_changePw(HttpServletRequest req, HttpServletResponse res) throws Exception {
		MemberDataBean loginUser = (MemberDataBean) req.getSession().getAttribute("auth");

		try {
			// MybatisMemberDao memberDao = MybatisMemberDao.getInstance();
			MemberDataBean myInfo = dbPro.selectById(loginUser.getId());

			req.setAttribute("myInfo", myInfo);
			return "member/changePw";

		} catch (MemberNotFoundException e) {
			req.getServletContext().log("not login", e);
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}

	}

	// 비밀번호 변경
	@RequestMapping(value = "changePw", method = RequestMethod.POST)
	public String member_changePwPro(HttpServletRequest req, HttpServletResponse res) throws Exception {
		MemberDataBean user = (MemberDataBean) req.getSession().getAttribute("auth");

		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);

		String curPwd = req.getParameter("curPwd");
		String newPwd = req.getParameter("newPwd");

		if (curPwd == null || curPwd.isEmpty())
			errors.put("curPwd", Boolean.TRUE);
		if (newPwd == null || newPwd.isEmpty())
			errors.put("newPwd", Boolean.TRUE);

		if (!errors.isEmpty())
			return "member/changePw";

		try {
			// MybatisMemberDao memberDao = MybatisMemberDao.getInstance();
			MemberDataBean member = dbPro.selectById(user.getId());
			if (member == null) {
				throw new MemberNotFoundException();
			}
			System.out.println(member.getPw());
			System.out.println(req.getParameter("curPwd"));
			System.out.println(req.getParameter("newPwd"));
			if (!member.matchPassword(member.getPw())) {
				throw new InvalidPasswordException();
			}
			member.changePassword(newPwd);
			dbPro.update(member);

			req.setAttribute("message", "회원 정보 수정 완료");
			req.setAttribute("url", "member/main");
			return "alert";
		} catch (InvalidPasswordException e) {
			errors.put("badCurPwd", Boolean.TRUE);
			return "member/changePw";
		} catch (MemberNotFoundException e) {
			res.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return "member/main";
		}

	}
}
