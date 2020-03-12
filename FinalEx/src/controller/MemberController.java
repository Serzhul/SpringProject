package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import anno.ActionAnnotation;
import anno.RequestMapping;
import anno.RequestMapping.RequestMethod;
import dao.MybatisMemberDao;

import excep.DuplicateldException;
import excep.InvalidPasswordException;
import excep.LoginFailException;
import excep.MemberNotFoundException;
import model.MemberDataBean;

public class MemberController extends ActionAnnotation {

	@Override
	public void initProcess(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

	}

	// 메인페이지
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String member_main(HttpServletRequest req, HttpServletResponse res) throws Exception {
		return "/view/main.jsp";
	}

	// 조인 페이지 클릭
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String member_joinForm(HttpServletRequest req, HttpServletResponse res) throws Exception {
		return "/view/member/joinForm.jsp";
	}

	// 조인 요청
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String member_joinPro(HttpServletRequest req, HttpServletResponse response) throws Exception {
		MemberDataBean newMember = new MemberDataBean(req.getParameter("id"), req.getParameter("pw"),
				req.getParameter("email"), req.getParameter("name"), req.getParameter("birth"),
				req.getParameter("gender"), req.getParameter("confirmPw"));
		System.out.println(newMember.toString());
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);

		newMember.vaildate(errors);

		if (!errors.isEmpty())
			return "/view/member/joinForm.jsp";

		try {
			MybatisMemberDao memberDao = MybatisMemberDao.getInstance();
			MemberDataBean member = memberDao.selectById(newMember.getId());
			if (member != null)
				throw new DuplicateldException();

			memberDao.insert(newMember);

			MemberDataBean joinUser = new MemberDataBean(newMember.getId(), newMember.getName(), newMember.getAuth());
			req.getSession().setAttribute("auth", joinUser);

			req.setAttribute("message", "회원가입성공했다능");
			req.setAttribute("url", "main");
			return "/view/alert.jsp";

		} catch (DuplicateldException e) {
			errors.put("duplicateId", Boolean.TRUE);
			return "/view/member/joinForm.jsp";
		}
	}

	// 로그인 화면
	@RequestMapping(value = "login")
	public String member_login(HttpServletRequest req, HttpServletResponse res) throws Exception {
		return "/view/member/login.jsp";
	}

	// 로그인 요청
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String member_loginPro(HttpServletRequest req, HttpServletResponse res) throws Exception {

		String id = req.getParameter("id");
		String pw = req.getParameter("pw");

		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);

		if (id == null || id.isEmpty())
			errors.put("id", Boolean.TRUE);
		if (pw == null || pw.isEmpty())
			errors.put("pw", Boolean.TRUE);

		if (!errors.isEmpty())
			return "/view/member/login.jsp";

		try {
			MybatisMemberDao memberDao = MybatisMemberDao.getInstance();

			MemberDataBean member = memberDao.selectById(id);
			if (member == null){
				req.setAttribute("message", "존재하지 않는 회원입니다");
				req.setAttribute("url", "member/login");
				return "/view/alert.jsp";
			}
			System.out.println("아이디" + member.getId());
			System.out.println("비밀번호" + member.getPw());
			if (!member.matchPassword(pw))
				throw new LoginFailException();
			MemberDataBean loginUser = new MemberDataBean(member.getId(), member.getName(), member.getAuth());
			req.getSession().setAttribute("auth", loginUser);

		} catch (LoginFailException e) {
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return "/view/member/login.jsp";
		}
		req.setAttribute("message", "로그인 성공");
		req.setAttribute("url", "member/main");
		return "/view/alert.jsp";
	}

	private String trim(String str) {
		return str == null ? null : str.trim();
	}

	// 아이디 찾기
	@RequestMapping(value = "findId", method = RequestMethod.GET)
	public String member_findId(HttpServletRequest req, HttpServletResponse res) throws Exception {
		return "/view/member/findId.jsp";
	}

	// 비밀번호 찾기
	@RequestMapping(value = "findpw", method = RequestMethod.GET)
	public String member_findPw(HttpServletRequest req, HttpServletResponse res) throws Exception {
		return "/view/member/findpw.jsp";
	}

	// 로그아웃
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String member_logout(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "/view/main.jsp";
	}

	// 회원 탈퇴
	@RequestMapping(value = "delete")
	public String member_delete(HttpServletRequest req, HttpServletResponse res) throws Exception {
		MemberDataBean loginUser = (MemberDataBean) req.getSession().getAttribute("auth");

		try {
			MybatisMemberDao memberDao = MybatisMemberDao.getInstance();
			MemberDataBean myInfo = memberDao.selectById(loginUser.getId());

			req.setAttribute("myInfo", myInfo);
			return "/view/member/delete.jsp";

		} catch (MemberNotFoundException e) {
			req.getServletContext().log("not login", e);
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
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
			MybatisMemberDao memberDao = MybatisMemberDao.getInstance();
			MemberDataBean myInfo = memberDao.selectById(loginUser.getId());
			memberDao.delete(myInfo);
			req.setAttribute("myInfo", myInfo);
			req.setAttribute("message", "다시가입해줘요 ㅜㅜㅜㅜ");
			req.setAttribute("url", "main");
			HttpSession session = req.getSession(false);
			if (session != null) {
				session.invalidate();
			}
			return "/view/alert.jsp";

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
			MybatisMemberDao memberDao = MybatisMemberDao.getInstance();
			MemberDataBean myInfo = memberDao.selectById(loginUser.getId());

			req.setAttribute("myInfo", myInfo);
			return "/view/member/changePw.jsp";

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
			return "/view/member/changePw.jsp";

		try {
			MybatisMemberDao memberDao = MybatisMemberDao.getInstance();
			MemberDataBean member = memberDao.selectById(user.getId());
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
			memberDao.update(member);

			req.setAttribute("message", "회원 정보 수정 완료");
			req.setAttribute("url", "main");
			return "/view/alert.jsp";
		} catch (InvalidPasswordException e) {
			errors.put("badCurPwd", Boolean.TRUE);
			return "/view/member/changePw.jsp";
		} catch (MemberNotFoundException e) {
			res.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return "/main.jsp";
		}

	}
}
