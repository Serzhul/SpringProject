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
import excep.DuplicateldException2;
import excep.InvalidPasswordException;
import excep.LoginFailException;
import excep.MemberNotFoundException;
import model.MemberDataBean;
import mybatis.MybatisMemberDaoImpl;
import pack.EmailDTO;
import service.EmailService;
import service.SignUpService;
import service.KakaoAPI;
import test.NaverLoginBO;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	MybatisMemberDaoImpl dbPro;

	@Autowired
	SignUpService service;
	
	@Autowired
	KakaoAPI kakao;

	@ModelAttribute
	// �޼ҵ忡 �̰� ������ �ش�Ǵ� �޼ҵ��� ����Ÿ���� ������Ʈ�� ������?
	// void�� ������ ������ ������ �ʾ�
	public void initProcess() {
	}

	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String member_main() throws Exception {
		return "main/index";
	}

	// ȸ������ ������ Ŭ��
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String member_joinForm() throws Exception {
		return "member/join_form";
	}

	// produces�� ajax�� ������ �Ѱܹ����� ���� ����
	@RequestMapping(value = "id_check", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String idCheck(HttpServletRequest request) {
		String id = request.getParameter("id");
		String result = service.idCheck(id);
		return result;
	}

	// ȸ������ ��û
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String member_joinPro(MemberDataBean newMember, Model model, HttpServletRequest req) throws Exception {
		// Model�� ���� �Ʒ�ó�� addAttribute�� �� ����ϰ�
		// @ModelAttritube�� �� �ָ� �״�� �ٷ� ���󰣴�.
		Map<String, Boolean> errors = new HashMap<>();
		model.addAttribute("errors", errors);
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
			model.addAttribute("message", "ȯ���մϴ� :D");
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

	// �α��� ȭ��
	@RequestMapping(value = "login_2")
	public String member_login() throws Exception {
		return "redirect:/member/login";
	}

	// �α��� ��û
	@RequestMapping(value = "login_2", method = RequestMethod.POST)
	public String member_loginPro(MemberDataBean inputData, Model model, HttpServletRequest req) throws Exception {
		Map<String, Boolean> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		try {
			// ������ ��������
			MemberDataBean member = dbPro.selectById(inputData.getId());
			if (member == null) {
				throw new LoginFailException();
			}
			if (!inputData.matchPassword(member.getPw()))
				throw new LoginFailException();
			MemberDataBean loginUser = new MemberDataBean(member.getId(), member.getName(), member.getAuth());
			req.getSession().setAttribute("member", loginUser);
		} catch (LoginFailException e) {
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return "member/login";
		}
		return "redirect:/main/index";
	}

	// ��й�ȣ ã��
	@RequestMapping(value = "find_pw", method = RequestMethod.GET)
	public String member_findPw() throws Exception {
		return "member/find_pw";
	}

	// �α׾ƿ�
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String member_logout(HttpServletRequest req, Model model) throws Exception {
		HttpSession session = req.getSession(false);
		if (session != null) {
			session.invalidate();
		  
		}
		return "main/index";
	}

	// ȸ�� Ż��
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

	// ȸ�� Ż��
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String member_deletePro(MemberDataBean inputData, Model model, HttpSession session, RedirectAttributes rttr)
			throws Exception {

		Map<String, Boolean> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		try {
			MemberDataBean deletememberId = dbPro.selectById(inputData.getId());
			if ((deletememberId.getId().equals(inputData.getId()))
					&& (deletememberId.getPw().equals(inputData.getPw()))) {
				dbPro.delete(inputData);
				session.invalidate();
				return "redirect:/main/index";
			} else if (!deletememberId.getPw().equals(inputData.getPw())) {
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
	// ��й�ȣ ���� ������ Ŭ��

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

	// ��й�ȣ ����
	@RequestMapping(value = "change_pw", method = RequestMethod.POST)
	public String member_changePwPro(MemberDataBean inputData, Model model) throws Exception {

		Map<String, Boolean> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		try {
			MemberDataBean member = dbPro.selectById(inputData.getId());
			if (inputData.getPw().equals(member.getPw())) {
				throw new InvalidPasswordException();
			} else if (inputData.getNewPw().equals(member.getId())) {
				throw new DuplicateldException();
			} else if (!inputData.getPw().equals(member.getPw())) {
				throw new DuplicateldException2();
			} else {
				member.changePassword(inputData.getNewPw());
				dbPro.update(inputData);
			}
			model.addAttribute("message", "ȸ�� ���� ���� �Ϸ�");
			model.addAttribute("url", "main");
			return "alert";
		} catch (DuplicateldException e) {
			errors.put("WrongPw", Boolean.TRUE);
			return "member/change_pw";
		} catch (InvalidPasswordException e) {
			errors.put("badCurPwd", Boolean.TRUE);
			return "member/change_pw";
		} catch (DuplicateldException2 e) {
			errors.put("WrongPw2", Boolean.TRUE);
			return "member/change_pw";
		}
	}

	// ���̵� ã��
	@RequestMapping(value = "find_id", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("email") String email, Model model)
			throws Exception {
		Map<String, Boolean> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		try {
			MemberDataBean member = dbPro.selectByEmail(email);
			model.addAttribute("id", service.findId(response, email));
			model.addAttribute("member", member);
			if (member == null) {
				throw new MemberNotFoundException();
			}
		} catch (MemberNotFoundException e) {
			errors.put("noMember", Boolean.TRUE);
			return "member/find_id_form";
		}
		return "member/find_id";
	}

	// ���̵� ã��
	@RequestMapping(value = "find_id_form", method = RequestMethod.GET)
	public String find_id_form() throws Exception {
		return "member/find_id_form";
	}

	// ��й�ȣ ã�� ��
	@RequestMapping(value = "find_pw_form")
	public String find_pw_form() throws Exception {
		return "member/find_pw_form";
	}

	// ���̺귯��
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
	public String sendEmailAction(MemberDataBean inputData, Model model, HttpServletRequest req) throws Exception {
		Map<String, Boolean> errors = new HashMap<>();

		model.addAttribute("errors", errors);
		MemberDataBean member = dbPro.allByIdAndEmail(inputData);
		try {
			if (member == null) {
				throw new MemberNotFoundException();
			}

			if (inputData.getEmail().equals(member.getEmail()) && inputData.getId().equals(member.getId())) {
				StringBuffer sb = new StringBuffer();
				String e_mail = inputData.getEmail();
				String id = inputData.getId();
				String pw = member.getPw();
				System.out.println(pw);
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
				sb.append("<h1 style=font-size: 32px; font-weight: 400; margin: 0;>��й�ȣ ã�� ���</h1>");
				sb.append("</td>   </tr>   </table>        </td>    </tr>    <tr>");
				sb.append("        <td align=center style=padding: 0px 10px 0px 10px;>");
				sb.append("<table border=0 cellpadding=0 cellspacing=0 width=480 >");
				sb.append("<tr>");
				sb.append(
						"<td align=center style=padding: 20px 30px 40px 30px; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;>");
				sb.append("<p style=margin: 0;>" + "<b>" + id + "</b>" + "���� ��й�ȣ��" + "<b>" + pw + "</b>"
						+ "�Դϴ�. <br> �α����� �Ϸ��� �Ʒ� ��ư�� Ŭ���� �ּ���. </p>");
				sb.append("</td>   </tr>  <td bgcolor=#ffffff align=left>    <tr>");
				sb.append("<td bgcolor=#ffffff align=center style=padding: 20px 30px 60px 30px;>");
				sb.append("<table border=0 cellspacing=0 cellpadding=0>");
				sb.append(
						"<tr> <td align=center style=border-radius: 3px;><a href=http://211.63.89.76:8082/SpringFinal/member/login target=_blank style=font-size: 20px; font-family: Helvetica, Arial, sans-serif; color: #ffffff; text-decoration: none; text-decoration: none; padding: 15px 25px; border-radius: 2px; border: 1px solid #7c72dc; display: inline-block;>�α��� �Ϸ�����</a></td>");
				sb.append("</tr>    </table>  </body></html>");
				email.setContent(sb.toString());
				email.setReceiver(e_mail);
				email.setSubject(id + "���� ��й�ȣ ã�� �Դϴ�");
				emailService.SendEmail(email);
				return "member/find_pw";
			}
		} catch (MemberNotFoundException e) {
			errors.put("MemberNotFoundException", Boolean.TRUE);
			return "member/find_pw_form";
		}
		return "member/find_pw";
	}
	// �Ʒ��� ���̹�, īī�� �α���

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	// �α��� ù ȭ�� ��û �޼ҵ�
	@RequestMapping(value = "login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		/*
		 * ���̹����̵�� ���� URL�� �����ϱ� ���Ͽ� naverLoginBOŬ������ getAuthorizationUrl�޼ҵ� ȣ��
		 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("���̹�:" + naverAuthUrl);
		// ���̹�
		model.addAttribute("url", naverAuthUrl);
		return "member/login";
	}

	// ���̹� �α��� ������ callbackȣ�� �޼ҵ�
	@RequestMapping(value = "callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session,
			HttpServletRequest req) throws IOException, ParseException {
		Map<String, Boolean> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		System.out.println("����� callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 1. �α��� ����� ������ �о�´�.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String������
																// json������
		/**
		 * apiResult json ���� {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		// 2. String������ apiResult�� json���·� �ٲ�
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		System.out.println(obj);
		// 3. ������ �Ľ�
		// Top���� �ܰ� _response �Ľ�
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		MemberDataBean member_id = dbPro.selectById((String) response_obj.get("id"));
		String id = (String) response_obj.get("id");
		String e_mail = (String) response_obj.get("email");

		System.out.println(member_id);
		System.out.println(id);
	//	System.out.println(member_email.getId());
		System.out.println(e_mail);

		if (id == "īī��" || member_id == null) {
			/* String id = (String) response_obj.get("email"); */
			String id2 = (String) response_obj.get("id");
			String pw = (String) "1111";
			String email = (String) response_obj.get("email");
			String name = (String) response_obj.get("name");
			String birth = (String) response_obj.get("birthday");
			String gender = (String) response_obj.get("gender");
			System.out.printf(id, pw, email, name, birth, gender);
			MemberDataBean member = new MemberDataBean(id2, pw, email, name, birth, gender);
			dbPro.insert(member);
			System.out.println("DB�� ȸ�� ���� ���� �Ϸ�");
		}
		// response�� nickname�� �Ľ�
		String name = (String) response_obj.get("name");
		System.out.println(name);
		// 4.�Ľ� �г��� �������� ����
		MemberDataBean member = dbPro.selectById((String) response_obj.get("id"));
		MemberDataBean loginUser = new MemberDataBean(member.getId(), member.getName(), member.getAuth());
		req.getSession().setAttribute("member", loginUser);
		session.setAttribute("member", loginUser); // ���� ����
		model.addAttribute("result", apiResult);
		return "member/socialLogin";
	}


	@RequestMapping(value = "kakao_login", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	public String login(Model model, @RequestParam("code") String code, HttpSession session, HttpServletRequest req) {
	//	System.out.println("code�� : " + code);

		String access_Token = kakao.getAccessToken(code);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		System.out.println(userInfo.toString());
		System.out.println(userInfo);
		MemberDataBean member1 = dbPro.selectById((String) userInfo.get("nickname"));
		MemberDataBean loginUser = new MemberDataBean(member1.getId(), member1.getName(), member1.getAuth());
	    session.setAttribute("member", loginUser);
		model.addAttribute("result", apiResult);
		return "member/socialLogin";
	}
	
}