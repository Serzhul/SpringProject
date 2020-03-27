/*package controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mybatis.MybatisMemberDao;

@Controller
@RequestMapping
public class MainController{
	
	@Autowired
	MybatisMemberDao dbPro;

	public void initProcess() {
		// TODO Auto-generated method stub

	}

	// 메인페이지
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String member_main() throws Exception {
		return "main";
	}
	@RequestMapping(value = "main", method = RequestMethod.POST)
	public String member_mainPro() throws Exception {
		return "main";
	}
}*/