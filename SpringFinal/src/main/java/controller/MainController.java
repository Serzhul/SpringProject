package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.BookDataBean;
import mybatis.BookDao;

@Controller
@RequestMapping("/main/")
public class MainController {
	
	@Autowired
	BookDao service;

	public void initProcess(HttpServletRequest request) {
	 //	HttpSession session = request.getSession();
	}

	@RequestMapping(value = "index")
	public String index(Model m) throws Exception {
		int range = 9;
		
		  
		  List<BookDataBean>bestseller = service.getBestSeller(range);
		 List<BookDataBean>bestreview = service.getBestReview(); 
		 List<String>content = service.getBestReviewContent(); 

		  
		  m.addAttribute("bestseller",bestseller); 
		 m.addAttribute("bestreview", bestreview); 
		 m.addAttribute("content", content); 
		 		
		
		return "main/index";
	}
	
	@RequestMapping(value = "bestseller")
	public String bestSeller(Model m) throws Exception {

		int range = 9;
		
		List<BookDataBean>bestseller = service.getBestSeller(range);
		System.out.println("bestseller"+bestseller.toString());
		
		m.addAttribute("bestseller", bestseller);

		return "main/bestseller";
	}
	
	@RequestMapping(value = "searchresult")
	public String searchResult(HttpServletRequest request, Model m) throws Exception {
		String keyword = request.getParameter("keyword");
		
		System.out.println(keyword);
		
		List<BookDataBean>searchresult = service.getSearchResult(keyword);
		
		m.addAttribute("keyword", keyword);
		m.addAttribute("searchresult", searchresult);
		
		return "main/searchresult";
	}
	
	
	
	


	
	
	
}
