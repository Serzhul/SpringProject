package service;

import javax.servlet.http.HttpServletResponse;

import model.MemberDataBean;

public interface SignUpService {
	
	//아이디 중복 체크
	public String idCheck(String id);
	
	//아이디 찾기
	String findId(HttpServletResponse response, String email) throws Exception;

	// 인증키 생성
	public String create_key() throws Exception;

	String join_member(MemberDataBean member, HttpServletResponse response) throws Exception;
	
	public void check_id(String id, HttpServletResponse response) throws Exception;

	public void check_email(String email, HttpServletResponse response) throws Exception;


}
