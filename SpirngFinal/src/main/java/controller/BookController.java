package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.BookDataBean;
import mybatis.BookDao;

@Controller
@RequestMapping("/book/")
public class BookController {

	@Autowired
	BookDao service; 
	
	public void initProcess(HttpServletRequest request) {
		HttpSession session = request.getSession();
	}

	@RequestMapping(value = "book_list")
	public String index(Model m) throws Exception {
		
		List<BookDataBean> booklist = service.getBooks();
		
		m.addAttribute("booklist", booklist);
		
		return "book/test";
	}
	
	
}
