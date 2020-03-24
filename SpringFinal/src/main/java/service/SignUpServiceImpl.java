package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import model.MemberDataBean;

@Service
public class SignUpServiceImpl implements SignUpService {

	int result;
	@Autowired
	MybatisMemberDao dao;

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



}
