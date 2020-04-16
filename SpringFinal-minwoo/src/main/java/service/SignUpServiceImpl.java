package service;

import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.MemberDataBean;
import mybatis.MybatisMemberDaoImpl;


@Service
public class SignUpServiceImpl implements SignUpService {

	String result;
	
	@Autowired
	MybatisMemberDaoImpl dao;

	@Override
	public String idCheck(String id) {

		try {
			result = dao.idCheck(id);
			System.out.println(result);
		} catch (Exception e) {
			System.out.println(result);
			e.printStackTrace();
		}
		return result;
	}



	// 아이디 중복 검사(AJAX)
	@Override
	public void check_id(String id, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(dao.check_id(id));
		out.close();
	}



	@Override
	public String findId(HttpServletResponse response, String email) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public String create_key() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public String join_member(MemberDataBean member, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public void check_email(String email, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
	}



}
