package service;

import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.MemberDataBean;


@Service
public class SignUpServiceImpl implements SignUpService {

	int result;
	@Autowired
	MybatisMemberDaoImpl dao;

	@Override
	public int idCheck(String id) {

		try {
			result = dao.idCheck(id);
			System.out.println(result);
		} catch (Exception e) {
			System.out.println(result);
			e.printStackTrace();
		}
		return result;
	}

	// 아이디 찾기
	@Override
	public String findId(HttpServletResponse response, String email) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = dao.find_id(email);
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}

	// 난수 생성
	@Override
	public String create_key() throws Exception {
		String key = "";
		Random rd = new Random();

		for (int i = 0; i < 8; i++) {
			key += rd.nextInt(10);
		}
		return key;
	}


	// 아이디 중복 검사(AJAX)
	@Override
	public void check_id(String id, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(dao.check_id(id));
		out.close();
	}

	// 이메일 중복 검사(AJAX)
	@Override
	public void check_email(String email, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(dao.check_email(email));
		out.close();
	}

	// 회원가입
	@Override
	public String join_member(MemberDataBean member, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}




	


}
