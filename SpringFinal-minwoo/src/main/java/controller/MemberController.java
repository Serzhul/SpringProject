package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;

import excep.DuplicateEmailException;
import excep.DuplicateldException;
import excep.InvalidPasswordException;
import excep.LoginFailException;
import excep.MemberNotFoundException;
import model.MemberDataBean;
import mybatis.MybatisMemberDaoImpl;
import pack.EmailDTO;
import service.EmailService;
import service.SignUpService;
import test.NaverLoginBO;

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
		String result = service.idCheck(id);
		return result;
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
	@RequestMapping(value = "login_2")
	public String member_login() throws Exception {
		return "redirect:/member/login";
	}

	// 로그인 요청
	@RequestMapping(value = "login_2", method = RequestMethod.POST)
	public String member_loginPro(MemberDataBean inputData, Model model, HttpServletRequest req) throws Exception {
		Map<String, Boolean> errors = new HashMap<>();
		model.addAttribute("errors", errors);

		if (inputData.getId() == null || inputData.getId().isEmpty())
			errors.put("id", Boolean.TRUE);
		if (inputData.getPw() == null || inputData.getPw().isEmpty())
			errors.put("pw", Boolean.TRUE);
		if (!errors.isEmpty())
			return "redirect:/member/login";
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
			return "redirect:/member/login";
		}
		model.addAttribute("message", "로그인 성공");
		model.addAttribute("url", "main");
		return "redirect:/main/index";
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
	public String member_deletePro(MemberDataBean inputData, Model model, HttpSession session, RedirectAttributes rttr)
			throws Exception {

		Map<String, Boolean> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		try {
			MemberDataBean deletememberId = dbPro.selectById(inputData.getId());
			System.out.println("이건 DB에 있는 아이디" + deletememberId.getId());
			System.out.println("이건 DB에 있는 패스워드" + deletememberId.getPw());
			//
			System.out.println("이건 히든 입력 값 아이디" + inputData.getId());
			System.out.println("이건 사용자 입력 값 패스워드" + inputData.getPw());
			if ((deletememberId.getId().equals(inputData.getId()))
					&& (deletememberId.getPw().equals(inputData.getPw()))) {
				System.out.println("삭제가 될 거에유");
				dbPro.delete(inputData);
				session.invalidate();
				model.addAttribute("message", "안녕히가세요...");
				model.addAttribute("url", "main");
				return "alert";
			} else if (!deletememberId.getPw().equals(inputData.getPw())) {
				System.out.println("비밀번호 에러지롱");
				errors.put("wrongPw", Boolean.TRUE);
				return "member/delete";
			} else if (inputData.getPw() == null) {
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
			} else if (inputData.getNewPw().equals(member.getId())) {
				errors.put("wrongPw", Boolean.TRUE);
				System.out.println("아이디와 비밀번호가 같을 수 없슈");
				throw new InvalidPasswordException();
			} else if (inputData.getPw().equals(member.getPw())) {
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
		return "member/find_id";
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

	// 라이브러리
	@RequestMapping(value = "my_library")
	public String my_library() throws Exception {
		return "member/my_library";
	}

	@Autowired
	EmailService emailService; 

	@Autowired
	private EmailDTO email;

	@RequestMapping(value = "mail_form", method = RequestMethod.GET) 
	public String write() {
		return "member/mailForm"; 
	}

	@RequestMapping(value = "mail_form", method = RequestMethod.POST)
	public String sendEmailAction(MemberDataBean inputData, Model model, HttpServletResponse res) throws Exception {
		Map<String, Boolean> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		MemberDataBean member = dbPro.allByIdAndEmail(inputData);
		if (inputData.getEmail() == null || inputData.getEmail().isEmpty()) {
			errors.put("badEmail", Boolean.TRUE);
			System.out.println("Email");
		}
		if (inputData.getId() == null || inputData.getId().isEmpty()) {
			errors.put("badId", Boolean.TRUE);
			System.out.println("Id");
		}
		/*
		 * if (inputData.getPw() == null || inputData.getPw().isEmpty()) {
		 * errors.put("IdAndEmailNo", Boolean.TRUE); System.out.println("Pw"); }
		 */
		if (!errors.isEmpty())
			return "member/find_pw_form";
		try {
			String e_mail = inputData.getEmail();
			String id = inputData.getId();
			String pw = member.getPw();
			System.out.println(e_mail);
			System.out.println(id);
			System.out.println(pw);
			if (inputData.getEmail().equals(member.getEmail()) && inputData.getId().equals(member.getId())) {
				StringBuffer sb = new StringBuffer();
				sb.append("<html>");
				sb.append("<head>");
				sb.append("<title></title>");
				sb.append("<meta http-equiv=ontent-Typecontent=text/html; charset=utf-8/>");
				sb.append("</head>");
				sb.append("<body style=background-color: #f4f4f4; margin: 0 !important; padding: 0 !important;>");
				sb.append("<table border=0 cellpadding=0 cellspacing=0 width=100%>");
				sb.append("<tr>");
				sb.append("<td bgcolor=#17C66F align=center>");
				sb.append("<table border=0 cellpadding=0 cellspacing=0 width=480 >");
				sb.append("<tr>");
				sb.append("<td align=center valign=top style=padding: 40px 10px 40px 10px;>");
				sb.append(
						"</td> </tr>  </table>    </td>  </tr>   <tr>   <td bgcolor=#17C66F align=center style=padding: 0px 10px 0px 10px;>");
				sb.append("<table border=0 cellpadding=0 cellspacing=0 width=480 >");
				sb.append(
						"<tr> <td bgcolor=#ffffff align=center valign=top style=padding: 40px 20px 20px 20px; border-radius: 4px 4px 0px 0px; color: #111111; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 48px; font-weight: 400; letter-spacing: 4px; line-height: 48px;>");
				sb.append("<h1 style=font-size: 32px; font-weight: 400; margin: 0;>비밀번호 찾기 결과</h1>");
				sb.append("</td>   </tr>   </table>        </td>    </tr>    <tr>");
				sb.append("        <td align=center style=padding: 0px 10px 0px 10px;>");
				sb.append("<table border=0 cellpadding=0 cellspacing=0 width=480 >");
				sb.append("<tr>");
				sb.append(
						"<td align=center style=padding: 20px 30px 40px 30px; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;>");
				sb.append("<p style=margin: 0; text-align: center>" + "<b>" + id + "</b>" + "님의 비밀번호는" + "<b>" + pw
						+ "</b>" + "입니다. <br> 로그인을 하려면 아래 버튼을 클릭해 주세요. </p>");
				sb.append("</td>   </tr>  <td bgcolor=#ffffff align=left>    <tr>");
				sb.append("<td bgcolor=#ffffff align=center style=padding: 20px 30px 60px 30px;>");
				sb.append("<table border=0 cellspacing=0 cellpadding=0>");
				sb.append(
						"<tr> <td align=center style=border-radius: 3px;><a href=http://localhost:8082/SpringFinal/member/login target=_blank style=font-size: 20px; font-family: Helvetica, Arial, sans-serif; color: #ffffff; text-decoration: none; text-decoration: none; padding: 15px 25px; border-radius: 2px; border: 1px solid #7c72dc; display: inline-block;>로그인 하러가기</a></td>");
				sb.append("</tr>    </table>  </body></html>");
				email.setSender("Spring Books 비밀번호 찾기");
				email.setContent(sb.toString());
				email.setReceiver(e_mail);
				email.setSubject(id + "님의 비밀번호 찾기 입니다");
				emailService.SendEmail(email);
				return "member/find_pw";
			}
		} catch (MemberNotFoundException e) {
			errors.put("IdAndEmailX", Boolean.TRUE);
			return "member/find_pw";
		}
		return "member/find_pw";
	}
	// 아래는 네이버, 카카오 로그인

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		/*
		 * 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출
		 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		// 네이버
		model.addAttribute("url", naverAuthUrl);
		return "member/login";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		Map<String, Boolean> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의
																// json데이터
		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		System.out.println(obj);
		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		MemberDataBean member_email = dbPro.selectByEmail((String) response_obj.get("email"));
		String e_mail = (String) response_obj.get("email");

		System.out.println(member_email);
		System.out.println(e_mail);

		if (member_email == null) {
			/* String id = (String) response_obj.get("email"); */
			String id = (String) response_obj.get("id");
			String pw = (String) "1111";
			String email = (String) response_obj.get("email");
			String name = (String) response_obj.get("name");
			String birth = (String) response_obj.get("birthday");
			String gender = (String) response_obj.get("gender");
			System.out.printf(id, pw, email, name, birth, gender);
			MemberDataBean newMember = new MemberDataBean(id, pw, email, name, birth, gender);
			dbPro.insert(newMember);
			System.out.println("DB에 회원 정보 저장 완료");
		}
		// response의 nickname값 파싱
		String name = (String) response_obj.get("name");
		System.out.println(name);
		// 4.파싱 닉네임 세션으로 저장
		session.setAttribute("sessionId", name); // 세션 생성
		model.addAttribute("result", apiResult);
		return "member/socialLogin";
	}
}